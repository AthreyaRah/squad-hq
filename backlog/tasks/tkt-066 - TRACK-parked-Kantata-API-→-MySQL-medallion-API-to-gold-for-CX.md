---
id: TKT-066
title: 'TRACK (parked): Kantata API → MySQL medallion, API to gold, for CX'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-27T05:53:00Z'
labels:
  - later
  - kantata
  - mysql
  - api
  - cat:KAN-00
dependencies: []
priority: p3
type: design
project: S1
ordinal: 43000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Parked:** start only when Rahul says so. Plan section 7 (PLAN_AE_2026-11.md).
Work need: move CX off Databricks; Kantata API → team MySQL on AWS, bronze → silver (dynamic pivot) → gold.
Revives TKT-059, TKT-040, TKT-036 patterns. New: MySQL DDL, indexes, upserts, a scheduler outside Databricks.
<!-- SECTION:DESCRIPTION:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
