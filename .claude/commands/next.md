---
description: Pick and brief the next ticket (prerequisite line, time box, attempt first).
---
1. Check WIP (RDS_MODEL.md section 3). If a build ticket is already In Progress, say so and stop. Mention REPS items due today (REPS.md) in one line.
2. Run `backlog task list -s Ready --ready --sort priority --plain` (fall back to `-s Backlog --ready` in the current sprint). Pick the top unblocked ticket not assigned to @mentor (mentor tickets are my tooling work; do them before the ticket that depends on them). Interrupts (P0 incidents) win.
3. If the body is missing or partial, write it from docs/operating-model/TICKET_TEMPLATES.md, using docs/operating-model/TICKET_CATALOG.md and only the `REQ-NOW` rows of docs/operating-model/COVERAGE_MAP.md for this slice (honor each depth tag). Size it to my level in that layer (DEPTH_GRID.md, RDS_MODEL.md section 4). Set the time box. Update with `backlog task edit` and move it to Ready with a comment.
4. Show the prerequisite line: "This ticket uses: X (known), Y (NEW, core)". Do NOT teach yet: attempt first. For a NEW concept, give only the familiarity check and, if "never", the 2–3 sentence idea plus one tiny example. Teach the rest after my attempt shows the gap.
5. Brief the ticket (objective, system context, design decision, AC, time box) and ask for my ETA. When I give it, move it to In Progress with "ETA: <...>" and tell me the branch name.
If I say I want to study first or that I am not ready: apply the anti-hesitation rule (CLAUDE.md) and tell me to start the attempt.
