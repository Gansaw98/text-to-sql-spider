# app.py — Hugging Face Space (CPU-compatible) Gradio demo
# Fine-tuned Qwen2.5-Coder-7B (LoRA) for Text-to-SQL on the Spider benchmark.

import os
import gradio as gr
import torch
from transformers import AutoModelForCausalLM, AutoTokenizer
from peft import PeftModel

BASE_MODEL = "Qwen/Qwen2.5-Coder-7B-Instruct"
ADAPTER    = "Gansaw98/qwen2.5-coder-7b-text2sql-spider"
HF_TOKEN   = os.environ.get("HF_TOKEN")

SYSTEM_PROMPT = (
    "You are an expert SQL generator. "
    "Given a database schema and a natural language question, "
    "write the correct SQL query. "
    "Output only the SQL query with no explanation or markdown."
)

DEVICE = "cuda" if torch.cuda.is_available() else "cpu"
# Force float16 on CPU to keep memory ~14GB (fits in free Space's 16GB RAM).
# device_map="cpu" prevents disk-offloading which breaks PEFT adapter loading.
DTYPE = torch.float16

print(f"Loading on device: {DEVICE} | dtype: {DTYPE}")

tokenizer = AutoTokenizer.from_pretrained(BASE_MODEL, trust_remote_code=True, token=HF_TOKEN)
base = AutoModelForCausalLM.from_pretrained(
    BASE_MODEL,
    torch_dtype=DTYPE,
    device_map="cpu",
    low_cpu_mem_usage=True,
    trust_remote_code=True,
    token=HF_TOKEN,
)
model = PeftModel.from_pretrained(base, ADAPTER, token=HF_TOKEN)
if DEVICE == "cuda":
    model = model.to(DEVICE)
model.eval()
PAD_ID = tokenizer.pad_token_id or tokenizer.eos_token_id


def generate_sql(schema: str, question: str) -> str:
    schema   = (schema or "").strip()
    question = (question or "").strip()
    if not schema or not question:
        return "-- Please provide both a database schema and a question."

    user = f"### Database Schema:\n{schema}\n\n### Question:\n{question}"
    messages = [
        {"role": "system", "content": SYSTEM_PROMPT},
        {"role": "user",   "content": user},
    ]
    inputs = tokenizer.apply_chat_template(
        messages, add_generation_prompt=True, return_tensors="pt", return_dict=True
    )
    inputs = {k: v.to(model.device) for k, v in inputs.items()}

    with torch.no_grad():
        out = model.generate(
            **inputs,
            max_new_tokens=256,
            do_sample=False,
            num_beams=1,
            pad_token_id=PAD_ID,
        )
    gen = out[0][inputs["input_ids"].shape[1]:]
    return tokenizer.decode(gen, skip_special_tokens=True).strip()


EXAMPLE_SCHEMA = """CREATE TABLE singer (
  Singer_ID REAL PRIMARY KEY,
  Name TEXT,
  Country TEXT,
  Song_Name TEXT,
  Age REAL
)

CREATE TABLE concert (
  concert_ID REAL PRIMARY KEY,
  concert_Name TEXT,
  Theme TEXT,
  Year TEXT
)"""

with gr.Blocks(title="Text-to-SQL — Fine-tuned Qwen2.5-Coder-7B") as demo:
    gr.Markdown(
        "# 🗃️ Text-to-SQL Demo\n"
        "Fine-tuned **Qwen2.5-Coder-7B** (LoRA / QLoRA) on the **Spider** benchmark — "
        "**77.7% execution accuracy**, surpassing a zero-shot 70B model by **+24.5%**.\n\n"
        "Paste a `CREATE TABLE` schema and ask a question in plain English."
    )
    with gr.Row():
        with gr.Column():
            schema_in   = gr.Textbox(label="Database Schema", lines=12, value=EXAMPLE_SCHEMA)
            question_in = gr.Textbox(label="Question (English)", lines=2,
                                     value="How many singers are there from each country?")
            btn = gr.Button("Generate SQL", variant="primary")
        with gr.Column():
            sql_out = gr.Code(label="Generated SQL", language="sql")

    btn.click(generate_sql, inputs=[schema_in, question_in], outputs=sql_out)

    gr.Examples(
        examples=[
            [EXAMPLE_SCHEMA, "How many singers are there from each country?"],
            [EXAMPLE_SCHEMA, "What are the names of singers older than 40?"],
            [EXAMPLE_SCHEMA, "Show the theme and year of every concert."],
        ],
        inputs=[schema_in, question_in],
    )

if __name__ == "__main__":
    demo.launch()
