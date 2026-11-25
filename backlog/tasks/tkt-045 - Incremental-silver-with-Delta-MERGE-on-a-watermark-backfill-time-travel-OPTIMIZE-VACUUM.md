---
id: TKT-045
title: >-
  Incremental silver with Delta MERGE on a watermark; backfill; time travel;
  OPTIMIZE/VACUUM
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-25T17:25:00Z'
labels:
  - slice-1
  - v1
  - spark
  - planted-bug
  - cat:S1-10
dependencies:
  - TKT-035
priority: p2
type: feature
project: S1
ordinal: 22000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (S1 v1, design Level 1) · **Slice:** S1 v1
**Requested by:** [Persona: Fatima, Head of Ops Analytics] "Yesterday's load ran twice and Finance saw double hours. And the nightly job is getting slow."

### Objective
Replace the full silver rebuild with an incremental MERGE driven by a watermark (max updated_at seen). Add a safe backfill for a date range. Use time travel to undo a bad load. Show the small-files problem and fix it with OPTIMIZE; explain VACUUM retention.

### Design decision (Level 1)
Watermark on `updated_at` vs on ingest time. **Decision:** `updated_at` with a lookback window (catches late updates). Trade-off: reprocesses the lookback each run.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Running the same window twice gives identical silver (test)
- [ ] #2 A backfill of 5 days gives the same result as the daily runs (test)
- [ ] #3 A bad load is undone with time travel; the PR shows the version numbers
- [ ] #4 File count before/after OPTIMIZE in the README; VACUUM retention explained in 3 lines
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->
