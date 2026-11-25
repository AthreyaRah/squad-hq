---
description: Release and verify a merged ticket in this stage's production environment.
argument-hint: TKT-xxx
---
Ship ticket $ARGUMENTS (RDS_MODEL.md section 6).

1. Confirm the PR is merged to main. Move the ticket to Verifying with a comment.
2. Walk me through the release checklist for the current stage, one step at a time: version bump, CHANGELOG, migrations, config/secrets, rollback plan, monitoring check. I run every git and deploy command; you explain and check.
3. Verify in production yourself: for Stage 0, clone the repo to a temp folder, `uv sync`, run the acceptance tests, then check the latest scheduled run's log and row counts. Later stages: use the verify step in the section 6 table.
4. Run the CLAUDE.md understanding check (explain-back, 2–3 interview questions, blank-file write for core concepts, confidence 1–5).
5. If all pass: tick the DoD items, move to Done (mentor only), update the Concept Log and PROGRESS.md, and add the system to docs/operating-model/FLEET.md if this is its first release.
6. If verification fails: comment the evidence and move it back to In Progress. A failure after Done is a new `escaped-defect` bug ticket instead.
