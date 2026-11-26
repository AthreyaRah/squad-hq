---
id: TKT-055
title: 'Python bridge 1: CSV to JSON Lines converter (file I/O + json)'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-26T17:30:00Z'
labels:
  - slice-1
  - v1
  - python
  - cat:S1-00a
milestone: m-2
dependencies: []
priority: p1
type: feature
project: S1
ordinal: 32000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Why:** DIAG-02 (TKT-028) GAP: file I/O and json never used. Bronze (TKT-034) reads and writes files.
**This ticket uses:** functions, dicts, try/except ValueError (known), file I/O with open/with + csv + json (NEW, core).
**Time box:** 2 sessions. Body + prerequisite line filled at /next.
**Input:** projects/diag-scratch/python/data/time_entries.csv (9 rows, 2 bad hours).
**Also closes:** R010 (raise vs return), R011 (no in-place edits) in real code.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 convert(csv_path, jsonl_path) writes 7 JSON lines with hours float and billable bool; returns (7, 2)
- [ ] #2 parse_hours raises ValueError naming the bad value; clean() uses it; input rows are not modified
- [ ] #3 Missing input file gives a clear message naming the path, not a bare traceback
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
