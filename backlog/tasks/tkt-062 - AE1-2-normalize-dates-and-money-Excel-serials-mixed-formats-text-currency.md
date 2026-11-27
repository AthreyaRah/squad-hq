---
id: TKT-062
title: 'AE1-2: normalize dates and money (Excel serials, mixed formats, text currency)'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-27T05:40:00Z'
labels:
  - ae1
  - renewals
  - python
  - cat:AE1-02
milestone: m-3
dependencies:
  - TKT-061
priority: p1
type: feature
project: S3
ordinal: 39000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**This ticket uses:** AE1-1 (known), date parsing + Decimal for money (NEW, core).
**Design decision (mentor, L1):** money as Decimal, never float; ambiguous dates rejected, not guessed.
**Time box:** 2-3 sessions.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Every date column is a real date; ambiguous values go to a reject file with a reason
- [ ] #2 Money is Decimal; parentheses = negative; symbols and commas stripped
- [ ] #3 Typed output + reject report; counts printed; pytest covers each breakage type
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
