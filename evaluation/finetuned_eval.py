# evaluation/finetuned_eval.py
#
# Phase 3: Fine-tuned model evaluation on the Spider dev set.
#   Base:    Qwen/Qwen2.5-Coder-7B-Instruct  (4-bit NF4)
#   Adapter: Gansaw98/qwen2.5-coder-7b-text2sql-spider  (LoRA, trained on Kaggle)
#            -> see training/text-to-sql.ipynb
#
# Every inference parameter here is matched to the training notebook so the model
# sees byte-identical prompts to what it trained on. If any of these drift, the
# fine-tuned model's accuracy drops silently:
#   - SYSTEM_PROMPT        == notebook Cell 5  (NOT the Groq baseline's wording)
#   - user message format  == notebook Cell 5  ("### Database Schema:\n...\n\n### Question:\n...")
#   - get_schema_prompt()  == notebook Cell 4  (imported from schema_utils.py, the shared copy)
#   - MODEL_ID             == notebook Cell 5/6
#   - 4-bit NF4 base load   == notebook Cell 6
#   - adapter repo id       == notebook Cell 8b
#
# Outputs (names matched to metrics.py and the Yale-LILY evaluation.py command):
#   results/finetuned_predictions.json   — full metadata per example
#   results/finetuned_predicted.sql      — "SQL<TAB>db_id" lines, aligned to dev_gold.sql
#
# Usage (GPU strongly recommended — this is a 7B model):
#   python evaluation/finetuned_eval.py
#   python evaluation/finetuned_eval.py --resume      # continue from last checkpoint
#   python evaluation/finetuned_eval.py --limit 50    # smoke test on first 50 examples

import os
import re
import json
import glob
import argparse
from pathlib import Path

import torch
from tqdm import tqdm
from dotenv import load_dotenv
from transformers import AutoTokenizer, AutoModelForCausalLM, BitsAndBytesConfig
from peft import PeftModel

from schema_utils import load_schema_index, get_schema_prompt
from sql_executor import get_db_path, execute_sql, is_valid_sql, results_match

# ---------------------------------------------------------------------------
# Config — every value below mirrors training/text-to-sql.ipynb
# ---------------------------------------------------------------------------

load_dotenv()

HF_TOKEN     = os.getenv("HF_TOKEN")                       # needed only if the adapter repo is private
MODEL_ID     = "Qwen/Qwen2.5-Coder-7B-Instruct"           # notebook Cell 5/6
ADAPTER_REPO = os.getenv("HF_REPO_ID", "Gansaw98/qwen2.5-coder-7b-text2sql-spider")  # notebook Cell 8b

# Decoding. Greedy == deterministic, mirrors the Groq baseline's temperature=0.
# 256 new tokens matches the baseline's max_tokens; no Spider query is longer.
MAX_NEW_TOKENS = 256

# EXACT system prompt from notebook Cell 5 (also training/_measure_lengths.py).
# Do NOT substitute the Groq baseline's wording — the model was fine-tuned on THIS string.
SYSTEM_PROMPT = (
    "You are an expert SQL generator. "
    "Given a database schema and a natural language question, "
    "write the correct SQL query. "
    "Output only the SQL query with no explanation or markdown."
)

DEVICE = "cuda" if torch.cuda.is_available() else "cpu"

# ---------------------------------------------------------------------------
# Paths — prefer the local repo layout, fall back to /kaggle/input so the same
# script runs unchanged inside a Kaggle GPU notebook (where training happened).
# ---------------------------------------------------------------------------

ROOT_DIR    = Path(__file__).parent.parent
RESULTS_DIR = ROOT_DIR / "results"
RESULTS_DIR.mkdir(parents=True, exist_ok=True)

OUTPUT_JSON = RESULTS_DIR / "finetuned_predictions.json"
OUTPUT_SQL  = RESULTS_DIR / "finetuned_predicted.sql"


def _find(name: str) -> Path:
    """Locate a Spider data file locally, else under /kaggle/input."""
    local = ROOT_DIR / "data" / "spider" / name
    if local.exists():
        return local
    hits = glob.glob(f"/kaggle/input/**/{name}", recursive=True)
    if hits:
        return Path(hits[0])
    raise FileNotFoundError(
        f"Could not find '{name}' in data/spider/ or under /kaggle/input."
    )


def _find_db_dir():
    """Locate the Spider SQLite 'database/' dir; return None if absent.
    When None, the quick local exec checks are skipped — the official EX still
    comes from Yale-LILY evaluation.py run locally where the DBs exist."""
    local = ROOT_DIR / "data" / "spider" / "database"
    if local.exists():
        return local
    hits = glob.glob("/kaggle/input/**/database", recursive=True)
    return Path(hits[0]) if hits else None


# ---------------------------------------------------------------------------
# SQL extraction — identical logic to groq_baseline.extract_sql. The fine-tuned
# model is trained to emit bare SQL, but strip stray markdown / prose defensively.
# ---------------------------------------------------------------------------

def extract_sql(response_text: str) -> str:
    text = response_text.strip()

    # 1. Markdown code block (```sql ... ``` or ``` ... ```)
    block = re.search(r"```(?:sql)?\s*(.*?)\s*```", text, re.DOTALL | re.IGNORECASE)
    if block:
        return block.group(1).strip()

    # 2. First SQL keyword at line start
    sql_match = re.search(
        r"^(SELECT|WITH|INSERT|UPDATE|DELETE|CREATE)\b.*",
        text,
        re.DOTALL | re.IGNORECASE | re.MULTILINE,
    )
    if sql_match:
        return sql_match.group(0).strip()

    # 3. Return as-is — let the evaluator handle it
    return text


# ---------------------------------------------------------------------------
# Model loading
# ---------------------------------------------------------------------------

def load_model():
    if HF_TOKEN:
        from huggingface_hub import login
        login(token=HF_TOKEN)

    print(f"Loading tokenizer: {MODEL_ID}")
    tokenizer = AutoTokenizer.from_pretrained(MODEL_ID, trust_remote_code=True)

    if DEVICE == "cuda":
        # 4-bit NF4 — identical to notebook Cell 6.
        bnb_config = BitsAndBytesConfig(
            load_in_4bit=True,
            bnb_4bit_quant_type="nf4",
            bnb_4bit_compute_dtype=torch.float16,
            bnb_4bit_use_double_quant=True,
        )
        print(f"Loading base model in 4-bit on GPU: {torch.cuda.get_device_name(0)}")
        base = AutoModelForCausalLM.from_pretrained(
            MODEL_ID,
            quantization_config=bnb_config,
            dtype=torch.float16,
            device_map="auto",
            trust_remote_code=True,
        )
    else:
        print("WARNING: No CUDA GPU detected.")
        print("         Loading in fp32 on CPU — a full 1034-example run will be")
        print("         extremely slow (likely many hours). Strongly prefer a GPU:")
        print("         run this same script on Kaggle (T4), exactly like training did.")
        base = AutoModelForCausalLM.from_pretrained(
            MODEL_ID,
            dtype=torch.float32,
            trust_remote_code=True,
        )

    print(f"Attaching LoRA adapter: {ADAPTER_REPO}")
    model = PeftModel.from_pretrained(base, ADAPTER_REPO)
    model.eval()
    model.config.use_cache = True   # KV cache on for faster generation (was off during training)

    pad_id = tokenizer.pad_token_id
    if pad_id is None:
        pad_id = tokenizer.eos_token_id

    return tokenizer, model, pad_id


# ---------------------------------------------------------------------------
# Single-example generation — prompt construction matched to training
# ---------------------------------------------------------------------------

@torch.no_grad()
def generate_sql(tokenizer, model, pad_id, schema: str, question: str) -> str:
    # User message — EXACT format from notebook Cell 5.
    user_content = f"### Database Schema:\n{schema}\n\n### Question:\n{question}"
    messages = [
        {"role": "system", "content": SYSTEM_PROMPT},
        {"role": "user",   "content": user_content},
    ]

    # Training applied the chat template to prompt+completion with
    # add_generation_prompt=False. The matching inference form is: template the
    # PROMPT only, with add_generation_prompt=True (appends "<|im_start|>assistant\n").
    enc = tokenizer.apply_chat_template(
        messages,
        add_generation_prompt=True,
        return_tensors="pt",
        return_dict=True,
    )
    input_ids      = enc["input_ids"].to(DEVICE)
    attention_mask = enc["attention_mask"].to(DEVICE)

    out = model.generate(
        input_ids=input_ids,
        attention_mask=attention_mask,
        max_new_tokens=MAX_NEW_TOKENS,
        do_sample=False,        # greedy — deterministic, mirrors Groq temperature=0
        num_beams=1,
        pad_token_id=pad_id,
    )

    gen_ids = out[0][input_ids.shape[1]:]       # only the newly generated tokens
    return tokenizer.decode(gen_ids, skip_special_tokens=True).strip()


# ---------------------------------------------------------------------------
# Save — identical format to groq_baseline._save_results. Sorted by index so the
# .sql file stays line-aligned with dev_gold.sql for Yale-LILY evaluation.py.
# ---------------------------------------------------------------------------

def _save_results(results: list):
    ordered = sorted(results, key=lambda x: x["index"])

    with open(OUTPUT_JSON, "w", encoding="utf-8") as f:
        json.dump(ordered, f, indent=2, ensure_ascii=False)

    with open(OUTPUT_SQL, "w", encoding="utf-8") as f:
        for ex in ordered:
            sql = ex.get("predicted_sql", "").replace("\n", " ").strip()
            if not sql:
                sql = "SELECT 1"   # placeholder so eval.py line count matches dev_gold.sql
            f.write(f"{sql}\t{ex['db_id']}\n")


# ---------------------------------------------------------------------------
# Main evaluation loop
# ---------------------------------------------------------------------------

def run_evaluation(resume: bool = False, limit: int | None = None):
    dev_path    = _find("dev.json")
    tables_path = _find("tables.json")
    db_dir      = _find_db_dir()

    print(f"Dev set:    {dev_path}")
    print(f"Schemas:    {tables_path}")
    print(f"Databases:  {db_dir if db_dir else 'NOT FOUND — quick exec checks will be skipped'}")

    with open(dev_path, encoding="utf-8") as f:
        dev_data = json.load(f)
    if limit is not None:
        dev_data = dev_data[:limit]
    print(f"  {len(dev_data)} dev examples.")

    schema_index = load_schema_index(tables_path)
    print(f"  {len(schema_index)} database schemas.\n")

    tokenizer, model, pad_id = load_model()

    # Resume — keep only previously SUCCESSFUL examples (errored ones are re-attempted).
    completed = {}
    if resume and OUTPUT_JSON.exists():
        with open(OUTPUT_JSON, encoding="utf-8") as f:
            existing = json.load(f)
        completed = {ex["index"]: ex for ex in existing if ex.get("error") is None}
        print(f"Resuming — {len(completed)} already done, will be skipped.\n")

    results = list(completed.values())

    valid_count = 0
    exec_match_count = 0
    failure_count = 0

    print(f"Generating predictions with {ADAPTER_REPO}...\n")

    for idx, example in enumerate(tqdm(dev_data, desc="Evaluating")):
        if idx in completed:
            ex = completed[idx]
            if ex.get("valid_sql"):  valid_count += 1
            if ex.get("exec_match"): exec_match_count += 1
            if ex.get("error"):      failure_count += 1
            continue

        db_id    = example["db_id"]
        question = example["question"]
        gold_sql = example["query"]

        # Schema prompt (shared formatter — identical to the one used in training).
        try:
            schema = get_schema_prompt(db_id, schema_index)
        except ValueError as e:
            results.append({
                "index": idx, "db_id": db_id, "question": question,
                "gold_sql": gold_sql, "predicted_sql": "", "raw_response": "",
                "valid_sql": False, "exec_match": False, "error": str(e),
            })
            failure_count += 1
            continue

        # Generate.
        try:
            raw_response  = generate_sql(tokenizer, model, pad_id, schema, question)
            predicted_sql = extract_sql(raw_response)
        except Exception as e:
            results.append({
                "index": idx, "db_id": db_id, "question": question,
                "gold_sql": gold_sql, "predicted_sql": "", "raw_response": "",
                "valid_sql": False, "exec_match": False, "error": f"GenError: {e}",
            })
            failure_count += 1
            continue

        # Quick local validity / execution check — preliminary only (official EX
        # comes from Yale-LILY evaluation.py). Skipped if the SQLite DBs aren't present.
        valid = False
        ex_match = False
        if db_dir is not None:
            try:
                db_path      = get_db_path(db_id, db_dir)
                valid        = is_valid_sql(predicted_sql, db_path)
                gold_rows, _ = execute_sql(gold_sql,      db_path)
                pred_rows, _ = execute_sql(predicted_sql, db_path)
                ex_match     = results_match(gold_rows, pred_rows)
            except FileNotFoundError:
                valid = False
                ex_match = False

        if valid:    valid_count += 1
        if ex_match: exec_match_count += 1

        results.append({
            "index":         idx,
            "db_id":         db_id,
            "question":      question,
            "gold_sql":      gold_sql,
            "predicted_sql": predicted_sql,
            "raw_response":  raw_response,
            "valid_sql":     valid,
            "exec_match":    ex_match,
            "error":         None,
        })

        # Checkpoint every 50 examples so a crash/interrupt loses at most 49.
        if (idx + 1) % 50 == 0:
            _save_results(results)
            done = idx + 1
            print(
                f"\n  [{done}/{len(dev_data)}] "
                f"Valid SQL: {valid_count/done*100:.1f}% | "
                f"Quick EX: {exec_match_count/done*100:.1f}% | "
                f"Failures: {failure_count}"
            )

    # Final save.
    _save_results(results)

    n = len(results)
    print(f"\n{'='*55}")
    print(f"FINE-TUNED 7B — PRELIMINARY RESULTS (n={n})")
    print(f"{'='*55}")
    print(f"Valid SQL Rate (quick):  {valid_count/n*100:.2f}%")
    print(f"Execution Accuracy*:     {exec_match_count/n*100:.2f}%")
    print(f"Failure Rate:            {failure_count/n*100:.2f}%")
    print(f"{'='*55}")
    print("* Preliminary EX — run Yale-LILY evaluation.py for official numbers.")
    print(f"\nOutputs saved:\n  {OUTPUT_JSON}\n  {OUTPUT_SQL}")
    print("\nTo compute official EM + EX, run (locally, where the SQLite DBs live):")
    print("  python evaluation/evaluation.py --gold data/spider/dev_gold.sql "
          "--pred results/finetuned_predicted.sql "
          "--db data/spider/database --table data/spider/tables.json --etype all")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Fine-tuned Qwen2.5-Coder-7B evaluation on the Spider dev set.")
    parser.add_argument("--resume", action="store_true",
                        help="Skip already-completed examples from a previous run.")
    parser.add_argument("--limit", type=int, default=None,
                        help="Only evaluate the first N examples (smoke test).")
    args = parser.parse_args()
    run_evaluation(resume=args.resume, limit=args.limit)
