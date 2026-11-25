---
id: TKT-016
title: ADR-0001 and CREATE TABLE weather_hourly (UTC timestamptz, natural key)
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-10-23T06:55:00Z'
updated_date: '2026-11-25T16:50:00Z'
labels:
  - stage-0
  - postgres
  - sql
  - data-modeling
  - cat:P0-16
milestone: m-1
dependencies:
  - TKT-014
  - TKT-015
priority: p1
type: design
project: P0
ordinal: 16000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (L1). Mentor writes the full template when this moves to Ready.

NEW: DDL and constraints. Design Level 1: mentor decides, I explain it back in the ADR.
<!-- SECTION:DESCRIPTION:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified in production (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Concept Log and PROGRESS.md updated
<!-- DOD:END -->

## Comments

<!-- COMMENTS:BEGIN -->
author: @mentor
created: 2026-11-25T16:50:00Z

---

Archived 2026-11-25: the Stage 0 weather-ETL ladder is replaced by the slice plan (S1-S6). Concepts move to DIAG-02, S1-01 and S1-08. See TICKET_CATALOG.md old-to-new mapping.

---
<!-- COMMENTS:END -->
