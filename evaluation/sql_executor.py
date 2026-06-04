# evaluation/sql_executor.py
#
# Executes SQL queries against Spider's SQLite databases.
# Used for computing Execution Accuracy (EX) and Valid SQL Rate.
#
# Note: For the official EX and EM metrics reported in results, always use
# the Yale-LILY evaluation.py script. This module is for quick local checks
# and valid SQL rate computation during the evaluation loop.

import sqlite3
from pathlib import Path
from typing import Optional


def get_db_path(db_id: str, database_dir: str | Path) -> Path:
    """
    Return the path to a Spider SQLite database file.

    Args:
        db_id:         Database identifier (e.g. 'concert_singer').
        database_dir:  Path to the Spider 'database/' directory.

    Returns:
        Path to the .sqlite file.

    Raises:
        FileNotFoundError: If the database file does not exist.
    """
    db_path = Path(database_dir) / db_id / f"{db_id}.sqlite"
    if not db_path.exists():
        raise FileNotFoundError(
            f"SQLite DB not found: {db_path}\n"
            f"Ensure data/spider/database/ contains the extracted Spider databases."
        )
    return db_path


def execute_sql(
    sql: str,
    db_path: str | Path,
    timeout_seconds: int = 30,
) -> tuple[Optional[list], Optional[str]]:
    """
    Execute a SQL query against a SQLite database.

    Args:
        sql:             SQL string to execute.
        db_path:         Path to the .sqlite file.
        timeout_seconds: Abort if query takes longer than this.

    Returns:
        (rows, error):
            rows  — list of result tuples on success, None on error.
            error — error message string on failure, None on success.
    """
    try:
        conn = sqlite3.connect(str(db_path))
        conn.execute(f"PRAGMA busy_timeout = {timeout_seconds * 1000}")
        cursor = conn.cursor()
        cursor.execute(sql)
        rows = cursor.fetchall()
        conn.close()
        return rows, None
    except Exception as exc:
        return None, str(exc)


def is_valid_sql(sql: str, db_path: str | Path) -> bool:
    """Return True if the SQL executes without error against the given database."""
    _, error = execute_sql(sql, db_path)
    return error is None


def results_match(rows_gold: Optional[list], rows_pred: Optional[list]) -> bool:
    """
    Compare two SQL result sets for equality (order-insensitive).

    Converts rows to sorted string representations to handle type differences.
    Returns False if either result is None (execution error).
    """
    if rows_gold is None or rows_pred is None:
        return False
    try:
        normalize = lambda rows: sorted(str(row).lower().strip() for row in rows)
        return normalize(rows_gold) == normalize(rows_pred)
    except Exception:
        return False


if __name__ == "__main__":
    # Smoke test — run: python evaluation/sql_executor.py
    import sys
    db_dir = Path(__file__).parent.parent / "data" / "spider" / "database"

    db_id  = "concert_singer"
    sql    = "SELECT count(*) FROM singer"
    db_path = get_db_path(db_id, db_dir)

    rows, err = execute_sql(sql, db_path)
    if err:
        print(f"ERROR: {err}")
        sys.exit(1)

    print(f"Query:  {sql}")
    print(f"DB:     {db_id}")
    print(f"Result: {rows}")
    print("sql_executor.py — OK")
