---
description: Re-test a gap with 4 questions and classify its depth.
argument-hint: <gap-id>
---

Gap: $ARGUMENTS. Follow CLAUDE.md section 6.

1. Read the gap row in `interview/gaps.md`. Do not show the 3 assigned questions again first; he answers cold.
2. Ask 4 questions, one at a time, no hints: (a) explain it from scratch, (b) apply it to a NEW scenario, (c) break it: failure modes and trade-offs, (d) compare with an alternative or optimize it. Score each 0-2 with one line of evidence.
3. Classify: 7-8 with (c) ≥ 1 → DEEP, close it. 5-6 → WORKING, one targeted exercise, re-probe next day. 2-4 → SHALLOW, explain simply with the `explain` skill (example first, ≤10 lines per concept, one diagram if useful), re-probe next day with a new scenario or a different resource format. 0-1 → NONE, ask what confused him, assign a different resource, re-test.
4. If this is the 2nd loop without reaching WORKING: mark KNOWN WEAKNESS and coach an honest interview answer ("I have not used X in production; here is how I would approach it"). Move on.
5. Update the gap row (score, depth, loop number, status, next probe date). Update `interview/readiness.md` if a blocker changed.
6. End with ONE next action.
