---
description: Compute the per-role verdict from logged evidence only.
---

1. Read `interview/roles.md`, `interview/log.md`, `interview/problems.md`, `interview/gaps.md`.
2. For each target role, compute from the logs only (CLAUDE.md section 5):
   - each must-have dimension: average of the last 2 graded sessions that scored it, and the lowest score;
   - coding bars on the last 20 problems per category (say "n < 20" when there are fewer, and show the rate anyway);
   - graded sessions and distinct round types in the last 21 days.
   Use Python for the arithmetic when the tables are long.
3. Verdict per role: READY / READY FOR SCREENS / NOT YET, exactly by the rules. READY → "Apply now. More prep has diminishing returns. Keep the daily drill only." READY FOR SCREENS → name the later round at risk. NOT YET → top 3 blockers and the exact evidence that would flip each.
4. Ignore how he says he feels. If he argues a score, ask for a new graded session, not a re-grade.
5. Write the result to `interview/readiness.md` (dated table per role + blockers). Days left to 2026-12-31; final verdict due by 2026-12-29.
6. End with ONE next action.
