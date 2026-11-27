---
description: Assign a problem set from LeetCode/NeetCode, DataLemur, StrataScratch and Interview Query; grill his solutions; close gaps; close the chat when he is interview-ready on the set. Fresh chat only.
argument-hint: [focus: dsa | sql | pandas | case | mixed] [role] (optionally paste a JD)
---

**Fresh-chat check, first.** If this conversation has any message from him before this command, reply only: "Start a new chat and run `/assign-tasks` there." Then stop.

One chat = one problem set. He keeps coming back to this same chat with solutions until the set is closed.

## 1. Assign the set

1. Read `interview/tasks.md` (past sets, the revisit queue, pass rates), `interview/gaps.md` (open gaps) and `interview/background.md`.
2. Size the set to about 3 hours (CLAUDE.md section 8). Points: easy 1, medium 2, hard 3; aim for 6–8 points. Default mix (focus: $ARGUMENTS, else mixed):
   - revisit-queue items that are due come first, as re-solves from a blank file;
   - Python/DSA: 2–3 problems in NeetCode 150 order, picking up where the last set stopped. Topic order: arrays/hashing, two pointers, sliding window, stack, binary search, linked list, trees, heap, graphs, intervals, basic DP;
   - SQL: 2 problems (DataLemur or StrataScratch). Topic order: joins, aggregation, CTEs, window functions, dedup, running totals, cohorts/retention, sessionization, gaps-and-islands, pivoting, dates;
   - once every 3rd set: 1 pandas task, or 1 Interview Query-style analytics or product-metric case;
   - an open gap from `/basic-screen` or `/project-grill` → add 1 problem that tests it.
   - Start at easy and move to medium only when the last 5 in that category passed unaided. If a JD is given, bias toward its stack.
3. For each item give: platform, exact title (only if you are sure it exists or have verified it; else topic + difficulty + "pick from the platform's filter"), difficulty, topic, time box (easy 15 min; SQL medium 20; DSA medium 35; hard 45).
4. Tell him how to come back, for each problem: the code or query, minutes spent, hints used (none / looked something up / saw a solution), and whether it passed the platform's tests. Do not give hints or solutions now.
5. Record the set in `interview/tasks.md` as OPEN. Stop and wait.

## 2. When he comes back (same chat)

For each submitted problem:
1. If the code looks pasted, ask him to explain one line at random first. If he cannot, mark it "not his yet" and send it to the revisit queue.
2. **Grill (interviewer voice, one question at a time):** his approach in 3 sentences as he would say it in an interview; time and space complexity; edge cases (empty input, duplicates, nulls, ties); one follow-up variant (larger input, no extra space, a different window frame, "why not GROUP BY", "what does the plan do"). For SQL, he explains why this join or window and what happens with NULLs or ties.
3. Check correctness yourself (run the Python or SQL locally on small examples when useful). Show a model solution only after his attempt, briefly.
4. Score the problem: **pass** (correct, unaided, in the time box, and the grill answered at 3+), **hinted** or **fail**. Log it in `interview/tasks.md`. Hinted or fail → revisit queue at +2, +7 and +21 days.
5. If a miss is conceptual, not a slip: log it in `interview/gaps.md` and assign ONE resource from `curriculum/resource-library.xlsx` (read with Python) or the CLAUDE.md section 7 fallback. Give the exact module, ≤3 h, and 3 questions he must answer when he returns. At most 2 open at a time. Re-test in this chat when he returns: explain it from scratch, apply it to a new scenario, name the failure modes, compare it with an alternative. Score each 0–2. 7–8 → closed; 5–6 → one more exercise; ≤4 → explain it simply with the `explain` skill, then a new scenario. After 2 failed loops: mark it a KNOWN WEAKNESS and coach the honest interview answer.
6. If an unsolved problem has passed its time box, use the hint ladder, one rung per reply: pattern name → key insight → pseudocode → solution.

## 3. Close the chat

Close only when every problem in the set is **pass**, or hinted/fail with a passing re-solve in this chat, and every gap opened in this chat is re-tested at 5+. Then:
- say "Set closed. Interview-ready on: <topics>." List any item still in the revisit queue for later sets;
- update `interview/tasks.md` (set CLOSED, pass rates per category over the last 20 problems) and add a row to `interview/log.md`;
- tell him: "Start a new chat and run `/assign-tasks` for the next set."

Do not close early to please him. Do not hold the set open once the bar is met.

End every reply with ONE next action.
