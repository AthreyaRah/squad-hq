# DEPTH GRID

Levels: **L1 use · L2 build alone · L3 debug and optimize · L4 design and defend trade-offs.**
Rule: I move up a level only after I pass a new problem without hints. Every level needs an evidence link (ticket, PR, mock). Re-grade monthly in the retro (quarterly after the job switch). Never grade from feelings.

**Spike layers (chosen 2026-11-25):** Modeling + semantic layer, and AI on data. Target L3–L4. Every other layer targets L2.
Why: modeling and metrics use my BI and stakeholder strength, and they are the core of the data intelligence engineer role. AI on data is rare in UAE postings and leads to ML/AI platform work.

## Grid

Baseline is set by the diagnostic (DIAG-05). "?" = not graded yet.

| Layer | Slice | Now | Target | Evidence |
|---|---|---|---|---|
| SQL | S1, S2 | L2 | L2 (L3 for interviews) | TKT-027 (DIAG-01): fan-out, windows, dedup solved alone; plans + frames not yet |
| Python engineering | S1 | L1 | L2 | TKT-028 (DIAG-02): functions, dicts, try/except alone; classes, files, pytest, HTTP not yet |
| Git, CI, Docker | S1, S5 | ? | L2 | TKT-001..003 (terminal, commit, push) |
| Spark + lakehouse (PySpark, Delta) | S1, S6 | ? | L2 | |
| Ingestion + orchestration + data quality | S1 | ? | L2 | |
| Cloud (AWS core; primary cloud from DIAG-04) | S1 | ? | L2 | |
| **Modeling + semantic layer + governance** (spike) | S1, S2 | ? | L3–L4 | |
| ML in production (features, MLflow, scoring, monitoring) | S3 | ? | L2 | |
| **AI on data** (text-to-SQL, RAG, MCP, evals, context) (spike) | S4 | ? | L3–L4 | |
| Backend + data apps (API, auth, transactions, deploy) | S5 | ? | L2 | |
| Reliability, performance, cost | S6 | ? | L2 | |
| Stakeholder + FDE + interviewing | all, JOB | ? | L2 | |

## Known list (filled by `/diag`; what I can already do without help)

- SQL (TKT-027, 2026-11-26): fan-out-safe aggregation (pre-aggregate to the join grain in a CTE); CTE chains; monthly grouping with date_trunc; running total with SUM() OVER; RANK() OVER; latest-row-per-key with ROW_NUMBER + tie-break and QUALIFY; debugs an empty result by running and inspecting.
- SQL SHAKY (in REPS): anti-join syntax from memory (R004); NULL three-valued logic / NOT IN trap (R005); proving one row per key, ROW_NUMBER vs RANK on ties (R007).
- SQL GAP: window frames ROWS vs RANGE (R006); reading a query plan (R008, then TKT-046).
- Python (TKT-028, 2026-11-26): functions with params/return; loops over a list of dicts; accumulating totals in a dict; sorted() with key=lambda and reverse; list comprehensions; `if __name__ == "__main__"` guard; narrow try/except ValueError with skip-and-continue; explicit string-to-bool mapping; aliasing (two names, one list; a tuple holding a mutable list).
- Python SHAKY (in REPS): keep every key in a group-by, incl. zero totals (R009); raise vs return an exception (R010); build new dicts, do not edit input in place (R011).
- Python GAP (bridge tickets): file I/O + json (TKT-055), pytest (TKT-056), classes/dataclass + type hints (TKT-057), logging (TKT-058), HTTP calls, status codes, timeouts (TKT-059).

## Change log

| Date | Layer | Old → new | Evidence |
|---|---|---|---|
| 2026-11-26 | SQL | ? → L2 | TKT-027 (5 probes: 3 pass, 2 partial) |
| 2026-11-26 | Python engineering | ? → L1 | TKT-028 (1 pass, 2 partial, 2 gap) |
