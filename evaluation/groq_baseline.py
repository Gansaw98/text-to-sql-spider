# evaluation/groq_baseline.py
#
# Phase 2: Groq API baseline evaluation on Spider dev set.
# Model: llama-3.3-70b-versatile via Groq (free tier).
# Evaluates 1034 Spider dev examples.
#
# Outputs:
#   results/groq_predictions.json   — full metadata for each example
#   results/groq_predicted.sql      — SQL\tdb_id format for Yale-LILY eval.py
#
# Usage:
#   python evaluation/groq_baseline.py
#
# Resume (skip already-done examples):
#   python evaluation/groq_baseline.py --resume

import os
import re
import json
import time
import argparse
from pathlib import Path
from typing import Optional

from tqdm import tqdm
from dotenv import load_dotenv
from groq import Groq, RateLimitError, APIError

from schema_utils import load_schema_index, get_schema_prompt
from sql_executor import get_db_path, execute_sql, is_valid_sql, results_match

# ---------------------------------------------------------------------------
# Config
# ---------------------------------------------------------------------------

load_dotenv()

GROQ_API_KEY  = os.getenv("GROQ_API_KEY")
MODEL         = "llama-3.3-70b-versatile"
REQUEST_DELAY = 10.0         # seconds between requests — respects TPM limit for large Spider schemas (~900 tokens/request)
MAX_RETRIES   = 3
RETRY_DELAY   = 60           # seconds to wait after a 429 RateLimitError

ROOT_DIR      = Path(__file__).parent.parent
DATA_DIR      = ROOT_DIR / "data" / "spider"
RESULTS_DIR   = ROOT_DIR / "results"
DB_DIR        = DATA_DIR / "database"

RESULTS_DIR.mkdir(exist_ok=True)

OUTPUT_JSON   = RESULTS_DIR / "groq_predictions.json"
OUTPUT_SQL    = RESULTS_DIR / "groq_predicted.sql"

SYSTEM_PROMPT = (
    "You are an expert SQL generator. "
    "Given a database schema and a natural language question, "
    "write the correct SQL query. "
    "Output only the SQL query — no explanation, no markdown, no backticks."
)

# ---------------------------------------------------------------------------
# Few-shot examples
# Sourced from Spider training set (train_spider.json indices 0, 42, 125).
# These are fixed for reproducibility — do not change.
# They cover: COUNT+WHERE, GROUP BY+AVG, COUNT DISTINCT.
# ---------------------------------------------------------------------------

FEW_SHOT = [
    {
        "schema": (
            "CREATE TABLE department (\n"
            "  Department_ID REAL PRIMARY KEY,\n"
            "  Name TEXT,\n"
            "  Creation TEXT,\n"
            "  Ranking REAL,\n"
            "  Budget_in_Billions REAL,\n"
            "  Num_Employees REAL\n"
            ")\n\n"
            "CREATE TABLE head (\n"
            "  head_ID REAL PRIMARY KEY,\n"
            "  name TEXT,\n"
            "  born_state TEXT,\n"
            "  age REAL\n"
            ")\n\n"
            "CREATE TABLE management (\n"
            "  department_ID REAL PRIMARY KEY,\n"
            "  head_ID REAL,\n"
            "  temporary_acting TEXT\n"
            ")\n\n"
            "-- management.head_ID references head.head_ID\n"
            "-- management.department_ID references department.Department_ID"
        ),
        "question": "How many heads of the departments are older than 56?",
        "sql":      "SELECT count(*) FROM head WHERE age > 56",
    },
    {
        "schema": (
            "CREATE TABLE city (\n"
            "  City_ID REAL PRIMARY KEY,\n"
            "  Official_Name TEXT,\n"
            "  Status TEXT,\n"
            "  Area_km_2 REAL,\n"
            "  Population REAL,\n"
            "  Census_Ranking TEXT\n"
            ")"
        ),
        "question": "Show the different statuses of cities and the average population of cities with each status.",
        "sql":      "SELECT Status, avg(Population) FROM city GROUP BY Status",
    },
    {
        "schema": (
            "CREATE TABLE trip (\n"
            "  id REAL PRIMARY KEY,\n"
            "  duration REAL,\n"
            "  start_date TEXT,\n"
            "  start_station_name TEXT,\n"
            "  start_station_id REAL,\n"
            "  end_date TEXT,\n"
            "  end_station_name TEXT,\n"
            "  end_station_id REAL,\n"
            "  bike_id REAL,\n"
            "  subscription_type TEXT,\n"
            "  zip_code REAL\n"
            ")"
        ),
        "question": "Find the number of unique bikes in the trip records.",
        "sql":      "SELECT count(DISTINCT bike_id) FROM trip",
    },
]

# ---------------------------------------------------------------------------
# Prompt construction
# ---------------------------------------------------------------------------

def build_messages(schema: str, question: str) -> list[dict]:
    """
    Build the Groq messages list with system prompt + 3-shot examples + query.
    Uses alternating user/assistant turns for few-shot — most reliable with Llama.
    """
    messages = [{"role": "system", "content": SYSTEM_PROMPT}]

    for ex in FEW_SHOT:
        user_content = (
            f"### Database Schema:\n{ex['schema']}\n\n"
            f"### Question:\n{ex['question']}"
        )
        messages.append({"role": "user",      "content": user_content})
        messages.append({"role": "assistant", "content": ex["sql"]})

    # Actual query
    messages.append({
        "role": "user",
        "content": f"### Database Schema:\n{schema}\n\n### Question:\n{question}",
    })

    return messages


# ---------------------------------------------------------------------------
# SQL extraction
# ---------------------------------------------------------------------------

def extract_sql(response_text: str) -> str:
    """
    Extract the SQL query from a model response.
    Handles: plain SQL, markdown code blocks, explanation-prefixed responses.
    """
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
# Groq API call with retry
# ---------------------------------------------------------------------------

def call_groq(client: Groq, messages: list[dict]) -> tuple[Optional[str], Optional[str]]:
    """
    Call Groq API with retry on rate limit errors.

    Returns:
        (response_text, error_message)
    """
    for attempt in range(1, MAX_RETRIES + 1):
        try:
            response = client.chat.completions.create(
                model=MODEL,
                messages=messages,
                temperature=0,        # Deterministic — required for reproducible eval
                max_tokens=256,       # SQL queries are never longer than this
            )
            return response.choices[0].message.content, None

        except RateLimitError:
            if attempt < MAX_RETRIES:
                print(f"\n  [Rate limit] Sleeping {RETRY_DELAY}s (attempt {attempt}/{MAX_RETRIES})...")
                time.sleep(RETRY_DELAY)
            else:
                return None, "RateLimitError after max retries"

        except APIError as e:
            return None, f"APIError: {e}"

        except Exception as e:
            return None, f"Unexpected error: {e}"

    return None, "Max retries exceeded"


# ---------------------------------------------------------------------------
# Main evaluation loop
# ---------------------------------------------------------------------------

def run_evaluation(resume: bool = False):
    assert GROQ_API_KEY, "GROQ_API_KEY not set. Add it to your .env file."

    client = Groq(api_key=GROQ_API_KEY)

    # Load resources
    print("Loading Spider dev set...")
    with open(DATA_DIR / "dev.json", encoding="utf-8") as f:
        dev_data = json.load(f)
    print(f"  {len(dev_data)} examples loaded.")

    print("Loading schema index...")
    schema_index = load_schema_index(DATA_DIR / "tables.json")
    print(f"  {len(schema_index)} databases loaded.")

    # Resume: load already-completed predictions
    completed = {}
    if resume and OUTPUT_JSON.exists():
        with open(OUTPUT_JSON, encoding="utf-8") as f:
            existing = json.load(f)
        # Only treat SUCCESSFUL examples as done. Examples that previously failed
        # (e.g. Groq daily-limit errors) are intentionally re-attempted on resume.
        completed = {ex["index"]: ex for ex in existing if ex.get("error") is None}
        failed_before = len(existing) - len(completed)
        print(f"  Resuming — {len(completed)} succeeded, {failed_before} will be retried.")

    results = list(completed.values())

    # Evaluate
    print(f"\nStarting evaluation with {MODEL}...")
    print(f"Estimated time: ~{len(dev_data) * REQUEST_DELAY / 60:.0f} minutes\n")

    valid_count = 0
    exec_match_count = 0
    failure_count = 0

    for idx, example in enumerate(tqdm(dev_data, desc="Evaluating")):

        if idx in completed:
            # Count already-done stats for the running display
            ex = completed[idx]
            if ex.get("valid_sql"):    valid_count += 1
            if ex.get("exec_match"):   exec_match_count += 1
            if ex.get("error"):        failure_count += 1
            continue

        db_id    = example["db_id"]
        question = example["question"]
        gold_sql = example["query"]

        try:
            schema = get_schema_prompt(db_id, schema_index)
        except ValueError as e:
            results.append({
                "index": idx, "db_id": db_id, "question": question,
                "gold_sql": gold_sql, "predicted_sql": "",
                "raw_response": "", "valid_sql": False,
                "exec_match": False, "error": str(e),
            })
            failure_count += 1
            continue

        messages = build_messages(schema, question)
        raw_response, api_error = call_groq(client, messages)

        if api_error:
            results.append({
                "index": idx, "db_id": db_id, "question": question,
                "gold_sql": gold_sql, "predicted_sql": "",
                "raw_response": "", "valid_sql": False,
                "exec_match": False, "error": api_error,
            })
            failure_count += 1
            time.sleep(REQUEST_DELAY)
            continue

        predicted_sql = extract_sql(raw_response)

        # Quick validity check
        try:
            db_path = get_db_path(db_id, DB_DIR)
            valid   = is_valid_sql(predicted_sql, db_path)

            # Quick execution match (for live progress display only)
            # Official EX is computed via Yale-LILY evaluation.py
            gold_rows, _  = execute_sql(gold_sql,      db_path)
            pred_rows, _  = execute_sql(predicted_sql, db_path)
            ex_match      = results_match(gold_rows, pred_rows)
        except FileNotFoundError:
            valid    = False
            ex_match = False

        if valid:         valid_count      += 1
        if ex_match:      exec_match_count += 1

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

        # Save progress every 50 examples
        if (idx + 1) % 50 == 0:
            _save_results(results)
            done = idx + 1
            print(
                f"\n  [{done}/{len(dev_data)}] "
                f"Valid SQL: {valid_count/done*100:.1f}% | "
                f"Quick EX: {exec_match_count/done*100:.1f}% | "
                f"Failures: {failure_count}"
            )

        time.sleep(REQUEST_DELAY)

    # Final save
    _save_results(results)

    # Summary
    n = len(results)
    print(f"\n{'='*55}")
    print(f"GROQ BASELINE — PRELIMINARY RESULTS (n={n})")
    print(f"{'='*55}")
    print(f"Valid SQL Rate (quick):  {valid_count/n*100:.2f}%")
    print(f"Execution Accuracy*:     {exec_match_count/n*100:.2f}%")
    print(f"Failure Rate:            {failure_count/n*100:.2f}%")
    print(f"{'='*55}")
    print(f"* Preliminary EX — run Yale-LILY evaluation.py for official numbers.")
    print(f"\nOutputs saved:")
    print(f"  {OUTPUT_JSON}")
    print(f"  {OUTPUT_SQL}")
    print(f"\nTo compute official EM + EX, run:")
    print(f"  python evaluation/evaluation.py --gold data/spider/dev_gold.sql "
          f"--pred results/groq_predicted.sql "
          f"--db data/spider/database --table data/spider/tables.json "
          f"--etype all")


def _save_results(results: list):
    """Write JSON metadata and SQL prediction file.

    Results are ALWAYS sorted by index before writing so the predicted SQL file
    stays line-aligned with dev_gold.sql — critical for Yale-LILY evaluation.py,
    which matches gold and predictions positionally. Without this, retried/resumed
    examples appended out of order would silently misalign every downstream metric.
    """
    ordered = sorted(results, key=lambda x: x["index"])

    with open(OUTPUT_JSON, "w", encoding="utf-8") as f:
        json.dump(ordered, f, indent=2, ensure_ascii=False)

    with open(OUTPUT_SQL, "w", encoding="utf-8") as f:
        for ex in ordered:
            sql = ex.get("predicted_sql", "").replace("\n", " ").strip()
            if not sql:
                sql = "SELECT 1"  # Placeholder so eval.py line count matches
            f.write(f"{sql}\t{ex['db_id']}\n")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Groq baseline evaluation on Spider dev set.")
    parser.add_argument("--resume", action="store_true",
                        help="Skip already-completed examples and continue from last checkpoint.")
    args = parser.parse_args()
    run_evaluation(resume=args.resume)
