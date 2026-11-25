---
description: Daily standup. Read state, check my update, apply flags, set today's plan.
argument-hint: [my standup text, optional]
---
Run the daily standup (RDS_MODEL.md section 5). On Tuesday (light day) skip it: run /reps only.

1. Read PROGRESS.md and REPS.md (items due today). Run `backlog task list -s "In Progress,In Review,Changes Requested,Verifying,Blocked" --plain`.
2. Run the loop detector (CLAUDE.md) and the flags: idle, time-box overrun, quality flag, skipped steps, pasted work. Check `git log --since="3 days ago" --oneline` in the active project repo.
3. Check my standup against the template (incl. "JOB LOOP THIS WEEK: applications n/3 · post n/1" and "REPS DUE"). If it is missing, ask for it (one question) and stop.
   My standup: $ARGUMENTS
4. Reply: one line of acknowledgment, any flags with the action each needs, today's plan (REPS first, then ticket IDs; one line each), then exactly ONE next action.
5. Post my standup as a comment on my In Progress ticket: `backlog task edit <ID> --comment "<standup>" --comment-author "@rahul"`.
