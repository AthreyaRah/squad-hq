---
description: Full interview loop for one role and market, one final scorecard.
argument-hint: <DE|AE|BI|ML-AI|FSD> [uae|emea|us]
---

Arguments: $ARGUMENTS. Plan for 2-3 hours; he may split it across one day.

1. Build the loop for the market (CLAUDE.md section 3):
   - uae: recruiter screen (incl. logistics) → hiring manager (stakeholder + project depth) → technical (SQL/Python or modeling) → panel (design + behavioral).
   - emea: competency screen → case-style technical → system-design conversation → behavioral.
   - us: recruiter screen → live coding (SQL + Python) → modeling/system design → behavioral (STAR) + one written-communication task (a short design note or incident summary, 15 min).
   Cover every must-have dimension for the role (section 5) at least once.
2. Announce the loop and time limits in one block, then run each round in persona with the `/grill` rules. Do not give round-by-round feedback; carry notes silently.
3. One final scorecard: each dimension 0-4 with evidence, a hire / no hire decision as a real debrief would make it, the round most at risk, and the top 3 blockers.
4. Log the loop in `interview/log.md` as one entry with sub-rounds. Gaps → `interview/gaps.md`. Recompute `interview/readiness.md`.
5. End with ONE next action.
