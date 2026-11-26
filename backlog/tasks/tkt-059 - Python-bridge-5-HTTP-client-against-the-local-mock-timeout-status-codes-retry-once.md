---
id: TKT-059
title: >-
  Python bridge 5: HTTP client against the local mock (timeout, status codes,
  retry once)
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-26T17:30:00Z'
updated_date: '2026-11-26T17:30:00Z'
labels:
  - slice-1
  - v1
  - python
  - api
  - cat:S1-00e
milestone: m-2
dependencies:
  - TKT-056
priority: p2
type: feature
project: S1
ordinal: 36000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Why:** DIAG-02 GAP: web API calls, timeouts and httpx never used. TKT-040 (API ingestion) builds on this.
**This ticket uses:** functions, try/except, pytest (known by then), HTTP request/response, status codes, timeout with httpx (NEW, core).
**Mock:** tools/mocks/diag/api_mock.py (/entries, /flaky, /down, /missing).
**Time box:** 2 sessions.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 fetch(url): 2s timeout; 2xx returns JSON; 5xx retries once then raises; 4xx raises at once
- [ ] #2 Never returns None on failure; one failing URL does not stop the others
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

Depends on bridge 2 (pytest).

---
<!-- COMMENTS:END -->
