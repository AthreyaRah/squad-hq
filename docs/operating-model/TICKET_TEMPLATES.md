# TICKET TEMPLATES

Every ticket body uses the template for its type. Acceptance criteria go in `--ac` (one per line item) so they become checkboxes. The Definition of Done comes from `backlog/config.yml` defaults, plus extra `--dod` items when a ticket needs them.

The "Spec owner" line follows my depth-grid level in the ticket's layer (RDS_MODEL.md section 4). Every ticket has a **time box**. At the box, I ship what exists.

## Definition of done (every artefact; slice versions must meet all of it)

1. Public repo (no work data, no secrets).
2. One-command reproducible run from a clean clone.
3. Tests and green CI.
4. README with one architecture diagram.
5. Benchmark or eval numbers where relevant.
6. Known limitations.
7. A short write-up I can publish (`/publish`).
ADRs and runbooks only when the project is big enough (a scheduled job or a server).
Per ticket, the tracker DoD (`backlog/config.yml`) adds: mentor APPROVED, verified per RDS section 6, explain-back passed, findings added to REPS.md.

Hints never go in the ticket. Give them only on `STUCK`, in steps (CLAUDE.md).

---

## feature

```markdown
**Spec owner:** mentor (layer at L1) | mentor + me adds 2 edge cases (L2) | me, mentor reviews (L3+)
**Slice / version:** S1 v1 · silver layer  ·  **Time box:** <hours>  ·  **Work transfer:** <which pod pattern this mirrors>
**Requested by:** [Persona: Fatima, Head of Ops Analytics] "<one quote with the business need>"

### Why this ticket exists
<Its place in the decomposition, e.g. ingest → validate → **load** → verify. One or two sentences.>

### System context
<Where it sits. What it reads from and writes to. A 3–6 box Mermaid or ASCII diagram if it helps.>

### Objective
<One sentence.>

### This ticket uses
<Concept: practiced | NEW (we learn it first, triage: core/supporting/peripheral)>. At most ONE new thing (CLAUDE.md jump rule).

### Design decision (Level 1/2/3)
<The decision this ticket forces. Options with trade-offs. Who decides.>

### Input
<Exact file / function signature / endpoint / table, with a sample.>

### Expected output
<Exact sample values, row counts, return values, or file contents.>

### Constraints
<Allowed libraries; not allowed; performance bound if any.>

### Out of scope
<What NOT to build now, so scope stays small.>

### Time box
<Mentor time box in hours. I add my ETA when I pick it up. At the box I ship what exists.>

### Deliverables
Branch `tkt-xxx-<slug>` · Commit `<type>(<scope>): <summary> (TKT-xxx)` · PR with template · tests listed below

### Tests
<The tests that prove it: happy path, error path, edge cases.>
```

AC style: each AC is a command I can run plus the expected result. Example: "`uv run pytest tests/test_bronze.py -k rerun` passes: loading 2026-10-01 twice leaves the same row count as loading it once."

---

## bug

```markdown
**Reported by:** [Persona: Omar, Finance Controller] via <channel>
**Severity:** S1 data wrong for users | S2 wrong in edge cases | S3 cosmetic
**Labels:** planted-bug / escaped-defect (if it applies)

### Report (as received)
<The stakeholder's words. Symptoms only. Screenshot-style numbers: "Report says 1,212 rides on 3 Nov; source system says 1,187.">

### Environment
<Which system, version/tag, data date.>

### What I must deliver
1. A failing test that reproduces the bug (before any fix).
2. The root cause in 2–3 sentences in the PR.
3. The fix.
4. A check that would have caught this earlier (test, data test, alert, or type).
5. A reply to the reporter in plain language (no jargon).
```

AC always include: "the reproducing test fails on `main` and passes on the branch".

---

## incident

```markdown
**Severity:** SEV1 (system down / data wrong for everyone) | SEV2 (degraded / partial) | SEV3 (minor)
**Detected by:** [Persona: Daniel, SRE] alert / [Persona: Fatima] message
**Started (approx):** <timestamp>

### Alert / report
<Exact alert text or message. Symptoms only.>

### My response, in order
1. ACK within the session: post "Investigating" with what I know.
2. Assess: blast radius (who and what is affected), severity confirm or change.
3. Mitigate first (stop the bleeding), then fix the root cause.
4. Communicate: one status update per step, written for the persona.
5. Verify recovery with evidence.
6. Postmortem ticket (type docs) within 1 session, using the postmortem template.
```

AC: system healthy per FLEET.md definition; data repaired (backfill or delete-and-reload if needed) with counts proved; postmortem filed; one prevention ticket created.

---

## review (teammate PR)

```markdown
**Author:** [Persona: Arjun | Mei]
**Patch:** `reviews/TKT-xxx/change.patch` · **PR description:** `reviews/TKT-xxx/PR.md`
**Repo / base:** projects/<repo> @ main

### What to do
1. `git switch -c review/TKT-xxx` then `git apply reviews/TKT-xxx/change.patch`.
2. Run it and its tests. Try to break it.
3. Write `reviews/TKT-xxx/my-review.md`: one entry per issue: file:line, severity (critical/high/medium/low/nit), the problem, why it matters, a suggested direction (not full code).
4. Verdict: APPROVE / REQUEST CHANGES / COMMENT, with one summary paragraph to the author.
5. Delete the review branch when done (`git switch main && git branch -D review/TKT-xxx`).
```

AC: review submitted; grading done by mentor (caught / planted, false alarms, severity accuracy, tone).

---

## spike (time-boxed research)

```markdown
**Question:** <One question that blocks a decision.>
**Time box:** <e.g. 60 minutes. Stop when it ends.>

### Deliverable
A note at `projects/<repo>/docs/spikes/TKT-xxx.md`:
- What I tried (commands, small scripts), and real outputs
- The answer, with evidence
- The decision this enables, and the follow-up tickets
```

AC: the question is answered with evidence from a real run, not from memory.

---

## design (RFC / ADR)

```markdown
**Problem:** <The business and technical problem.>
**Constraints:** volume, latency, freshness, availability, cost, team skills
**Spec owner:** mentor gives options (L2) | I propose (L3+)

### Deliverable
`docs/adr/NNNN-<title>.md` (ADR: context, options, decision, consequences) or `docs/rfc/NNNN-<title>.md` for bigger designs (RFC adds: goals, non-goals, architecture diagrams, rollout plan, failure modes, what changes at 10x, open questions).
```

AC: mentor review "accepted"; diagrams in `docs/architecture.md` updated.

---

## perf

```markdown
**Symptom / goal:** <e.g. "p95 of GET /listings is 900 ms; target 200 ms at 50 rps".>

### Method (roadmap "Performance Engineering Fundamentals")
1. Primary metric and baseline (with hardware, data size, command).
2. Profile. Classify: CPU / memory / I/O / network / lock / launch bound, with evidence.
3. One hypothesis. Change ONE thing.
4. Benchmark: warm-up, repeats, variance.
5. Explain the result and the trade-off it creates.
```

AC: before/after numbers with the exact commands; profiler evidence attached; no regression in tests.

---

## tech-debt / chore / security / docs / drill

```markdown
**Why now:** <What breaks or slows down if we do not do this.>
**Scope:** <exact files or areas>
**Done when:** <check I can run>
```

`drill` = 1–3 short reps on one concept, created only by the quality flag or a confidence of 1–2 (CLAUDE.md JIT depth rule); `security` adds: threat (who, how), the control, and a test that proves the control works.

---

## Postmortem (blameless) — `projects/<repo>/docs/postmortems/YYYY-MM-DD-<slug>.md`

```markdown
# <Title>
Severity · Duration · Detected by · Author

## Summary (3 sentences)
## Impact (who, what, how much, how long)
## Timeline (UTC, key events)
## Root cause (the mechanism, not a person)
## Why we did not catch it earlier
## What went well / what went badly
## Action items (each becomes a ticket ID)
## STAR story (Situation, Task, Action, Result)
```

---

## Standup

```
YESTERDAY:
TODAY:
BLOCKERS:
ETA:
JOB LOOP THIS WEEK: applications n/3 · post n/1
REPS DUE:
CONFIDENCE (1-5):
```

## Extension request (comment on the ticket)

```
EXTENSION: TKT-xxx
OLD ETA → NEW ETA:
WHAT I UNDERESTIMATED:
WHAT I WILL DO DIFFERENTLY WHEN I ESTIMATE NEXT TIME:
```

## Promotion packet — ARCHIVED (replaced by the depth grid, RDS_MODEL.md section 10). Kept for reference only.

```
TRACK / TARGET LEVEL:
TICKETS (links, type, my role):
SHIPPED SYSTEMS IN FLEET (and weeks running):
INCIDENTS LED (postmortem links):
DESIGNS (ADR/RFC links, which I owned):
REVIEW-TICKET STATS (catch rate, false alarms):
METRICS (cycle time, estimate error, escaped defects):
WHAT I CAN NOW EXPLAIN WITH NO NOTES:
GAPS I KNOW ABOUT:
```

---

## transfer (project S1–S6, label `transfer`) — after each slice v1

```markdown
**Pattern:** <what I built on the public twin, e.g. dynamic pivot + medallion>
**Work target:** <pod and use case, described without data values>
**Data rule:** real data never enters the workspace. I report counts, metrics and errors only.

### Checklist (done at work, in my own time or inside a real pod task)
- [ ] Map the twin's schema to the work schema (column names only, shared if approved)
- [ ] Adapt the code; note what differs (types, volume, access)
- [ ] Run on real data; record row counts in/out and DQ check results
- [ ] One stakeholder outcome (who used it, what decision or time saved)

### Report back (counts and outcomes only)
ROWS IN / OUT: · CHECKS PASSED: · RUNTIME: · WHAT BROKE: · OUTCOME:
```
AC: the report is filled; PORTFOLIO.md transfer column updated. No values, names or rows.

## job-search (project JOB, label `job-search`) — `/apply`, weekly

```markdown
**Week:** n  ·  **Time box:** 3 h
- [ ] 3 applications (role, company, link, which slice I lead with, date)
- [ ] 1 resume or LinkedIn tweak (what changed and why)
- [ ] 1 timed set: <n> SQL + <n> Python from <platform>, <minutes> min, no AI
```
AC: METRICS.md job-loop rows updated; failed timed questions go to REPS.md.

## publish (project PUB, label `publish`) — `/publish`, weekly

```markdown
**Source:** <slice version or ticket>  ·  **Channel:** LinkedIn / GitHub / blog
- [ ] README pass (diagram, one-command run, numbers, limitations)
- [ ] Write-up (300–600 words): problem → approach → numbers → what I would do next
- [ ] Post draft in my voice (I edit and post it myself)
```
AC: link added to PORTFOLIO.md. Honesty check: personal project stated as such; no work data.

## diagnostic (project DIAG, label `diagnostic`) — `/diag`

```markdown
**Area:** SQL / Python / Git+PR  ·  **Time box:** 60–90 min, no notes, no AI
### Probes (each is a small task with a known answer)
1. <task> — pass / partial / fail — note
2. ...
### Result
KNOWN: <items passed cleanly> · SHAKY: <partial → REPS.md> · GAP: <fail → first S1 ticket or REPS.md>
```
AC: DEPTH_GRID.md known list and baseline level updated with this ticket as evidence.
