# Text-to-SQL: Fine-Tuning Qwen2.5-Coder-7B on Spider

Fine-tuned **Qwen2.5-Coder-7B-Instruct** with LoRA (QLoRA, 4-bit NF4) on the [Spider benchmark](https://yale-lily.github.io/spider), achieving **77.7% execution accuracy** — outperforming a zero-shot Llama 3.3-70B baseline by **+24.5%**.

**HuggingFace Adapter:** [Gansaw98/qwen2.5-coder-7b-text2sql-spider](https://huggingface.co/Gansaw98/qwen2.5-coder-7b-text2sql-spider)

---

## Results

| Model | Approach | Execution Accuracy | Exact Match |
|-------|----------|:-----------------:|:-----------:|
| **Qwen2.5-Coder-7B (ours)** | LoRA fine-tuned | **77.7%** | **77.4%** |
| Llama 3.3-70B (Groq) | Zero-shot | 53.2% | 46.0% |

Evaluated on the Spider dev set (1,034 examples) using the official [Yale-LILY evaluation script](https://github.com/taoyds/spider).

### By difficulty

| Difficulty | Fine-tuned 7B | Groq 70B (zero-shot) |
|------------|:------------:|:-------------------:|
| Easy | 89.1% | 85.1% |
| Medium | 82.1% | 48.7% |
| Hard | 69.5% | 47.1% |
| Extra | 57.2% | 24.1% |

---

## Setup

### 1. Install dependencies
```bash
pip install -r requirements.txt
```

### 2. Download Spider dataset
Download from [Yale-LILY/spider](https://drive.google.com/uc?export=download&id=1_AckYkinAnhqmRQtGsQgUKAnTHxxX5J0) and extract into `data/spider/`.

Expected structure:
```
data/spider/
├── dev.json
├── dev_gold.sql
├── tables.json
└── database/       # SQLite files
```

---

## Training

Training was done on a **Kaggle T4 GPU** (free tier). The full notebook is in `training/text-to-sql.ipynb`.

**Key hyperparameters:**
- Base model: `Qwen/Qwen2.5-Coder-7B-Instruct`
- LoRA rank: 16, alpha: 32
- Quantization: 4-bit NF4 (QLoRA)
- Trainable params: 40.4M (0.6% of total)
- Epochs: 2, LR: 2e-4 (cosine)
- Training examples: 6,836 (filtered at 1024 tokens)

---

## Evaluation

### Fine-tuned model (run on Kaggle GPU)
```bash
python evaluation/finetuned_eval.py
```

### Groq baseline (Llama 3.3-70B zero-shot)
```bash
# Requires GROQ_API_KEY in .env
python evaluation/groq_baseline.py
```

### Official Yale-LILY scorer (run locally with SQLite DBs)
```bash
python evaluation/evaluation.py \
  --gold data/spider/dev_gold.sql \
  --pred results/finetuned_predicted.sql \
  --db data/spider/database \
  --table data/spider/tables.json \
  --etype all
```

### Compare both models
```bash
python evaluation/metrics.py
```

---

## Project Structure

```
├── evaluation/
│   ├── finetuned_eval.py      # Fine-tuned model inference + eval loop
│   ├── groq_baseline.py       # Groq API baseline
│   ├── schema_utils.py        # Schema prompt builder (shared with training)
│   ├── sql_executor.py        # SQLite execution for quick EX checks
│   ├── metrics.py             # Side-by-side comparison table
│   ├── evaluation.py          # Yale-LILY official evaluation script
│   └── process_sql.py         # Yale-LILY SQL parser
├── training/
│   ├── text-to-sql.ipynb      # Full training notebook (Kaggle)
│   └── _measure_lengths.py    # Token length analysis
├── deployment/
│   └── app.py                 # Gradio demo (HF Spaces)
├── results/
│   ├── finetuned_predicted.sql
│   └── groq_predicted.sql
├── .env.example
└── requirements.txt
```

---

## Environment Variables

Copy `.env.example` to `.env` and fill in:
```
GROQ_API_KEY=your_groq_key      # For groq_baseline.py
HF_TOKEN=your_hf_token          # For pushing adapter to HF Hub
```
