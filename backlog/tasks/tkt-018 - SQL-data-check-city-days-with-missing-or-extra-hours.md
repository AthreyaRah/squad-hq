---
id: TKT-018
title: 'SQL data check: city-days with missing or extra hours'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-10-23T06:55:00Z'
labels:
  - stage-0
  - sql
  - cat:P0-18
milestone: m-1
dependencies:
  - TKT-017
priority: p2
type: feature
project: P0
ordinal: 18000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (L1). Mentor writes the full template when this moves to Ready.

NEW: generate_series. Reuses my baseline: CTEs and LAG.
<!-- SECTION:DESCRIPTION:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified in production (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Concept Log and PROGRESS.md updated
<!-- DOD:END -->
