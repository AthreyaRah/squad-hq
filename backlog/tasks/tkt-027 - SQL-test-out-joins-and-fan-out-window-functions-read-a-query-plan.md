---
id: TKT-027
title: 'SQL test-out: joins and fan-out, window functions, read a query plan'
status: Ready
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
updated_date: '2026-11-25T17:03:00Z'
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
- [ ] #1 All 5 probes attempted inside the time box, with my SQL saved to the scratch repo
- [ ] #2 Each probe graded pass/partial/fail with one line of evidence
- [ ] #3 DEPTH_GRID.md SQL row and known list updated with this ticket as evidence
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->

## Comments

<!-- COMMENTS:BEGIN -->
author: @mentor
created: 2026-11-25T17:03:00Z

---

Ready: full body, time box set, no prerequisites (diagnostic). Attempt first via /diag.

---
<!-- COMMENTS:END -->
