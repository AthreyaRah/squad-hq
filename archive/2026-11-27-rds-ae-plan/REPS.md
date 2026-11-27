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
| R004 | Customers with no orders, 3 ways from a blank file (NOT IN null-safe, NOT EXISTS, LEFT JOIN … IS NULL), with names | SQL | TKT-027 P2 (syntax looked up) | 2026-11-26 | 2026-11-28 | +2d | 0 |
| R005 | Why `x NOT IN (1, 2, NULL)` returns no rows: three-valued logic (TRUE/FALSE/UNKNOWN) and which WHERE results keep a row | EXPLAIN | TKT-027 P2 | 2026-11-26 | 2026-11-28 | +2d | 0 |
| R006 | ROWS vs RANGE: predict running totals on a table with tied ORDER BY values, then say which frame is the default with ORDER BY and when it bites | EXPLAIN | TKT-027 P3 gap | 2026-11-26 | 2026-11-28 | +2d | 0 |
| R007 | Prove a dedup returned one row per key: write the count check (count(*) vs count(DISTINCT key)), and say what ROW_NUMBER, RANK and DENSE_RANK return on a full tie | SQL | TKT-027 P4 | 2026-11-26 | 2026-11-28 | +2d | 0 |
| R008 | Read a 3-table EXPLAIN plan bottom-up: name each box, say build vs probe side of each HASH_JOIN, point to the step that scales with the biggest table | EXPLAIN | TKT-027 P5 gap | 2026-11-26 | 2026-11-28 | +2d | 0 |
| R009 | Group-and-sum where every key must appear: total billable hours per consultant from a list of dicts, including a consultant with 0 billable hours. From a blank file, two ways (`dict.get` and an `if key not in` check first) | CODE | TKT-028 P2 | 2026-11-26 | 2026-11-28 | +2d | 0 |
| R010 | `raise` vs `return` an exception: write `parse_hours(value)` that raises ValueError naming the bad value, then call it inside try/except from another function. Say what the caller gets if you `return ValueError(...)` instead | CODE | TKT-028 P3 | 2026-11-26 | 2026-11-28 | +2d | 0 |
| R011 | Clean rows without changing the caller's data: build new dicts instead of editing `row[...]` in place. Show the original list before and after, and say why in-place edits bite in a pipeline | CODE | TKT-028 P3 | 2026-11-26 | 2026-11-28 | +2d | 0 |
| R012 | Why a hardcoded absolute path (`/Users/<you>/...`) breaks a script on another machine, in CI and in a public repo; rewrite it relative, and say which folder a relative path is resolved from | EXPLAIN | TKT-055 step 1 | 2026-11-27 | 2026-11-29 | +2d | 0 |
| R013 | Paths drill in the terminal: from 3 different folders, predict then check where `data/time_entries.csv`, `./data/...`, `../python/data/...` and `~/Documents/...` point (`pwd`, `ls`). Then run convert.py from the parent folder, explain the FileNotFoundError, and fix the command (not the code) | CMD | TKT-055 step 1 (Rahul asked) | 2026-11-27 | 2026-11-29 | +2d | 0 |
| R014 | Absolute vs relative path from a blank page: define both, give one example each on your Mac, and say which one belongs in code you will push to a public repo and why | EXPLAIN | TKT-055 step 1 (Rahul asked) | 2026-11-27 | 2026-12-04 | +1w | 0 |

## Retired

| ID | Item | Type | Source | Added | Retired on |
|---|---|---|---|---|---|
