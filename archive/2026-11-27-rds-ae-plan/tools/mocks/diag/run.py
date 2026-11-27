"""Run a .sql file against diag.duckdb and print the result.

Run: uv run run.py path/to/query.sql
     uv run run.py -e "SELECT 1"
The last statement's result is printed. EXPLAIN works too.
"""

import sys
from pathlib import Path

import duckdb

DB = Path(__file__).parent / "diag.duckdb"


def main() -> None:
    if len(sys.argv) == 3 and sys.argv[1] == "-e":
        sql = sys.argv[2]
    elif len(sys.argv) == 2:
        sql = Path(sys.argv[1]).read_text()
    else:
        sys.exit(__doc__)
    con = duckdb.connect(str(DB), read_only=True)
    rel = con.sql(sql)
    if rel is None:
        return
    if rel.columns == ["explain_key", "explain_value"]:
        for _, plan in rel.fetchall():
            print(plan)
    else:
        rel.show(max_rows=100, max_width=200)


if __name__ == "__main__":
    main()
