# PROGRESS

Status: started 2026-10-25 (session 1)

## CURRENT

```
DATE: 2026-11-27
SLICE: AE1 renewals ingestion (PLAN_AE_2026-11.md) — ON TRACK (new plan, day 1)
TICKET: TKT-055 (In Progress) — step 1 read PASS; next: fix path + rename to read_rows, then step 2 clean (parse_hours raises, new dicts)
SPRINT: S03 2026-11-23 — committed 14 (+5 bridge tickets, re-plan at retro) / done 2
JOB LOOP (week): applications 0/3 (starts week 3) · post 0/1 · timed set n/a
REPS: due 0 today (11 due 2026-11-27/28) · streak 1 day
BUILD RATIO: ~80% · hours this week: ? (budget 30 h from 2026-11-27)
LATER LIST: Kantata API → MySQL track (TKT-066, start on Rahul's word); Homebrew, Node.js, gh details (when a ticket needs them); Docker install (S1-07); S5 v2 React + TypeScript UI (only if a job needs it)
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
- 2026-11-26: DIAG-01 (TKT-027) Done. SQL baseline L2: fan-out, windows, dedup pass; anti-join partial (looked up), plan reading partial. Gaps: ROWS vs RANGE, EXPLAIN → R004-R008, TKT-046. Mock dataset tools/mocks/diag/.
- 2026-11-26: DIAG-02 (TKT-028) Done. Python baseline L1: functions/dicts/try-except/aliasing known; P2, P3 partial (R009-R011). GAPs (classes, files+json, pytest, logging, type hints, HTTP) -> bridge tickets TKT-055..059 wired before TKT-033/034/040. Mentor error: P1 set above stated baseline; familiarity scale clarified (L = written alone once).
- 2026-11-27: Diagnostics stopped (Rahul's call): clean slate, JIT teach at first use. TKT-029, TKT-031 archived; TKT-030 kept as job-search P2. Started TKT-055.
- 2026-11-27: Time budget 20 → 30 h/week (Rahul's choice). Targets: first interviews mid–late Jan, offer late Feb–Mar; Ramadan ~Feb 8 slows decisions. S1 trim + AE-first applications to decide at S03 retro (Dec 6).
- 2026-11-27: Re-plan to AE/BI Engineer track (PLAN_AE_2026-11.md): Azure Databricks + dbt + Power BI, then Fabric + DP-600; targets banks, e-com, government, airlines, vendors. Phases AE1 renewals (to Dec 13), AE2 dbt medallion (to Jan 3), AE3 Power BI + Genie (to Jan 24), AE4 Fabric + DP-600 (to Feb 14). New tickets TKT-060..065; AWS, Spark tuning, API, dataclass moved to P3/LATER; milestone S04 (m-3) created.
