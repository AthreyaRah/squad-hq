---
id: TKT-001
title: 'Workstation setup: terminal, package manager, Git, Node.js, Backlog.md'
status: Done
assignee:
  - '@rahul'
created_date: '2026-10-23T06:55:00Z'
updated_date: '2026-10-25T04:10:00Z'
labels:
  - stage-0
  - cat:P0-01
milestone: m-0
dependencies: []
priority: p0
type: chore
project: P0
ordinal: 1000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor (L1)

### Why this ticket exists
Every later ticket runs in the terminal with these tools. (The bootstrap script runs `git init` for the tracker; TKT-002 teaches what Git does with it.) A tool that only works in one window is not installed.

### This ticket uses
The terminal (NEW, core). Installs are commands the mentor teaches in full.

### Production for a chore
Every tool works from a NEW terminal window.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 `git --version`, `node --version`, and `backlog --version` print versions in a new terminal window
- [x] #2 I can explain what PATH is and why a new window matters, in 2–3 sentences
- [x] #3 `backlog board` shows this ticket In Progress
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [x] #1 PR merged after mentor APPROVED
- [x] #2 CI green (once the repo has CI)
- [x] #3 Released and verified in production (RDS_MODEL.md section 6)
- [x] #4 Explain-back and understanding check passed
- [x] #5 Concept Log and PROGRESS.md updated
<!-- DOD:END -->

## Implementation Plan

<!-- SECTION:PLAN:BEGIN -->
Taught from zero in session 1, one tool at a time: terminal → package manager → Git → Node.js → Backlog.md → run tools/bootstrap_tracker.sh.
<!-- SECTION:PLAN:END -->

## Comments

<!-- COMMENTS:BEGIN -->
author: @mentor
created: 2026-10-25T04:06:00Z

---

AC1-3 verified: versions printed in a new window (git 2.56.0, node v26.11.1, backlog 1.55.2); PATH explained incl. order and why a new window matters; board shows TKT-001 In Progress. DoD 1-2 n/a: no remote repo or CI yet (TKT-002/003). DoD 3 n/a: chore, tool works from a new window. Still open: understanding check, Concept Log, PROGRESS.md.

---

author: @mentor
created: 2026-10-25T04:10:00Z

---

Understanding check passed: cd/pwd/ls/which git typed correctly, confidence 5. Concept Log (2 rows) and PROGRESS.md updated. Done.

---
<!-- COMMENTS:END -->
