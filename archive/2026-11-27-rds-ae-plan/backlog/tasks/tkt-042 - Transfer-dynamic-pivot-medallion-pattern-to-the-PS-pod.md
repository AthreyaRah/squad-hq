---
id: TKT-042
title: 'Transfer: dynamic pivot + medallion pattern to the PS pod'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
labels:
  - slice-1
  - transfer
  - cat:S1-T
dependencies:
  - TKT-039
priority: p2
type: chore
project: S1
ordinal: 19000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Template:** transfer (TICKET_TEMPLATES.md) · **Data rule:** counts and outcomes only.

**Pattern:** dynamic_pivot + bronze/silver/gold + DQ checks.
**Work target:** PS pod raw data on the Databricks SQL warehouse (SQL-only access: adapt the pivot as a SQL generator if PySpark is not available).
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Report filled: rows in/out, checks passed, runtime, what broke, outcome
- [ ] #2 PORTFOLIO.md S1 transfer column updated
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
