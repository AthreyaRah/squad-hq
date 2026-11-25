---
id: TKT-031
title: Baseline depth grid and known list from DIAG-01..04
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
labels:
  - diagnostic
  - cat:DIAG-05
milestone: m-2
dependencies:
  - TKT-027
  - TKT-028
  - TKT-029
  - TKT-030
priority: p1
type: chore
project: DIAG
ordinal: 8000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor · **Time box:** 30 min

Fill DEPTH_GRID.md: every layer gets a level (or `?` with a reason) and an evidence link. Adjust S1 ticket sizes to the result (a layer at L1 gets L1-shaped tickets).
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Every DEPTH_GRID.md layer has a level or a reasoned `?`
- [ ] #2 Known list has at least the items DIAG-01..03 proved
- [ ] #3 S1-01..05 bodies adjusted if the baseline changed their size
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
