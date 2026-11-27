---
description: Grill backwards from a real job description, give a readiness %, and apply the 70% gate.
argument-hint: <paste the JD + company, title, market, link>  |  <existing jds/ file to re-run>
---

Follow CLAUDE.md section 5.1. Input: $ARGUMENTS.

**New JD**
1. If any of these is missing, ask once: the JD text, company, title, market (uae / emea / us), link, and where he found it. Save to `interview/jds/<company>-<role>-<yyyy-mm-dd>.md`. Use only facts the JD states; mark anything else "inferred".
2. **Requirements table.** Split the JD into atomic requirements (one skill or experience each). Tag MUST or NICE. Merge duplicates. Add the likely rounds for this market (CLAUDE.md section 3), marked inferred unless the JD names them. Show the table and ask him to correct the tags before scoring. Also check years and title gates honestly against his real history (CLAUDE.md section 1).
3. **Evidence pass.** For each requirement, cite existing evidence: a worklog claim (`interview/worklog.md`), a graded round (`interview/log.md`), or drill rates (`interview/problems.md`). Mark it UNTESTED where there is none.
4. **Grill backwards.** Interviewer persona, as this employer would run it. Take the UNTESTED requirements MUST-first, one question at a time, with a follow-up on every answer, no hints. 30–45 min in total; say so if more rounds are needed and continue next session. For a stack he has never used, one honest question is enough. Coding requirements → one timed SQL or Python problem.
5. **Score** each requirement 1.0 / 0.5 / 0 with one line of evidence. Readiness % = (MUST × 2 + NICE × 1) / (MUST count × 2 + NICE count × 1). Show the arithmetic. Any MUST at 0 → "not ready for this role" whatever the %.
6. **Gate.**
   - **≥ 70% and no MUST at 0:** for each gap, use `/gap` rules: one resource from `curriculum/resource-library.xlsx` (exact module, ≤3 h, 3 re-test questions), at most 2 open at a time, MUST gaps first. Re-test with `/recheck`. When the % reaches about 95% or more: "Apply now. More prep has diminishing returns."
   - **< 70%, or a MUST at 0:** no resources. Give **"What takes you to 100%"**: each missing or partial requirement → the evidence that would satisfy it (a defendable worklog claim, a drill rate, a graded round score) → a rough size (days / weeks). Order it by MUST first, then by smallest effort. He prepares on his own, at work or outside it, and re-runs `/jd <file>`.
7. Write the requirements table, scores, %, gate decision and the plan into the JD file. Add a row to `interview/readiness.md` (JD readiness table). Log the grill in `interview/log.md` (round: jd). Add new gaps to `interview/gaps.md` with the linked JD.
8. End with ONE next action.

**Re-run (`/jd <file>`)**
Read the file, take new evidence from worklog, log and problems since the last run, and re-grill only the requirements that changed or are still below 1.0. Recompute the % and the gate. Never raise a score without new evidence.
