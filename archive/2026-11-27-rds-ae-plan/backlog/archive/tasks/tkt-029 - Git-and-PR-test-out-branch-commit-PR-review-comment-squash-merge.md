---
id: TKT-029
title: 'Git and PR test-out: branch, commit, PR, review comment, squash-merge'
status: Ready
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
updated_date: '2026-11-27T04:37:00Z'
labels:
  - diagnostic
  - git
  - cat:DIAG-03
milestone: m-2
dependencies: []
priority: p1
type: spike
project: DIAG
ordinal: 6000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor · **Time box:** 45 min · **Rules:** no notes, no AI, attempt first. Mentor gives probes one at a time via `/diag`; answer keys stay in `.mentor/`.

### Why this ticket exists
Test out, do not re-learn. The result sets my known list and baseline level, so every later ticket sits just above what I can already do.

### Probes (a throwaway public repo `git-sandbox`)
1. Create a branch with the naming rule, make 2 commits with Conventional Commit messages.
2. Push and open a PR with `gh pr create` using the PR template.
3. Fix a commit message before pushing (amend) and explain why not after a push.
4. Squash-merge with `gh`, delete the branch, pull main.
5. Explain: what `origin/main` is vs `main`.

### Result
KNOWN / SHAKY / GAP in a comment.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 PR link posted as a comment; it was squash-merged
- [ ] #2 Commit messages follow Conventional Commits
- [ ] #3 DEPTH_GRID.md Git row updated with evidence
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
created: 2026-11-25T17:03:00Z

---

Ready: full body, time box set, no prerequisites (diagnostic). Attempt first via /diag.

---

created: 2026-11-27T04:37:00Z

---

Cancelled 2026-11-27 (Rahul's call): no more skill test-outs. Clean-slate JIT: Git/PR flow is taught at first use in TKT-033.

---
<!-- COMMENTS:END -->
