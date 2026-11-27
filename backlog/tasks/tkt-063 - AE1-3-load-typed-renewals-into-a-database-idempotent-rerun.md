---
id: TKT-063
title: 'AE1-3: load typed renewals into a database, idempotent rerun'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-27T05:40:00Z'
labels:
  - ae1
  - renewals
  - python
  - sql
  - cat:AE1-03
milestone: m-3
dependencies:
  - TKT-062
priority: p1
type: feature
project: S3
ordinal: 40000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**This ticket uses:** SQL (known), Python → database connection with DuckDB (NEW, core). MySQL swap later via the same function.
**Design decision (mentor, L1):** replace-by-file-month (delete + insert in one transaction) so a rerun never doubles rows.
**Time box:** 2 sessions.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Loading month 1 twice gives the same row count
- [ ] #2 Load is one transaction: a failure leaves the table as before
- [ ] #3 Row counts logged per file
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
