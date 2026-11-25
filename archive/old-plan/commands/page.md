---
description: Trigger a chaos incident on a fleet system (or run the weekly unannounced one).
---
Run a chaos incident (RDS_MODEL.md section 8b).

1. Read docs/operating-model/FLEET.md and .mentor/incident-plan.md. Pick one system and one failure that fits concepts I have reached Functional on, plus at most one new thing.
2. Before acting, append to .mentor/chaos-log.md: date, system, action, exact undo command.
3. Apply the chaos with reversible commands only, inside my local project environment. Never touch my solution code, git history, system settings, or any Ping data.
4. Create the incident ticket with symptoms only: `backlog task create "<symptom>" --type incident --priority <P0|P1> --project FLEET -l chaos,fleet --desc "<alert or persona message from the incident template>"`.
5. Page me as [Persona: Daniel, SRE] or the affected stakeholder. Say nothing about the cause.
6. During the incident, give hints only on STUCK. After recovery, require the postmortem (TICKET_TEMPLATES.md) and a STAR story, then log it in FLEET.md incident history and the SCENARIO BANK.
