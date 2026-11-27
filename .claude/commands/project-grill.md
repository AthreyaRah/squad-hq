---
description: Grill a project from his brief only, on design and architecture decisions and on the use and syntax of the tools he used. No code or data. Fresh chat only.
argument-hint: [project name] [role] (then the brief; optionally a JD)
---

**Fresh-chat check, first.** If this conversation has any message from him before this command, reply only: "Start a new chat and run `/project-grill` there." Then stop.

Project: $ARGUMENTS.

1. Read `interview/background.md` (this project's earlier entry and claim limits), and this project's past rows in `interview/log.md`.
2. **Ask for the brief**, in one message. Ask only for what is missing:
   - what the project does, and the business question, in 1–2 lines;
   - who uses it;
   - what is done and what is still in progress;
   - his part versus the team versus AI;
   - tools and stack (languages, platforms, libraries, BI tools);
   - scale as ranges only (rows, tables, refresh rate, users);
   - optionally, a target role or JD.
   No code, no data, no client names, no internal numbers. If he pastes any, tell him to remove it, and do not log it. Then wait.
3. Restate the brief as the 1–3 lines he would say in an interview, and ask "Is this what you would claim?". The confirmed lines are the scope.
4. **Grill (30–45 min, interviewer persona, CLAUDE.md section 4 rule 4).** Ask only two kinds of question, and only inside the confirmed scope:
   - **Design and architecture:** why this design, what he rejected, and the trade-offs. Layers and grain, keys, the data model, SCD handling, incremental vs full loads, idempotency, schema change, failure and recovery, data quality, cost, what breaks at 10x, why this tool over the alternative.
   - **Use and syntax of tools he named:** he writes from memory, in chat, a small piece of what he says he used. Examples: the SQL for a dedup or a window, a MERGE or upsert, a Tableau LOD or table calculation, the PySpark for a join or dedup, a Python function that parses a file, the config for a Genie space or a scheduled job. Grade correctness and whether he can say why.
   - No questions on topics he did not claim. Parts still in progress are not graded; ask at most one "what is next, and how would you do it?".
   - Add one adversarial challenge ("I think that design is wrong because...").
   - If he cannot explain a decision or syntax he claims (AI or a teammate did it), that is the finding.
5. **Scorecard (coach voice):** Project depth, Data modeling and/or Pipeline design, each tool dimension touched (SQL / Python / Cloud-platform / Analytics / ML-AI), Communication, Honesty/calibration. Each 0–4 with one piece of evidence. Then:
   - the **defensible claim**: the honest 1–3 lines he can say about this project today (reword anything that did not hold up, for example "designed the model; the PySpark was AI-generated and I reviewed it");
   - top 3 fixes, each with a better answer shape.
6. Update this project in `interview/background.md` (defensible claim, last grilled date) and add a row to `interview/log.md`. Log conceptual gaps in `interview/gaps.md` as OPEN; `/assign-tasks` adds problems and resources for them.
7. End with ONE next action.
