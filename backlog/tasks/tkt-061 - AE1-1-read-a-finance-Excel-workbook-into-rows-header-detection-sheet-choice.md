---
id: TKT-061
title: >-
  AE1-1: read a finance Excel workbook into rows (header detection, sheet
  choice)
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-27T05:40:00Z'
labels:
  - ae1
  - renewals
  - python
  - cat:AE1-01
milestone: m-3
dependencies:
  - TKT-055
  - TKT-056
  - TKT-060
priority: p1
type: feature
project: S3
ordinal: 38000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Why:** finance Excel breaks on upload (dates, money). Step 1 of read → normalize → load → reconcile.
**This ticket uses:** files, functions, pytest (known by then), reading .xlsx with pandas (NEW, core).
**Design decision (mentor, L1):** read every cell as text first, type it later, so Excel never guesses for you.
**Time box:** 2 sessions. **Work transfer:** renewals parser.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 read_workbook(path, sheet) returns raw rows with the real header found even when it is not on row 1
- [ ] #2 Totals and blank rows dropped; count of dropped rows reported
- [ ] #3 2+ pytest tests on the fixture
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
