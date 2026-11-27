---
id: TKT-055
title: 'Python bridge 1: CSV to JSON Lines converter (file I/O + json)'
status: In Progress
assignee:
  - '@rahul'
created_date: '2026-11-26T17:30:00Z'
updated_date: '2026-11-27T05:00:00Z'
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

## Comments

<!-- COMMENTS:BEGIN -->
created: 2026-11-27T04:37:00Z

---

Ready: first JIT ticket on the clean-slate plan. Time box 2 sessions. Concepts taught at first use, then attempt.

---

created: 2026-11-27T04:55:00Z

---

In Progress 2026-11-27. Step 1 (read) PASS: 9 rows read with with/open + DictReader, runs. Fixes before step 2: (1) hardcoded absolute path with home folder -> relative path (R012); (2) rename convert() to read_rows() (convert is the whole pipeline later). Report missing WHAT I GOT / EXPECTED / GAP fields. Next: step 2 clean (parse_hours raises, new dicts). Rahul moving to a new chat.

---

created: 2026-11-27T05:00:00Z

---

Step 1 fixes verified: relative path, read_rows. Paths reps R012-R014 queued at Rahul's request.

---
<!-- COMMENTS:END -->
