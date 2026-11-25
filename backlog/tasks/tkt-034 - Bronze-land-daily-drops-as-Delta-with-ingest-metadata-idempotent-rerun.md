---
id: TKT-034
title: 'Bronze: land daily drops as Delta with ingest metadata; idempotent rerun'
status: Backlog
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
updated_date: '2026-11-25T17:25:00Z'
labels:
  - slice-1
  - v1
  - spark
  - cat:S1-02
milestone: m-2
dependencies:
  - TKT-032
  - TKT-033
priority: p1
type: feature
project: S1
ordinal: 11000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (S1 v1, design Level 1) · **Slice:** S1 v1 · **Work transfer:** PS pod medallion
**Requested by:** [Persona: Fatima, Head of Ops Analytics] "Every month Finance adds new custom fields to time entries and our pivots break. I need utilization I can trust, every morning."

### Objective
`load_bronze(day, src_dir, lake_dir)` lands one day's drop as Delta, adding `_ingested_at`, `_source_file`, `_batch_date`.

### Design decision (Level 1)
Overwrite the day's partition (replaceWhere) vs append + dedup later. **Decision:** overwrite by `_batch_date` so a rerun is idempotent. Trade-off: late files for an old day need an explicit backfill (S1 v2).

### Out of scope
Types, dedup (S1-03).
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Loading 2026-10-01 twice leaves the same row count as once (test)
- [ ] #2 Each row has the 3 metadata columns
- [ ] #3 A missing source file raises a clear error naming the day
- [ ] #4 Output partitioned by `_batch_date`; I paste `df.explain()` and say in the PR where a shuffle happens and why
- [ ] #5 README has a 3-line Parquet vs CSV vs JSON trade-off
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
author: @mentor
created: 2026-11-25T17:25:00Z

---

Interview-coverage pass (2026-11-25): added AC so this ticket covers an interview-critical concept.

---
<!-- COMMENTS:END -->
