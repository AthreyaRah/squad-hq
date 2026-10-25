---
id: TKT-002
title: Commit the tracker to the Squad HQ git repo
status: Done
assignee:
  - '@rahul'
created_date: '2026-10-23T06:55:00Z'
updated_date: '2026-10-25T09:56:00Z'
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
- [x] #1 `git log --oneline` shows the tracker commit
- [x] #2 `git status` is clean; `projects/` and `.mentor/` do not appear (ignored)
- [x] #3 I explain the difference between the working folder, the staging area, and a commit
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [x] #1 PR merged after mentor APPROVED
- [x] #2 CI green (once the repo has CI)
- [x] #3 Released and verified in production (RDS_MODEL.md section 6)
- [x] #4 Explain-back and understanding check passed
- [x] #5 Concept Log and PROGRESS.md updated
<!-- DOD:END -->

## Comments

<!-- COMMENTS:BEGIN -->
author: @mentor
created: 2026-10-25T09:56:00Z

---

AC1-2 verified by mentor: commit bc53b74 in log, status clean, projects/ .mentor/ .DS_Store untracked. AC3 explained back, confidence 3.5. Low issue: message says 'TKT 002' not 'TKT-002' (fix later). DoD 1-3 n/a: no remote/CI yet.

---
<!-- COMMENTS:END -->
