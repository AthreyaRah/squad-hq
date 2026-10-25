---
id: TKT-013
title: Keep null readings as None, never 0, and count them
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-10-23T06:55:00Z'
labels:
  - stage-0
  - python
  - cat:P0-13
milestone: m-0
dependencies:
  - TKT-012
priority: p2
type: feature
project: P0
ordinal: 13000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (L1). Mentor writes the full template when this moves to Ready.

[Persona: Fatima, Head of Ops Analytics] "A missing reading is not a 0°C reading. Never invent data." Reuse only, no new concept.
<!-- SECTION:DESCRIPTION:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified in production (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Concept Log and PROGRESS.md updated
<!-- DOD:END -->
