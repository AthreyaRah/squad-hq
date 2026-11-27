---
id: TKT-060
title: >-
  MENTOR: renewals twin generator (synthetic finance Excel with real-world
  breakage)
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-27T05:40:00Z'
labels:
  - ae1
  - renewals
  - planted-bug
  - cat:AE1-00
milestone: m-2
dependencies: []
priority: p1
type: chore
project: S3
ordinal: 37000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Owner:** mentor. **Time box:** 1 session.
Synthetic renewals workbook(s) shaped like finance exports: contracts, customers, start/end dates, ARR, renewal ARR, currency. Planted breakage (not listed to Rahul): mixed date formats and Excel serials, money as text with symbols/commas/parentheses, header not on row 1, totals and blank rows, extra sheets, trailing spaces, a duplicate contract.
Lives in tools/mocks/renewals/. No real data.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Generator script + 2 workbooks (month 1, month 2) under tools/mocks/renewals/
- [ ] #2 Hand-checked GRR and NRR for the fixture saved in .mentor/
<!-- AC:END -->
