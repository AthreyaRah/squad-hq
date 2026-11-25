---
id: TKT-035
title: 'Silver: types, dedup on natural key, keep late records'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
labels:
  - slice-1
  - v1
  - spark
  - planted-bug
  - cat:S1-03
milestone: m-2
dependencies:
  - TKT-034
priority: p1
type: feature
project: S1
ordinal: 12000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (S1 v1, design Level 1) · **Slice:** S1 v1 · **Work transfer:** PS pod medallion
**Requested by:** [Persona: Fatima, Head of Ops Analytics] "Every month Finance adds new custom fields to time entries and our pivots break. I need utilization I can trust, every morning."

### Objective
Build silver time entries: cast types, dedup on the natural key keeping the latest version, keep late-arriving rows.

### Design decision (Level 1)
Dedup by `ROW_NUMBER()` over the key ordered by update time vs `dropDuplicates`. **Decision:** ROW_NUMBER (deterministic: it keeps the latest version). Trade-off: a sort per key.

### Tests
Duplicate rows, a late row, a bad type (planted).
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Bronze → silver row counts reconcile: silver = bronze − duplicates − rejected (numbers in the PR)
- [ ] #2 Rejected rows go to a quarantine table with a reason
- [ ] #3 Tests cover duplicate, late and bad-type rows
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
