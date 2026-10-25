---
id: TKT-003
title: GitHub account, gh auth login, push Squad HQ to a private repo
status: Ready
assignee:
  - '@rahul'
created_date: '2026-10-23T06:55:00Z'
labels:
  - stage-0
  - git
  - cat:P0-03
milestone: m-0
dependencies:
  - TKT-002
priority: p1
type: chore
project: P0
ordinal: 3000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (L1)

### This ticket uses
Git basics (TKT-002), remotes and push (NEW, core).
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The private repo shows the tracker commit on GitHub
- [ ] #2 `git status` says the branch is up to date with origin/main
- [ ] #3 I explain what `origin` is and what `git push` sends
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified in production (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Concept Log and PROGRESS.md updated
<!-- DOD:END -->
