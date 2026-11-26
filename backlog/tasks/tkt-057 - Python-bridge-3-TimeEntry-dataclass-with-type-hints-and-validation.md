---
id: TKT-057
title: 'Python bridge 3: TimeEntry dataclass with type hints and validation'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-26T17:30:00Z'
updated_date: '2026-11-26T17:30:00Z'
labels:
  - slice-1
  - v1
  - python
  - cat:S1-00c
milestone: m-2
dependencies:
  - TKT-056
priority: p2
type: feature
project: S1
ordinal: 34000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Why:** DIAG-02 P1 GAP: classes, dataclass and type hints never used.
**This ticket uses:** bridge 1-2 (known), @dataclass with typed fields (NEW, core; type hints come with it as field annotations).
**Time box:** 2 sessions.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 TimeEntry dataclass; billable_hours() returns hours or 0.0
- [ ] #2 __post_init__ raises ValueError for hours <= 0 or > 24
- [ ] #3 Converter builds TimeEntry objects; 2 new pytest tests incl. pytest.raises
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

Depends on bridge 2 (tests for the dataclass).

---
<!-- COMMENTS:END -->
