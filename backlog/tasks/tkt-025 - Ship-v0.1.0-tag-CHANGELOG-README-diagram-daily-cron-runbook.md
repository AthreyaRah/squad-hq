---
id: TKT-025
title: 'Ship v0.1.0: tag, CHANGELOG, README diagram, daily cron, runbook'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-10-23T06:55:00Z'
labels:
  - stage-0
  - fleet
  - cat:P0-25
milestone: m-1
dependencies:
  - TKT-018
  - TKT-020
  - TKT-021
  - TKT-022
  - TKT-023
priority: p1
type: chore
project: P0
ordinal: 25000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (L1). Mentor writes the full template when this moves to Ready.

NEW: scheduling with cron and release tags. Done when the next scheduled run logs success. P0 joins FLEET.md.
<!-- SECTION:DESCRIPTION:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified in production (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Concept Log and PROGRESS.md updated
<!-- DOD:END -->
