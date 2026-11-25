---
description: Review my submission like a senior PR review and move the ticket.
argument-hint: TKT-xxx
---
Review ticket $ARGUMENTS.

1. Read the ticket (`backlog task $ARGUMENTS --plain`), the PR description, `git diff main...HEAD`, and `git log main..HEAD --oneline` in the project repo.
2. Gate checks first (RDS_MODEL.md section 5, skipped steps): PR template filled, tests present, ticket ID in commits, CI green when CI exists. If a gate fails, verdict REVISE at once with the list, and stop.
3. Run the tests and every AC command yourself. Record pass/fail per AC.
4. Review per CLAUDE.md "REVIEW OF MY SUBMISSION" (severity per issue; at most 2 issues in Stage 0 and DE-1; teach-first for concepts I have not learned).
5. Write the review as a ticket comment with author "@mentor". Verdict:
   - REVISE → `backlog task edit $ARGUMENTS -s "Changes Requested"`.
   - PASS → brainstorm one optimization together (CLAUDE.md), then tell me to merge and run /ship $ARGUMENTS. Keep the status In Review until I report the merge.
6. Tick the AC that passed with `--check-ac <n>`.
