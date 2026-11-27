---
id: TKT-064
title: 'AE1-4: GRR and NRR in SQL that reconcile to a hand-checked number'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-27T05:40:00Z'
labels:
  - ae1
  - renewals
  - sql
  - cat:AE1-04
milestone: m-3
dependencies:
  - TKT-063
priority: p1
type: feature
project: S3
ordinal: 41000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Requested by:** [Persona: Omar, Finance Controller] "Your NRR must match my spreadsheet to the cent."
**This ticket uses:** SQL CTEs, joins (known), GRR/NRR definitions and the cohort grain (NEW, core).
**Time box:** 2 sessions.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 GRR and NRR for the fixture match the mentor's hand-checked values exactly
- [ ] #2 Definitions written in a short glossary file (feeds AE3)
- [ ] #3 Explain-back: why GRR caps at 100% and NRR does not
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
