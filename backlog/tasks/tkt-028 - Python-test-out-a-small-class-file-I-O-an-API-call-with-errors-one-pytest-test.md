---
id: TKT-028
title: >-
  Python test-out: a small class, file I/O, an API call with errors, one pytest
  test
status: Done
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
updated_date: '2026-11-26T17:30:00Z'
labels:
  - diagnostic
  - python
  - testing
  - cat:DIAG-02
milestone: m-2
dependencies: []
priority: p1
type: spike
project: DIAG
ordinal: 5000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** mentor · **Time box:** 2 h · **Rules:** no notes, no AI, attempt first. Mentor gives probes one at a time via `/diag`; answer keys stay in `.mentor/`.

### Why this ticket exists
Test out, do not re-learn. The result sets my known list and baseline level, so every later ticket sits just above what I can already do.

### Probes (a scratch folder with uv; mentor gives each task)
1. A `@dataclass` for a time entry, plus a method that returns billable hours.
2. Read a CSV with `csv`/`pathlib`, write JSON lines; handle a missing file with a clear error.
3. Call a public API with `httpx` (timeout, status check); retry once on a 5xx; never swallow errors.
4. Write one pytest test for probe 1 and one for an error path (`pytest.raises`).
5. Explain: list vs tuple mutability bug (mentor shows 6 lines, I predict the output).

### Result
KNOWN / SHAKY / GAP in a comment. The pre-reset Concept Log archive (httpx, pytest fakes) hints where to probe deeper.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 All 5 probes attempted in the time box, code in the scratch folder
- [x] #2 `uv run pytest` shows my 2 tests running (pass or fail is evidence either way)
- [x] #3 DEPTH_GRID.md Python row and known list updated with evidence
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [x] #1 PR merged after mentor APPROVED
- [x] #2 CI green (once the repo has CI)
- [x] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [x] #4 Explain-back and understanding check passed
- [x] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->

## Comments

<!-- COMMENTS:BEGIN -->
author: @mentor
created: 2026-11-25T17:03:00Z

---

Ready: full body, time box set, no prerequisites (diagnostic). Attempt first via /diag.

---

created: 2026-11-26T08:50:00Z

---

In Progress: /diag started 2026-11-26. Probes one at a time; 2 h box. Code in projects/diag-scratch/python/.

---

created: 2026-11-26T08:58:00Z

---

P1 (dataclass) GAP: never used classes. Mentor set the probe above the stated baseline. Re-ladder remaining probes from a familiarity check; floor = functions + dicts/lists.

---

created: 2026-11-26T09:00:00Z

---

Familiarity: functions C, lists/dicts C, errors L, files L, web API L, pytest N. pytest = GAP (no probe). Next: P1b functions + dicts, 15 min.

---

created: 2026-11-26T09:01:00Z

---

Familiarity check: functions C, lists/dicts C, errors L, files L, API call L, pytest N, classes N, logging N, type hints N. N items = GAP, no probe. Next probes: P2 functions+dicts, P3 files+errors, P4 API call, P5 list vs tuple.

---

created: 2026-11-26T12:01:00Z

---

P2 functions+dicts PARTIAL: totals and ranking right; consultant with 0 billable hours (dee) missing, AC said every consultant must appear. R009.

---

created: 2026-11-26T12:44:00Z

---

Correction from Rahul: file handling is N, not L. File I/O + json = GAP, no probe. P3 now: errors only (parse + raise + try/except), in memory.

---

created: 2026-11-26T17:21:00Z

---

P3 errors PARTIAL (12 min): clean() 7/2 correct, narrow except ValueError, explicit billable map. parse_hours returns ValueError instead of raising, and is unused; clean() edits input dicts in place. R010, R011.

---

created: 2026-11-26T17:26:00Z

---

Correction from Rahul: web API calls are N (timeouts, requests/httpx unknown). GAP, no probe. Mock kept for the S1 API-ingestion ticket. Calibration: L = written it alone at least once.

---

created: 2026-11-26T17:30:00Z

---

Results (2026-11-26). Code in projects/diag-scratch/python/ (p2.py, p3.py).
P1 dataclass GAP: classes never used (probe set above baseline: mentor error).
P2 functions+dicts PARTIAL: totals + ranking (sorted key=lambda, comprehension, __main__ guard) correct; zero-billable consultant dropped (R009).
P3 errors PARTIAL (12/15 min): narrow except ValueError, 7/2 correct, explicit bool map; return ValueError instead of raise, helper unused (R010); edits input dicts in place (R011).
P4 API call GAP (self-reported N): requests/httpx, timeouts, status codes.
P5 list vs tuple PASS: exact output; tuple holds a reference to the mutable list.
KNOWN: functions, loops over lists of dicts, dict accumulation, sorted with key lambda, list comprehension, __main__ guard, try/except ValueError, aliasing/reference semantics.
SHAKY: keep every key in a group-by (R009), raise vs return (R010), no in-place edits (R011).
GAP: classes/dataclass, file I/O + json, pytest, logging, type hints, HTTP calls -> bridge tickets TKT-055..059 (wired before TKT-033, TKT-034, TKT-040).
Baseline Python = L1.
AC1 ticked: 3 probes attempted, 2 recorded as self-reported GAP. AC2 n/a: pytest is a GAP (TKT-056). DoD 1-3 n/a: diagnostic, no PR/CI/release. DoD 4 n/a: probes are the check. Attempt reports mostly skipped: required from TKT-055 on.

---

created: 2026-11-26T17:30:00Z

---

Done (mentor): 5 probes graded, REPS R009-R011 added, DEPTH_GRID Python row + known list updated, gaps covered by TKT-055..059.

---
<!-- COMMENTS:END -->
