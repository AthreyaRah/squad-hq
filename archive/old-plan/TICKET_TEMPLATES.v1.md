# TICKET TEMPLATES

Every ticket body uses the template for its type. Acceptance criteria go in `--ac` (one per line item) so they become checkboxes. The Definition of Done comes from `backlog/config.yml` defaults, plus extra `--dod` items when a ticket needs them.

Sections marked (L1) are always filled by the mentor at L1. From L2 onward, the "Spec owner" line says who fills what (RDS_MODEL.md section 4).

Hints never go in the ticket. Give them only on `STUCK`, in steps (CLAUDE.md).

---

## feature

```markdown
**Spec owner:** mentor (L1) | mentor + me adds 2 edge cases (L2) | me, mentor reviews (L3+)
**Project / epic:** P0 · Load layer
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

### Estimate
<Mentor estimate in sessions. I add my ETA when I pick it up.>

### Deliverables
Branch `tkt-xxx-<slug>` · Commit `<type>(<scope>): <summary> (TKT-xxx)` · PR with template · tests listed below

### Tests
<The tests that prove it: happy path, error path, edge cases.>
```

AC style: each AC is a command I can run plus the expected result. Example: "`uv run pytest tests/test_load.py -k rerun` passes: running the load twice for 2026-10-20 leaves exactly 24 rows."

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
CONFIDENCE (1-5):
```

## Extension request (comment on the ticket)

```
EXTENSION: TKT-xxx
OLD ETA → NEW ETA:
WHAT I UNDERESTIMATED:
WHAT I WILL DO DIFFERENTLY WHEN I ESTIMATE NEXT TIME:
```

## Promotion packet — `docs/promotions/<track>-L<n>.md`

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
