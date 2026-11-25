---
description: Pick and brief the next ticket (prerequisite check, concepts, full template).
---
1. Check WIP (RDS_MODEL.md section 3). If I already have a feature/bug/tech-debt/perf ticket In Progress, say so and stop.
2. Run `backlog task list --ready --sort priority --plain` and choose the top unblocked ticket in the current sprint. Interrupts (P0 incidents) win.
3. If the ticket is still in Backlog or its body is partial, write the full body from docs/operating-model/TICKET_TEMPLATES.md for its type, using docs/operating-model/TICKET_CATALOG.md, the matching rows in docs/operating-model/COVERAGE_MAP.md (honor each depth tag), and my current repo state. Update it with `backlog task edit` (description, AC, DoD extras, estimate). Move it to Ready with a comment.
4. Run the CLAUDE.md prerequisite check. Show the one line: "This ticket uses: X (practiced), Y (NEW — we learn it first)". If anything is NEW, teach the first new concept JIT (CLAUDE.md, Teaching from zero, JIT version), only to the depth this ticket needs.
5. If nothing is new, brief the ticket and ask me for my ETA. When I give it, move the ticket to In Progress with a comment "ETA: <...>" and tell me the branch name to create.
