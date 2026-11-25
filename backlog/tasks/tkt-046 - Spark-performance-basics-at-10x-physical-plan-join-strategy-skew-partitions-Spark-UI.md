---
id: TKT-046
title: >-
  Spark performance basics at 10x: physical plan, join strategy, skew,
  partitions, Spark UI
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-25T17:25:00Z'
labels:
  - slice-1
  - v1
  - spark
  - perf
  - cat:S1-11
dependencies:
  - TKT-037
priority: p2
type: perf
project: S1
ordinal: 23000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (S1 v1, design Level 1) · **Slice:** S1 v1
**Requested by:** [Persona: Fatima, Head of Ops Analytics] "Yesterday's load ran twice and Finance saw double hours. And the nightly job is getting slow."

### Objective
Scale the generator 10x. Read the physical plan of the gold build. Compare broadcast vs sort-merge join. Find one skewed key (planted) and fix it. Compare repartition vs coalesce. Capture Spark UI evidence.

### Method
Measure → change one thing → measure again. Numbers, not opinions.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Before/after runtime table in the README with the config of each run
- [ ] #2 I explain from the plan which join strategy Spark chose and why
- [ ] #3 The skew is shown in the Spark UI (task-time spread) and fixed (broadcast, salting or AQE), with numbers
- [ ] #4 One paragraph: repartition vs coalesce, when each wins
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
