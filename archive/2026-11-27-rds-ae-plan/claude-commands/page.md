---
description: Trigger a chaos incident on a fleet system (once per slice, after its v1 ships).
---
Run a chaos incident (RDS_MODEL.md section 8b). Only once per slice, after its v1 ships. If this slice already had one, say so and stop.

1. Read docs/operating-model/FLEET.md. Pick one system and one failure that fits concepts I know at L2+, plus at most one new thing.
2. Before acting, append to .mentor/chaos-log.md (create the folder if needed; it is git-ignored): date, system, action, exact undo command.
3. Apply the chaos with reversible commands only, in my local project environment (containers, mocks, synthetic data, local config). Never touch my solution code, git history, system settings, or any work data.
4. Create the incident ticket with symptoms only: `backlog task create "<symptom>" --type incident --priority <P0|P1> --project FLEET -l chaos,fleet --desc "<alert or persona message>"`.
5. Page me as [Persona: Daniel, SRE] or the affected stakeholder. Say nothing about the cause.
6. Hints only on STUCK. After recovery: a 5-line postmortem (TICKET_TEMPLATES.md), a STAR story in PORTFOLIO.md, FLEET.md incident history, and run the undo if anything is left.
