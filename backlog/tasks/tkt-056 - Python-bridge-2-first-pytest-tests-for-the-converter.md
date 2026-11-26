---
id: TKT-056
title: 'Python bridge 2: first pytest tests for the converter'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-26T17:30:00Z'
updated_date: '2026-11-26T17:30:00Z'
labels:
  - slice-1
  - v1
  - python
  - testing
  - cat:S1-00b
milestone: m-2
dependencies:
  - TKT-055
priority: p1
type: feature
project: S1
ordinal: 33000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Why:** DIAG-02 GAP: pytest never used. TKT-033 skeleton and every S1 ticket need tests.
**This ticket uses:** bridge 1 code (known), pytest: test_ functions, assert, pytest.raises, tmp_path (NEW, core).
**Time box:** 1-2 sessions.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 uv run pytest runs at least 4 tests: happy path counts, types, bad-hours skip, missing file
- [ ] #2 One test uses pytest.raises for parse_hours
- [ ] #3 Tests write to tmp_path, never to data/
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
created: 2026-11-26T17:30:00Z

---

Depends on bridge 1 (code to test).

---
<!-- COMMENTS:END -->
