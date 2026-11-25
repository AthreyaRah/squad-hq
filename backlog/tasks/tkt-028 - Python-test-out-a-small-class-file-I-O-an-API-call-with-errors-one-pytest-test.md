---
id: TKT-028
title: >-
  Python test-out: a small class, file I/O, an API call with errors, one pytest
  test
status: Ready
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
updated_date: '2026-11-25T17:03:00Z'
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
- [ ] #1 All 5 probes attempted in the time box, code in the scratch folder
- [ ] #2 `uv run pytest` shows my 2 tests running (pass or fail is evidence either way)
- [ ] #3 DEPTH_GRID.md Python row and known list updated with evidence
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 PR merged after mentor APPROVED
- [ ] #2 CI green (once the repo has CI)
- [ ] #3 Released and verified per slice (RDS_MODEL.md section 6)
- [ ] #4 Explain-back and understanding check passed
- [ ] #5 Findings added to REPS.md; PROGRESS.md updated
<!-- DOD:END -->

## Comments

<!-- COMMENTS:BEGIN -->
author: @mentor
created: 2026-11-25T17:03:00Z

---

Ready: full body, time box set, no prerequisites (diagnostic). Attempt first via /diag.

---
<!-- COMMENTS:END -->
