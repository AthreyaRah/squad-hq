---
id: TKT-033
title: 'Repo skeleton for ps-lakehouse: uv, ruff, pytest, Makefile, README diagram, CI'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
updated_date: '2026-11-26T17:30:00Z'
labels:
  - slice-1
  - v1
  - git
  - testing
  - cat:S1-01
milestone: m-2
dependencies:
  - TKT-029
  - TKT-056
priority: p1
type: chore
project: S1
ordinal: 10000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (S1 v1, design Level 1) · **Slice:** S1 v1 · **Work transfer:** PS pod medallion
**Requested by:** [Persona: Fatima, Head of Ops Analytics] "Every month Finance adds new custom fields to time entries and our pivots break. I need utilization I can trust, every morning."

### Objective
Create the public repo `ps-lakehouse` that a stranger can clone and run with one command.

### Design decision (mentor decides, Level 1)
Local PySpark + Delta (delta-spark) vs Databricks Free Edition. **Decision:** local first (free, reproducible in CI, fast feedback); Databricks Free Edition as a v2 deployment target. Trade-off: no Unity Catalog or Workflows locally.

### Deliverables
`pyproject.toml` (uv), `src/ps_lakehouse/`, `tests/`, `Makefile` (`make test`, `make run`), README with a Mermaid diagram (generator → bronze → silver → gold → checks), GitHub Actions running ruff + pytest. Branch `tkt-xxx-skeleton`.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Fresh clone: `uv sync && make test` passes
- [ ] #2 CI is green on the PR
- [ ] #3 README shows the medallion diagram and a one-line run command
- [ ] #4 No secrets, no work data in the repo
- [ ] #5 mypy runs in CI with no errors; public functions have type hints
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->

## Comments

<!-- COMMENTS:BEGIN -->
author: @mentor
created: 2026-11-25T17:25:00Z

---

Interview-coverage pass (2026-11-25): added AC so this ticket covers an interview-critical concept.

---

created: 2026-11-26T17:30:00Z

---

Now also depends on TKT-056: DIAG-02 showed pytest is new; learn it on a small converter before the skeleton.

---
<!-- COMMENTS:END -->
