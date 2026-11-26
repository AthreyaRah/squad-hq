"""Build the DIAG-01 SQL test-out database (synthetic, deterministic).

Run: uv run generate.py   (from tools/mocks/diag/)
Creates diag.duckdb with: customers, orders, order_items, customer_status_history.
"""

from pathlib import Path

import duckdb

DB = Path(__file__).parent / "diag.duckdb"

DDL = """
CREATE TABLE customers (
    customer_id  INTEGER PRIMARY KEY,
    name         VARCHAR,
    region       VARCHAR,
    signup_date  DATE
);
CREATE TABLE orders (
    order_id      INTEGER PRIMARY KEY,
    customer_id   INTEGER,          -- NULL = guest checkout
    order_date    DATE,
    shipping_fee  DECIMAL(10, 2)    -- one fee per order
);
CREATE TABLE order_items (
    item_id     INTEGER PRIMARY KEY,
    order_id    INTEGER,
    sku         VARCHAR,
    quantity    INTEGER,
    unit_price  DECIMAL(10, 2)
);
CREATE TABLE customer_status_history (
    customer_id  INTEGER,
    status       VARCHAR,
    updated_at   TIMESTAMP,
    load_id      INTEGER          -- higher = loaded later
);
"""

CUSTOMERS = [
    (1, "Atlas Trading", "North", "2025-11-03"),
    (2, "Birch Labs", "South", "2025-12-14"),
    (3, "Cobalt Retail", "North", "2026-01-09"),
    (4, "Dune Logistics", "East", "2026-01-21"),
    (5, "Ember Foods", "South", "2026-02-02"),
    (6, "Fjord Media", "East", "2026-02-17"),
    (7, "Granite Works", "West", "2026-03-05"),
    (8, "Harbor Health", "West", "2026-04-11"),
]

ORDERS = [
    (101, 1, "2026-01-05", 10.00),
    (102, 2, "2026-01-18", 5.00),
    (103, 1, "2026-02-02", 10.00),
    (104, 3, "2026-02-20", 0.00),
    (105, None, "2026-02-25", 7.50),
    (106, 4, "2026-03-03", 5.00),
    (107, 2, "2026-03-15", 5.00),
    (108, 1, "2026-03-28", 10.00),
    (109, 5, "2026-04-07", 5.00),
    (110, 3, "2026-04-19", 0.00),
    (111, 4, "2026-05-02", 5.00),
    (112, None, "2026-05-21", 7.50),
    (113, 5, "2026-06-10", 5.00),
]

ITEMS = [
    (1, 101, "SKU-A", 2, 25.00),
    (2, 101, "SKU-B", 1, 40.00),
    (3, 101, "SKU-C", 3, 10.00),
    (4, 102, "SKU-A", 1, 25.00),
    (5, 103, "SKU-D", 4, 15.00),
    (6, 103, "SKU-B", 1, 40.00),
    (7, 104, "SKU-C", 5, 10.00),
    (8, 104, "SKU-A", 2, 25.00),
    (9, 105, "SKU-B", 1, 40.00),
    (10, 106, "SKU-D", 2, 15.00),
    (11, 106, "SKU-C", 2, 10.00),
    (12, 106, "SKU-A", 1, 25.00),
    (13, 107, "SKU-B", 2, 40.00),
    (14, 108, "SKU-A", 1, 25.00),
    (15, 108, "SKU-D", 1, 15.00),
    (16, 109, "SKU-C", 6, 10.00),
    (17, 109, "SKU-B", 1, 40.00),
    (18, 110, "SKU-A", 3, 25.00),
    (19, 111, "SKU-D", 3, 15.00),
    (20, 111, "SKU-C", 1, 10.00),
    (21, 112, "SKU-A", 1, 25.00),
    (22, 112, "SKU-B", 1, 40.00),
    (23, 113, "SKU-D", 5, 15.00),
    (24, 113, "SKU-A", 2, 25.00),
]

STATUS = [
    (1, "trial", "2025-11-03 09:00", 1),
    (1, "active", "2025-11-20 10:00", 2),
    (2, "trial", "2025-12-14 09:00", 1),
    (2, "active", "2026-01-02 11:00", 2),
    (2, "churned", "2026-05-30 17:00", 5),
    (3, "trial", "2026-01-09 09:00", 2),
    (3, "active", "2026-02-01 08:30", 3),
    (3, "active", "2026-02-01 08:30", 4),
    (4, "trial", "2026-01-21 09:00", 2),
    (4, "paused", "2026-04-15 12:00", 4),
    (4, "active", "2026-04-15 12:00", 5),
    (5, "trial", "2026-02-02 09:00", 3),
    (5, "active", "2026-02-20 14:00", 3),
    (6, "trial", "2026-02-17 09:00", 3),
    (7, "trial", "2026-03-05 09:00", 3),
    (7, "active", "2026-03-25 16:00", 4),
    (8, "trial", "2026-04-11 09:00", 4),
]


def main() -> None:
    DB.unlink(missing_ok=True)
    con = duckdb.connect(str(DB))
    con.execute(DDL)
    con.executemany("INSERT INTO customers VALUES (?, ?, ?, ?)", CUSTOMERS)
    con.executemany("INSERT INTO orders VALUES (?, ?, ?, ?)", ORDERS)
    con.executemany("INSERT INTO order_items VALUES (?, ?, ?, ?, ?)", ITEMS)
    con.executemany("INSERT INTO customer_status_history VALUES (?, ?, ?, ?)", STATUS)
    for t in ["customers", "orders", "order_items", "customer_status_history"]:
        n = con.execute(f"SELECT count(*) FROM {t}").fetchone()[0]
        print(f"{t}: {n} rows")
    con.close()
    print(f"wrote {DB}")


if __name__ == "__main__":
    main()
