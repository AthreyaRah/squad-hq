---
id: TKT-021
title: One structured log line per run
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-10-23T06:55:00Z'
labels:
  - stage-0
  - python
  - cat:P0-21
milestone: m-1
dependencies:
  - TKT-019
priority: p2
type: feature
project: P0
ordinal: 21000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (L1). Mentor writes the full template when this moves to Ready.

NEW: the logging module. Fields: city, date, fetched, nulls, upserted, duration.
<!-- SECTION:DESCRIPTION:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified in production (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Concept Log and PROGRESS.md updated
<!-- DOD:END -->
