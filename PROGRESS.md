# PROGRESS

Status: started 2026-10-25 (session 1)

## CURRENT

```
DATE: 2026-11-25
SLICE: reconfigure (Stage 0 plan replaced by slices S1–S6) — BEHIND old plan by ~3 weeks; new plan starts S03
TICKET: none In Progress — next: /diag → TKT-027 (DIAG-01 SQL test-out)
SPRINT: S03 2026-11-23 — planned 14 (~36 h) / done 0; S1-04..11, S1-T in Backlog for S04
JOB LOOP (week): applications 0/3 (starts week 3) · post 0/1 · timed set n/a
REPS: due 0 today (3 due 2026-11-27) · streak 0 days
BUILD RATIO: n/a (setup session) · hours this week: ?
LATER LIST: Homebrew, Node.js, gh details (when a ticket needs them); Docker install (S1-07)
```

## BASELINE (old plan, kept for history — the diagnostic replaces it; see DEPTH_GRID.md)

- Python: syntax-aware, functional style (comprehensions, map/filter, lambdas). No modules, classes, errors, tests, or libraries in a real program yet.
- SQL: SELECT, WHERE, GROUP BY, JOIN as used in BI; CTEs; some window functions. No DDL, constraints, transactions, indexes, or query plans yet.
- BI: Tableau dashboards, SQL views in Databricks.
- Everything else: taught JIT through tickets.

## HISTORY

- 2026-10-25: Session 1. Tools were pre-installed by the setup script. TKT-001 done: terminal + PATH taught, AC1-3 passed, confidence 5. Concept Log: old rows marked pre-reset, 2 new rows.
- 2026-10-25: TKT-002 Done. First commit bc53b74. Git basics taught, confidence 3.5.
- 2026-10-25: TKT-003 Done. Squad HQ pushed to private GitHub repo. Confidence 4.
- 2026-10-25: LOG at end of session 1. S01: 3 of 26 Stage 0 tickets Done.
- 2026-11-25: Reconfigure. Stage 0–6 plan archived (archive/old-plan). New model: 6 slices, public twin + transfer, depth grid, job loop, REPS. TKT-004..026 archived; S03 opened. Spikes: modeling + semantic layer, AI on data.
- 2026-11-25: Interview-coverage pass (2 passes). Added S1-10 MERGE/backfill, S1-11 Spark perf, S2-02b SCD2, S2-02c finance SQL, S2-09 stats, JOB-TARGETS/STAR/LOG/OUT/SD/DSA/NEG, mock #1. Pay bands set (private/compensation.md). Self-serve 2x rule (≤30 min/ticket after attempt).
