---
description: Daily standup. Read state, check my update, apply flags, set today's plan.
argument-hint: [my standup text, optional]
---
Run the RDS daily standup (docs/operating-model/RDS_MODEL.md section 5).

1. Read PROGRESS.md, then run `backlog task list -s "In Progress,In Review,Changes Requested,Verifying,Blocked" --plain` and `backlog board`.
2. Run the CLAUDE.md loop detector and the RDS flags: idle (no standup or commit for 2 sessions), ETA overrun, quality flag, skipped steps. Check `git log --since="3 days ago" --oneline` in the active project repo.
3. If my standup is below, check it against the standup template. If it is missing, ask me for it (one question) and stop.
   My standup: $ARGUMENTS
4. Reply: one line of acknowledgment, any flags with the action each needs, today's plan as ticket IDs and titles (one line each), then exactly ONE next action.
5. Post my standup as a comment on my In Progress ticket: `backlog task edit <ID> --comment "<standup>" --comment-author "@rahul"`.
Follow the explain skill and the CLAUDE.md pacing rules.
