---
id: TKT-036
title: 'dynamic_pivot(): custom fields become columns with no code change'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
labels:
  - slice-1
  - v1
  - spark
  - data-modeling
  - cat:S1-04
milestone: m-2
dependencies:
  - TKT-035
priority: p1
type: feature
project: S1
ordinal: 13000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (S1 v1, design Level 1) · **Slice:** S1 v1 · **Work transfer:** PS pod medallion
**Requested by:** [Persona: Fatima, Head of Ops Analytics] "Every month Finance adds new custom fields to time entries and our pivots break. I need utilization I can trust, every morning."

### Objective
`dynamic_pivot(df, key_cols, attr_col, value_col)` turns long custom-field rows into columns, discovering the field list from the data.

### Why it matters at work
PS custom fields keep growing; hardcoded SQL PIVOT lists break every month.

### Design decision (Level 1)
Collect distinct attributes then `pivot(attr, values)` vs `pivot(attr)` without values. **Decision:** collect + pass values (one extra pass, but stable column order and no surprise columns). Trade-off and the column-name sanitising rule go in the README.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A field that first appears on day 40 shows up as a column after a rerun, with no code change (test)
- [ ] #2 Days before the field existed have null, not 0, in that column
- [ ] #3 Unsafe attribute names are sanitised to snake_case (test)
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
