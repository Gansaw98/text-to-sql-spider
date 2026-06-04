# evaluation/schema_utils.py
#
# Shared schema formatter used by BOTH the Groq baseline and fine-tuned evaluation.
# The Kaggle notebook (Cell 4) contains an identical copy of get_schema_prompt().
# If you ever change this file, update the Kaggle notebook cell too — they must stay in sync.

import json
from pathlib import Path


def build_schema_index(tables_data: list) -> dict:
    """
    Build a db_id → schema lookup dict from a loaded tables.json list.
    Call once at startup, reuse for every example.
    """
    return {entry["db_id"]: entry for entry in tables_data}


def load_schema_index(tables_json_path: str | Path) -> dict:
    """Load tables.json from disk and return the schema index dict."""
    with open(tables_json_path, encoding="utf-8") as f:
        tables_data = json.load(f)
    return build_schema_index(tables_data)


def get_schema_prompt(db_id: str, schema_index: dict) -> str:
    """
    Convert a Spider database schema into CREATE TABLE SQL format.

    Args:
        db_id:         Database identifier (e.g. 'concert_singer').
        schema_index:  Output of build_schema_index() or load_schema_index().

    Returns:
        Multi-line string with CREATE TABLE statements + foreign key comments.

    Raises:
        ValueError: If db_id is not present in the schema index.
    """
    if db_id not in schema_index:
        raise ValueError(f"db_id '{db_id}' not found in tables.json")

    db           = schema_index[db_id]
    tables       = db["table_names_original"]   # ['singer', 'concert', ...]
    columns      = db["column_names_original"]  # [[-1,'*'], [0,'singer_id'], ...]
    col_types    = db["column_types"]           # ['text', 'number', ...]
    primary_keys = set(db["primary_keys"])      # set of column indices
    foreign_keys = db["foreign_keys"]           # [[col_idx1, col_idx2], ...]

    type_map = {
        "text":    "TEXT",
        "number":  "REAL",
        "time":    "TEXT",
        "boolean": "INTEGER",
        "others":  "TEXT",
    }

    schema_parts = []
    for t_idx, table_name in enumerate(tables):
        col_defs = []
        for c_idx, (t_id, col_name) in enumerate(columns):
            # columns[0] is always [-1, '*'] wildcard — t_id == -1 skips it automatically
            if t_id != t_idx:
                continue
            sql_type  = type_map.get(col_types[c_idx].lower(), "TEXT")
            pk_suffix = " PRIMARY KEY" if c_idx in primary_keys else ""
            col_defs.append(f"  {col_name} {sql_type}{pk_suffix}")

        if col_defs:
            schema_parts.append(
                f"CREATE TABLE {table_name} (\n"
                + ",\n".join(col_defs)
                + "\n)"
            )

    # Foreign key hints as SQL comments — help the model learn join paths
    fk_lines = []
    for c1_idx, c2_idx in foreign_keys:
        t1      = tables[columns[c1_idx][0]]
        col1    = columns[c1_idx][1]
        t2      = tables[columns[c2_idx][0]]
        col2    = columns[c2_idx][1]
        fk_lines.append(f"-- {t1}.{col1} references {t2}.{col2}")

    schema_str = "\n\n".join(schema_parts)
    if fk_lines:
        schema_str += "\n\n" + "\n".join(fk_lines)

    return schema_str


if __name__ == "__main__":
    # Smoke test — run: python evaluation/schema_utils.py
    tables_path = Path(__file__).parent.parent / "data" / "spider" / "tables.json"
    index = load_schema_index(tables_path)
    print(f"Loaded {len(index)} database schemas.\n")
    print("Sample schema for 'concert_singer':\n")
    print(get_schema_prompt("concert_singer", index))
