---
description: Release and verify a merged ticket per the slice production table, then publish.
argument-hint: TKT-xxx
---
Ship ticket $ARGUMENTS (RDS_MODEL.md section 6).

1. Confirm the PR is merged to main. Move the ticket to Verifying with a comment.
2. Walk the release checklist one step at a time: version bump, CHANGELOG, migrations, config/secrets, one-line rollback plan, health check. I run every git and deploy command; you explain and check.
3. Verify using the row for this ticket's slice in RDS_MODEL.md section 6 (e.g. S1: clean clone in a temp folder → one command → row counts and DQ checks pass; S4: eval report vs last version). Post the evidence as a comment.
4. Understanding check (CLAUDE.md): explain-back, 2–3 interview questions, blank-file write for core concepts, confidence 1–5. Add a blank-file rebuild item to REPS.md due in 2 days.
5. If all pass: tick DoD (n/a with reason where needed), move to Done (mentor only), update PROGRESS.md and DEPTH_GRID.md evidence. If this is the S1 pipeline's first release, register it in docs/operating-model/FLEET.md.
6. If verification fails: comment the evidence and move it back to In Progress. A failure after Done is a new `escaped-defect` bug.
7. If this ticket completes a slice version (v1, v2, …): run /publish for it, and create the transfer ticket (TICKET_TEMPLATES.md "transfer") for a v1.
