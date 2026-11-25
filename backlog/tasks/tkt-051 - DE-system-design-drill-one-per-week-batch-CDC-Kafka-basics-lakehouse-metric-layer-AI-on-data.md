---
id: TKT-051
title: >-
  DE system design drill, one per week (batch, CDC + Kafka basics, lakehouse,
  metric layer, AI on data)
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-25T17:25:00Z'
labels:
  - job-search
  - cat:JOB-SD
dependencies: []
priority: p2
type: drill
project: JOB
ordinal: 28000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** me, mentor reviews · **Honesty rule applies.**

Each week: 45 minutes, whiteboard or Excalidraw. Requirements → scale estimate → components → data model → failure modes → what changes at 10x. Use my own slices. Kafka/CDC basics at [A]: topics, partitions, offsets, consumer groups, at-least-once vs exactly-once.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 One drill per week from week 3, mentor scores it (1–5) in a comment
- [ ] #2 Misses go to REPS.md
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
