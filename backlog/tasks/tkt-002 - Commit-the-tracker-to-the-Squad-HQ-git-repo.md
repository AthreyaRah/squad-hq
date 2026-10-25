---
id: TKT-002
title: Commit the tracker to the Squad HQ git repo
status: Ready
assignee:
  - '@rahul'
created_date: '2026-10-23T06:55:00Z'
labels:
  - stage-0
  - git
  - cat:P0-02
milestone: m-0
dependencies:
  - TKT-001
priority: p1
type: chore
project: P0
ordinal: 2000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (L1)

### Why this ticket exists
Git is the save history of every engineering team. The tracker is the first thing we save.

### This ticket uses
The terminal (TKT-001), Git basics (NEW, core): status, add, commit, log, .gitignore.

### Deliverables
Commit: `chore(tracker): bootstrap Squad HQ (TKT-xxx)`
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 `git log --oneline` shows the tracker commit
- [ ] #2 `git status` is clean; `projects/` and `.mentor/` do not appear (ignored)
- [ ] #3 I explain the difference between the working folder, the staging area, and a commit
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified in production (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Concept Log and PROGRESS.md updated
<!-- DOD:END -->
