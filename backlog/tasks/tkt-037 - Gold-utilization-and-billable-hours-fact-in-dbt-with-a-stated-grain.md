---
id: TKT-037
title: 'Gold: utilization and billable-hours fact in dbt with a stated grain'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
labels:
  - slice-1
  - v1
  - data-modeling
  - cat:S1-05
dependencies:
  - TKT-036
priority: p2
type: feature
project: S1
ordinal: 14000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (S1 v1, design Level 1) · **Slice:** S1 v1 · **Work transfer:** PS pod medallion
**Requested by:** [Persona: Fatima, Head of Ops Analytics] "Every month Finance adds new custom fields to time entries and our pivots break. I need utilization I can trust, every morning."

### Objective
dbt models: `fct_time_entries` (grain: one row per resource per project per day) and a utilization mart. dbt tests: unique, not_null, relationships, accepted_values.

### Design decision (Level 1)
dbt-duckdb reading silver Delta/Parquet vs dbt-spark. **Decision:** dbt-duckdb (no cluster, fast CI). Trade-off: SQL dialect differences vs Databricks; noted in the README.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 `make run` builds gold; `dbt test` passes
- [ ] #2 Grain written in the model YAML description
- [ ] #3 Utilization for 3 sample resources matches a hand calculation in the PR
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
