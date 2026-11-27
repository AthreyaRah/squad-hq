---
description: Review my submission like a senior PR review and move the ticket.
argument-hint: TKT-xxx
---
Review ticket $ARGUMENTS.

1. Read the ticket (`backlog task $ARGUMENTS --plain`), the PR description, `git diff main...HEAD`, and `git log main..HEAD --oneline` in the project repo.
2. Gate checks first (RDS_MODEL.md section 5): PR template filled, tests present, ticket ID in commits, CI green when CI exists. If a gate fails: REVISE at once with the list, and stop.
3. Run the tests and every AC command yourself. Record pass/fail per AC.
4. Pasted-work check: pick one non-trivial line at random and ask me to explain it before you give the verdict. If I cannot, REVISE.
5. Review per CLAUDE.md "REVIEW OF MY SUBMISSION". Slice S1 v1: at most 3 issues, most important first. Teach-first for concepts I have not learned.
6. Add every finding to REPS.md (date, item, source TKT, next due = +2 days).
7. Write the review as a ticket comment (author "@mentor"). Tag each finding with its severity in parentheses, e.g. "(high)", and write the verdict word (PASS or REVISE), so tools/metrics.py can count them. Verdict:
   - REVISE → `backlog task edit $ARGUMENTS -s "Changes Requested"`.
   - PASS → one optimization together, then tell me to merge and run /ship $ARGUMENTS. Keep it In Review until I report the merge.
8. Tick passed AC with `--check-ac <n>`.
