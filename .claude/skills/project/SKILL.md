---
name: project
description: Give Rahul 3 small public-data project options matched to a target role and an open gap, then a one-page spec with acceptance criteria and the 8 defense questions after he picks. Never build it for him.
---

# /project

Goal: a 1-5 day project on a public dataset that gives him something real to defend in an interview.

## Step 1: three options

1. Read `interview/roles.md` (role priority, markets), `interview/gaps.md` (open gaps), `interview/projects.md` (what exists; no repeats).
2. Offer 3 short options. Each one, at most 4 lines:
   - title, target role, gap it exercises;
   - dataset: a public source you can name with confidence (e.g. NYC TLC trips, a Kaggle dataset by its exact name, a public API). Never invent a dataset or URL; if unsure, say "unverified, check it exists first";
   - what it ends in (a dbt model + tests, a pipeline + DQ checks, a SQL metric layer + dashboard, a small model + eval, a FastAPI endpoint);
   - days (1-5).
3. Prefer projects that look like his work without using work data: renewals/GRR-NRR, PS time entries with evolving custom fields, CX tickets. Synthetic data is fine if he generates it himself.
4. Ask him to pick one. Stop.

## Step 2: one-page spec (after he picks)

- Business question (one sentence) and who would use the answer.
- Scope: in / out (keep it to 1-5 days).
- Inputs, outputs, grain, keys.
- Acceptance criteria: 4-6 checkable items (e.g. "one command rebuilds from raw", "a test fails if a duplicate key appears", "metric X reconciles to a hand-computed number on a 20-row sample").
- Done = public repo, README with one diagram, one command to run, known limitations.
- The 8 questions he will be grilled on in `/defend`, covering the layers in CLAUDE.md section 4.1 plus one adversarial challenge.

## Rules

- Never write his code, schema or README. Answer questions about the spec only. If he is stuck, hint (concept → direction → pseudocode), never the solution.
- Log it in `interview/projects.md`: id, date, title, role, gap, dataset, status (SPEC / BUILDING / SHIPPED / DEFENDED), repo link, the 8 questions.
- Code lives in `projects/<name>/` (its own repo). He commits; you do not.
- End with ONE next action.
