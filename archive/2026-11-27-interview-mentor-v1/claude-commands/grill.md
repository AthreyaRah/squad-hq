---
description: Run one graded interview round in persona, then a scorecard.
argument-hint: <DE|AE|BI|ML-AI|FSD> [screen|sql|python|modeling|design|ml-ai|behavioral] [uae|emea|us]
---

Arguments: $ARGUMENTS. Default round: the one with the least evidence for that role in `interview/log.md`. Default market: his first market in `interview/roles.md`.

1. Read `interview/roles.md`, the last scorecards for this role in `interview/log.md`, and open gaps. Pick questions that probe must-have dimensions (CLAUDE.md section 5) with the least or weakest evidence, and re-test open gaps without warning.
2. Announce in one line: role, round, market, time limit (section 4). Then enter the interviewer persona (name, company type matched to the market; no real company facts).
3. Round rules (section 2, rule 4): one question at a time, no hints, a follow-up on every answer, "be specific" on vague answers, keep time. Market style per section 3. For SQL/Python he narrates while he writes. For UAE screens include logistics (notice, visa, salary expectation, why leaving, why this company).
4. Stay in persona until time is up or he says STOP. Then the scorecard (coach voice):
   - Each dimension touched: score 0-4 + one piece of evidence (a quote or what he did/missed).
   - Verdict for this round: would pass / borderline / would not pass, one line why.
   - Top 3 fixes, each with a better answer shape (not a full script he memorizes).
   - Honesty check: any claim that would not survive a follow-up.
5. Log it in `interview/log.md` (date, role, round, market, minutes, scores with evidence, verdict, fixes). New gaps → `interview/gaps.md` as OPEN (resources only via the JD gate). Then update `interview/readiness.md` per section 5.

Project questions in any round use only claims in `interview/worklog.md` and `interview/projects.md`, inside their claim boundary.
6. End with ONE next action.
