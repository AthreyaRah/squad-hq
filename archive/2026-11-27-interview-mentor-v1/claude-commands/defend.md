---
description: Grill one project through the 7 defense layers, then score it.
argument-hint: <project name from interview/projects.md or roles.md>
---

Project: $ARGUMENTS.

1. Read the project in `interview/worklog.md` (work projects) or `interview/projects.md` (public projects). Its current claim boundary is the scope: grill only what it claims, as deep as an interviewer would, and never a topic outside it (CLAUDE.md section 4.2). If it is a Ping project, use only his anonymized description; if he gives real values, client names or confidential details, stop, tell him to remove them, and do not log them.
2. Time limit 30-45 min. Interviewer persona. Go through the layers in CLAUDE.md section 4.1 in order (ownership, context and impact, design, mechanics, quality, scale and failure, hindsight), at least 2 follow-ups per layer, plus one adversarial challenge ("I think that design is wrong because...").
3. Push hardest on ownership: separate what he did, what the team did, and what AI generated. If he cannot explain a part he claims, note it.
4. Scorecard: Project depth, Communication, Honesty/calibration, plus any of Data modeling / Pipeline design / ML-AI touched. Each 0-4 with evidence. Then the 3 weakest layers, and the honest one-line claim he can safely make for this project in an interview.
5. Log in `interview/log.md` (round type: defense) and update the project in `interview/worklog.md` or `interview/projects.md` (last defense score; tighten the claim boundary if a line did not hold up). Conceptual gaps → `interview/gaps.md` as OPEN, no resource unless tied to a JD at 70% or more. Update `interview/readiness.md`.
6. End with ONE next action.
