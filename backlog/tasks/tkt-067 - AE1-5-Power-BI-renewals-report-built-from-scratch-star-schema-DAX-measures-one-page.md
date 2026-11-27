---
id: TKT-067
title: >-
  AE1-5: Power BI renewals report built from scratch (star schema, DAX measures,
  one page)
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-27T06:18:00Z'
updated_date: '2026-11-27T06:18:00Z'
labels:
  - ae1
  - renewals
  - powerbi
  - portfolio
  - cat:AE1-05
milestone: m-3
dependencies:
  - TKT-064
priority: p1
type: feature
project: S3
ordinal: 44000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Why:** Rahul's Power BI years were maintaining reports someone else built. Safety-net applications in Dec need a Power BI piece he built and can defend.
**This ticket uses:** GRR/NRR SQL from AE1-4 (known), Power BI modeling from a blank file: star schema, relationships, DAX measures (NEW, core, taught at first use).
**Design decision (mentor, L1):** measures in DAX, not calculated columns, for GRR/NRR; one fact + 2-3 dimensions.
**Open:** Power BI Desktop is Windows-only; machine choice decided at /next.
**Time box:** 3 sessions. AE3 deepens it (dbt gold, RLS, Genie).
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Star schema: 1 fact, 2-3 dims, relationships one-to-many, single direction
- [ ] #2 GRR and NRR DAX measures match AE1-4 SQL numbers exactly
- [ ] #3 One report page; README with a model diagram; explain-back of filter context on one measure
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
created: 2026-11-27T06:18:00Z

---

Machine decided (Rahul, 2026-11-27): personal Windows PC with Power BI Desktop. Data moves from the Mac via the public repo (synthetic only). Check the current Power BI Desktop version at /next.

---
<!-- COMMENTS:END -->
