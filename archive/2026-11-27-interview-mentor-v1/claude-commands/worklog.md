---
description: Record progress on a work project (the claim boundary), then grill the new part like an interviewer.
argument-hint: <project> (then: done up to here, my part, tools, not done yet)
---

Follow CLAUDE.md section 4.2. Project: $ARGUMENTS.

1. **Intake.** Ask for any of these he left out, in one message:
   - project (anonymized name), and the business question in one line;
   - done up to here (what exists and works now);
   - his part vs the team's vs AI-generated;
   - tools and stack;
   - scale as ranges only (rows, users, tables, refresh);
   - not done yet / next.
   If he gives real Ping values, client names, internal metric values or personal data: stop, tell him to restate it anonymized, and do not log it.
2. **Record.** Append a dated entry to the project in `interview/worklog.md`, then rewrite that project's "Claim boundary": 1–3 resume-style lines he could say on a call, scoped only to what is done. Show him the boundary and ask "Is this what you would say?" before grilling.
3. **Grill (15–25 min, interviewer persona, rules in CLAUDE.md section 2 rule 4).** Open the way an interviewer would: "You mentioned <claim>. Walk me through it." Then follow up on the NEW part only, through the defense layers that apply (ownership, context, design, mechanics, quality, scale, hindsight). Go deep on why, trade-offs, what broke, and alternatives inside the claim. Add one spot-check on an older claim of the same project, if one exists. Ask at most one "what is next?" question about the not-done part.
4. **Never** grill a topic outside the boundary. **Never** grade the not-done part as a gap.
5. **Scorecard (coach voice):** Project depth, Communication, Honesty/calibration, and any of SQL / Data modeling / Pipeline design / ML-AI / Analytics touched. Each 0–4 with evidence.
   - Each claim he could not defend: give the honest restatement, or "drop this line until you can explain it". No course assignment.
   - Then 1–2 better answer shapes for his weakest answer.
6. Log the round in `interview/log.md` (round: worklog, project id). Note real conceptual gaps in `interview/gaps.md` as OPEN (no resource; CLAUDE.md section 6 gate). Update `interview/readiness.md` if a must-have score changed.
7. End with ONE next action.
