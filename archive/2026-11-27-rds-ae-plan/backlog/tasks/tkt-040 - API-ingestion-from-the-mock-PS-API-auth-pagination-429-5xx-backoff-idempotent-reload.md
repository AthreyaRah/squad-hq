---
id: TKT-040
title: >-
  API ingestion from the mock PS API: auth, pagination, 429/5xx backoff,
  idempotent reload
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
updated_date: '2026-11-27T05:39:00Z'
labels:
  - slice-1
  - v1
  - http
  - planted-bug
  - cat:S1-08
  - later
dependencies:
  - TKT-034
  - TKT-059
priority: p3
type: feature
project: S1
ordinal: 17000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (S1 v1, design Level 1) · **Slice:** S1 v1 · **Work transfer:** PS pod medallion
**Requested by:** [Persona: Fatima, Head of Ops Analytics] "Every month Finance adds new custom fields to time entries and our pivots break. I need utilization I can trust, every morning."

### Objective
Ingest one entity from the mock API into bronze. Backend concepts: bearer token, cursor pagination, retry with backoff + jitter only on 429/5xx/timeouts, idempotent reload.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 All pages loaded; row count equals the API total
- [ ] #2 A forced 429 is retried and the run still succeeds; a 400 fails at once
- [ ] #3 Rerun of the same window leaves the same rows
- [ ] #4 Pages are read through a generator; retries use my own decorator (backoff + jitter, only 429/5xx/timeouts) with tests
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

Now also depends on TKT-059: DIAG-02 showed HTTP calls and timeouts are new.

---

created: 2026-11-27T05:39:00Z

---

Re-planned 2026-11-27 (PLAN_AE_2026-11.md, AE/BI Engineer track). API ingestion after the switch.

---
<!-- COMMENTS:END -->
