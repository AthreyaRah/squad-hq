---
id: TKT-038
title: 'Data-quality checks: nulls, uniqueness, accepted values, freshness, volume'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
labels:
  - slice-1
  - v1
  - planted-bug
  - cat:S1-06
dependencies:
  - TKT-037
priority: p2
type: feature
project: S1
ordinal: 15000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (S1 v1, design Level 1) · **Slice:** S1 v1 · **Work transfer:** PS pod medallion
**Requested by:** [Persona: Fatima, Head of Ops Analytics] "Every month Finance adds new custom fields to time entries and our pivots break. I need utilization I can trust, every morning."

### Objective
Checks that fail loudly on a bad day: volume outside the expected range, stale data, broken keys.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A planted bad day makes the run exit non-zero with a clear message
- [ ] #2 Freshness and volume thresholds live in config, not code
- [ ] #3 Check results are written to a small table for the dashboard
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
