---
id: TKT-032
title: 'MENTOR: PS public-twin data generator + mock API'
status: Ready
assignee:
  - '@mentor'
created_date: '2026-11-25T17:02:00Z'
updated_date: '2026-11-25T17:03:00Z'
labels:
  - slice-1
  - v1
  - planted-bug
  - cat:S1-00
milestone: m-2
dependencies: []
priority: p1
type: chore
project: S1
ordinal: 9000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Owner:** @mentor (tooling, not my solution code) · **Time box:** mentor

Write `tools/mocks/ps_twin/`: a deterministic generator (seed) for projects, resources, time entries and invoices, as daily file drops. New custom fields appear on fixed dates (drift). Planted defects as the S1 tickets need them (not disclosed). Later: a small mock REST API for S1-08 (auth token, pagination, 429/5xx).
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 `uv run tools/mocks/ps_twin/generate.py --days 60 --seed 7 --out <dir>` writes daily drops
- [ ] #2 README in the folder says the schema, not the planted defects
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
- [ ] #6 n/a items ticked with reason
<!-- DOD:END -->

## Comments

<!-- COMMENTS:BEGIN -->
author: @mentor
created: 2026-11-25T17:03:00Z

---

Mentor tooling. Built before S1-02 starts.

---
<!-- COMMENTS:END -->
