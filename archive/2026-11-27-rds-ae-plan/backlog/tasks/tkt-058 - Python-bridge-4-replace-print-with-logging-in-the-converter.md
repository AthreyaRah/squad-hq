---
id: TKT-058
title: 'Python bridge 4: replace print with logging in the converter'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-26T17:30:00Z'
updated_date: '2026-11-26T17:30:00Z'
labels:
  - slice-1
  - v1
  - python
  - cat:S1-00d
milestone: m-2
dependencies:
  - TKT-055
priority: p2
type: chore
project: S1
ordinal: 35000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Why:** DIAG-02 GAP: logging never heard of. Pipelines log, they do not print.
**This ticket uses:** bridge 1 (known), logging: getLogger, levels, basicConfig (NEW, supporting, 15 min teach).
**Time box:** 1 session.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Skipped rows log at WARNING with the row id; the summary logs at INFO
- [ ] #2 No print() left in the converter module
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

Depends on bridge 1 (converter to log).

---
<!-- COMMENTS:END -->
