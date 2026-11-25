---
id: TKT-041
title: 'AWS basics: S3 bucket and least-privilege IAM role; land bronze files in S3'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
labels:
  - slice-1
  - v1
  - aws
  - cloud
  - cat:S1-09
dependencies:
  - TKT-034
priority: p3
type: chore
project: S1
ordinal: 18000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (S1 v1, design Level 1) · **Slice:** S1 v1 · **Work transfer:** PS pod medallion
**Requested by:** [Persona: Fatima, Head of Ops Analytics] "Every month Finance adds new custom fields to time entries and our pivots break. I need utilization I can trust, every morning."

### Objective
Free-tier S3 bucket + an IAM role/user that can only write to one prefix. Land bronze files there. Cost guard: a budget alert.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Policy JSON in the repo allows only the one prefix
- [ ] #2 No root access keys used anywhere
- [ ] #3 Budget alert set; teardown steps in the README
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
