---
description: Assign one resource for an open gap (max 2 open assignments, max 3 h each).
argument-hint: [gap-id]
---

1. Read `interview/gaps.md`. If 2 assignments are already open, do not assign a third: say which one to finish first and stop.
2. Pick the gap ($ARGUMENTS, or the highest-severity open one: BLOCKER > IMPORTANT > MINOR, then most roles affected).
3. Find the resource in `curriculum/resource-library.xlsx` with Python (`uv run --with openpyxl python -I ...`): the Resources tab (columns Resource / section, URL, Slice, Priority) and the Syllabi (reference) tab for exact modules. If it cannot be read, use the fallback list in CLAUDE.md section 9. Never invent a course, module or URL; if a section is not in the library, say "find the section on <topic> in <resource>, max N min" and mark it unverified.
4. Give: resource name, exact module or chapter, time box (at most 3 h, usually 30-90 min at 1.5-2x), and the 3 questions he must answer when he comes back. Prefer a different format from the last failed loop on this gap (video vs reading vs doing problems).
5. Update the gap row: status ASSIGNED, resource, date, loop number.
6. End with ONE next action: "Do it, then run /recheck <gap-id>."
