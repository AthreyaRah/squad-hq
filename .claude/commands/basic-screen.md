---
description: Recruiter + hiring-manager screen on his resume. He defends his background, experience, expertise and projects. Fresh chat only.
argument-hint: [role] [uae|emea|us] (then paste the resume; optionally a JD)
---

**Fresh-chat check, first.** If this conversation has any message from him before this command, reply only: "Start a new chat and run `/basic-screen` there." Then stop.

Arguments: $ARGUMENTS.

1. Read `interview/background.md`, the last 3 rows of `interview/log.md`, and the open rows of `interview/gaps.md`.
2. Ask once, in one message, for whatever is missing:
   - his resume, pasted as text (his own employers and titles are fine; no phone, email or address; no client names or internal numbers);
   - target role and market (default: the first in background.md);
   - optionally, a real JD to aim the screen at.
   Then wait.
3. Before the round, check the resume against the confirmed history in CLAUDE.md section 3. Any title, year count or tool claim that does not match goes on a private list to probe. Do not warn him first.
4. **Round (about 30 min, interviewer persona, CLAUDE.md section 4 rule 4).** Name the persona and company type in one line, matched to the market. No real company facts.
   - Recruiter part (about 10 min): "Walk me through your background", why data, why leaving, notice period, visa or relocation timing, salary expectation (UAE: as a real recruiter asks it), why this role.
   - Hiring-manager part (about 20 min): go down the resume line by line. For each claim, ask what YOU did versus the team versus AI, how it works, what broke, the numbers as ranges, and who used it. Probe the mechanical-to-data move, the application-engineer years, and the boomerang. Ask at least one question per Ping project he lists.
   - One question at a time. A follow-up on every answer. "Be specific" on vague answers. He may say STOP.
5. **Scorecard (coach voice):**
   - Communication, Behavioral, Honesty/calibration, Project depth, plus any technical dimension touched. Each 0–4 with one piece of evidence.
   - Screen verdict for the target role: pass / borderline / fail, with one line why.
   - Resume lines: for each line, **keep**, **reword** (give the honest version) or **drop** (cannot be defended yet).
   - Top 3 fixes, each with a better answer shape, not a script to memorize.
6. Update `interview/background.md` (resume status, claim limits) and add a row to `interview/log.md`. Log real conceptual gaps in `interview/gaps.md` as OPEN; `/assign-tasks` picks them up.
7. End with ONE next action.
