# REPS (spaced repetition queue)

Every review finding, mistake and shaky concept becomes a row. `/reps` runs the rows due today (5–10 minutes each, no notes, no AI).
Intervals: +2 days → +1 week → +3 weeks → +2 months. Pass → next interval. Two passes in a row → move to Retired. Fail → back to +2 days, passes 0.
Drill types: SQL (write a query), CODE (a function from a blank file), EXPLAIN (say it back in 3–5 sentences), CMD (a terminal/git command and its effect).

## Active

| ID | Item (the drill) | Type | Source | Added | Next due | Interval | Passes |
|---|---|---|---|---|---|---|---|
| R001 | Home folder vs root folder: what `~` and `/` mean, and where your workspace lives | EXPLAIN | TKT-001 weak spot | 2026-11-25 | 2026-11-27 | +2d | 0 |
| R002 | Why Homebrew tools live in `/opt/homebrew/bin`, not `/usr/bin`, and how `which` + PATH decide which one runs | EXPLAIN | TKT-001 weak spot | 2026-11-25 | 2026-11-27 | +2d | 0 |
| R003 | Fix the last commit message (typo) before it is pushed, and say why you must not do it after a push | CMD | TKT-002 weak spot | 2026-11-25 | 2026-11-27 | +2d | 0 |

## Retired

| ID | Item | Type | Source | Added | Retired on |
|---|---|---|---|---|---|
