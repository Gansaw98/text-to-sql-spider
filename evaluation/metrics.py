# evaluation/metrics.py
#
# Compute and display final comparison metrics from prediction JSON files.
# Run this after BOTH groq_baseline.py and finetuned_eval.py have completed.
#
# Usage:
#   python evaluation/metrics.py
#
# This script reads the preliminary (quick) metrics from the prediction JSON files.
# For OFFICIAL Execution Accuracy and Exact Match, use Yale-LILY evaluation.py.
# Instructions for running evaluation.py are printed at the end of this script.

import json
from pathlib import Path


ROOT_DIR    = Path(__file__).parent.parent
RESULTS_DIR = ROOT_DIR / "results"

GROQ_JSON       = RESULTS_DIR / "groq_predictions.json"
FINETUNED_JSON  = RESULTS_DIR / "finetuned_predictions.json"


def compute_metrics(predictions: list, label: str) -> dict:
    """Compute preliminary metrics from a prediction list."""
    n = len(predictions)
    if n == 0:
        return {}

    valid_count   = sum(1 for p in predictions if p.get("valid_sql", False))
    exec_count    = sum(1 for p in predictions if p.get("exec_match", False))
    failure_count = sum(1 for p in predictions if p.get("error") is not None)

    metrics = {
        "label":            label,
        "n":                n,
        "valid_sql_rate":   round(valid_count   / n * 100, 2),
        "quick_exec_acc":   round(exec_count    / n * 100, 2),
        "failure_rate":     round(failure_count / n * 100, 2),
    }

    return metrics


def load_predictions(json_path: Path, label: str) -> dict | None:
    if not json_path.exists():
        print(f"  [{label}] Not found: {json_path}")
        return None
    with open(json_path, encoding="utf-8") as f:
        data = json.load(f)
    return compute_metrics(data, label)


def print_comparison(groq_m: dict | None, ft_m: dict | None):
    print("\n" + "=" * 65)
    print("TEXT-TO-SQL COMPARISON — PRELIMINARY METRICS")
    print("=" * 65)
    print(f"{'Metric':<28} {'Groq (70B)':>14} {'Fine-tuned (7B)':>16}")
    print("-" * 65)

    def row(label, key):
        g  = f"{groq_m[key]:.2f}%" if groq_m else "N/A"
        ft = f"{ft_m[key]:.2f}%"   if ft_m   else "N/A"
        delta = ""
        if groq_m and ft_m:
            diff = ft_m[key] - groq_m[key]
            sign = "+" if diff >= 0 else ""
            delta = f"  ({sign}{diff:.2f}%)"
        print(f"  {label:<26} {g:>14} {ft:>16}{delta}")

    row("Valid SQL Rate",   "valid_sql_rate")
    row("Execution Acc.*", "quick_exec_acc")
    row("Failure Rate",    "failure_rate")

    print("-" * 65)
    n_g  = groq_m["n"] if groq_m else 0
    n_ft = ft_m["n"]   if ft_m   else 0
    print(f"  {'Examples evaluated':<26} {n_g:>13} {n_ft:>16}")
    print("=" * 65)
    print("* Preliminary — computed with local SQLite executor.")
    print("  Run Yale-LILY evaluation.py for official EX and EM.")
    print()


def print_official_eval_commands():
    print("─" * 65)
    print("OFFICIAL EVALUATION COMMANDS (Yale-LILY evaluation.py)")
    print("─" * 65)
    print()
    print("Groq baseline:")
    print("  python evaluation/evaluation.py \\")
    print("    --gold  data/spider/dev_gold.sql \\")
    print("    --pred  results/groq_predicted.sql \\")
    print("    --db    data/spider/database \\")
    print("    --table data/spider/tables.json \\")
    print("    --etype all")
    print()
    print("Fine-tuned model:")
    print("  python evaluation/evaluation.py \\")
    print("    --gold  data/spider/dev_gold.sql \\")
    print("    --pred  results/finetuned_predicted.sql \\")
    print("    --db    data/spider/database \\")
    print("    --table data/spider/tables.json \\")
    print("    --etype all")
    print()
    print("Output will show:")
    print("  exact match   — EM (string-normalized match)")
    print("  execution acc — EX (correct SQL execution result)")
    print()


if __name__ == "__main__":
    groq_m = load_predictions(GROQ_JSON,      "Groq 70B")
    ft_m   = load_predictions(FINETUNED_JSON, "Fine-tuned 7B")

    if groq_m is None and ft_m is None:
        print("No prediction files found yet.")
        print("Run groq_baseline.py and/or finetuned_eval.py first.")
    else:
        print_comparison(groq_m, ft_m)
        print_official_eval_commands()
