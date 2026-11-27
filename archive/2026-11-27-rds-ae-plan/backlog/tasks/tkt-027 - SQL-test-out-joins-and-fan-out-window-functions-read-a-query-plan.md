---
id: TKT-027
title: 'SQL test-out: joins and fan-out, window functions, read a query plan'
status: Done
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
updated_date: '2026-11-26T08:02:00Z'
labels:
  - diagnostic
  - sql
  - cat:DIAG-01
milestone: m-2
dependencies: []
priority: p1
type: spike
project: DIAG
ordinal: 4000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor · **Time box:** 90 min · **Rules:** no notes, no AI, attempt first. Mentor gives probes one at a time via `/diag`; answer keys stay in `.mentor/`.

### Why this ticket exists
Test out, do not re-learn. The result sets my known list and baseline level, so every later ticket sits just above what I can already do.

### Probes (mentor provides a small DuckDB dataset in tools/mocks/diag/)
1. Revenue per customer from orders + order_items without double counting (fan-out).
2. Customers with no orders (anti-join), two ways.
3. Running total and rank per month with a window function; explain ROWS vs RANGE.
4. Latest record per key (dedup with ROW_NUMBER).
5. Read an EXPLAIN plan: name the join type and the most expensive step; propose one fix.

### Result
KNOWN / SHAKY / GAP recorded in a comment. SHAKY → REPS.md. GAP → S1 ticket or REPS.md.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 All 5 probes attempted inside the time box, with my SQL saved to the scratch repo
- [x] #2 Each probe graded pass/partial/fail with one line of evidence
- [x] #3 DEPTH_GRID.md SQL row and known list updated with this ticket as evidence
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [x] #1 PR merged after mentor APPROVED
- [x] #2 CI green (once the repo has CI)
- [x] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [x] #4 Explain-back and understanding check passed
- [x] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->

## Comments

<!-- COMMENTS:BEGIN -->
author: @mentor
created: 2026-11-25T17:03:00Z

---

Ready: full body, time box set, no prerequisites (diagnostic). Attempt first via /diag.

---

created: 2026-11-26T06:29:00Z

---

In Progress: /diag started 2026-11-26. Dataset at tools/mocks/diag/ (DuckDB 1.1.3, synthetic). Probes given one at a time; 90 min box.

---

created: 2026-11-26T08:02:00Z

---

Results (2026-11-26). Dataset tools/mocks/diag/ (synthetic, DuckDB 1.1.3); SQL in projects/diag-scratch/sql/p1-p5.
P1 fan-out PASS: pre-aggregated items to order grain, all 5 values correct.
P2 anti-join PARTIAL: NOT IN (null-safe) + NOT EXISTS correct; syntax looked up (rule break), name column missing. Found the NULL trap by running it.
P3 windows PASS (SQL) / GAP (ROWS vs RANGE).
P4 dedup PASS: ROW_NUMBER + load_id tie-break + QUALIFY; uniqueness proof shaky.
P5 plan PARTIAL: keys + INNER named, not HASH_JOIN/build-probe; right costly step; good fix (pre-aggregate).
KNOWN: grain-safe joins, CTEs, SUM/RANK OVER, ROW_NUMBER dedup, QUALIFY.
SHAKY: anti-join from memory (R004), NULL logic (R005), uniqueness proof (R007).
GAP: ROWS vs RANGE (R006), plan reading (R008 → TKT-046).
Baseline SQL = L2.
DoD 1-3 n/a: diagnostic, no PR/CI/release. DoD 4 n/a: probes are the check. Time box not logged.

---

created: 2026-11-26T08:02:00Z

---

Done (mentor): all 5 probes graded, REPS R004-R008 added, DEPTH_GRID SQL row + known list updated.

---
<!-- COMMENTS:END -->
