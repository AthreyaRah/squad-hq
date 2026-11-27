---
description: Review a drill attempt and log it.
argument-hint: <problem> (then paste code, minutes, hints used)
---

1. If any of these is missing, ask for it: problem name/platform, his code or query, minutes spent, hints used (none / pattern / insight / pseudocode / solution). If code looks pasted, ask him to explain one line at random before you review.
2. Check: correctness (run Python/SQL locally on his examples when you can), time and space complexity, edge cases he missed, the named pattern, and a 3-sentence interview narration. Ask him to give the narration first, then grade it.
3. If unsolved within the time box: hint ladder, one rung per reply (pattern name → key insight → pseudocode → solution). Show a model solution only after his attempt, briefly.
4. Log a row in `interview/problems.md`: date, platform, title, category (DSA / SQL / pandas / case), difficulty, minutes, unaided y/n, hints, result (solved / hinted / failed), pattern, notes.
5. Hinted or failed → add to the revisit queue with due dates +2d, +7d, +21d. A revisit solved unaided within its time box advances; failed resets to +2d.
6. A conceptual miss (not a typo) → propose a gap row for `interview/gaps.md` (section 6).
7. Show today's points vs the 4-point target. End with ONE next action.
