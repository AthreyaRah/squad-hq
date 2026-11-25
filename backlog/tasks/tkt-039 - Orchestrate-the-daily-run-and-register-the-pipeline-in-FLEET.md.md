---
id: TKT-039
title: Orchestrate the daily run and register the pipeline in FLEET.md
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
labels:
  - slice-1
  - v1
  - orchestration
  - cat:S1-07
dependencies:
  - TKT-038
priority: p2
type: feature
project: S1
ordinal: 16000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (S1 v1, design Level 1) · **Slice:** S1 v1 · **Work transfer:** PS pod medallion
**Requested by:** [Persona: Fatima, Head of Ops Analytics] "Every month Finance adds new custom fields to time entries and our pivots break. I need utilization I can trust, every morning."

### Objective
Run generator drop → bronze → silver → gold → checks daily (Airflow in Docker, or cron first if Docker is not ready; decision recorded).
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 One scheduled run succeeds end to end with a log line per step
- [ ] #2 A failed check stops downstream steps
- [ ] #3 FLEET.md entry with freshness and row-count range
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
