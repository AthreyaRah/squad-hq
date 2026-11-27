---
description: Weekly mini-retro or end-of-sprint retro and next sprint planning.
---
Run the retro (RDS_MODEL.md sections 11 and 15). Weekly mini-retro = steps 1–4 and 7. Sprint retro = all steps.

1. Retrieval first: 5 questions on things I learned 1–3 weeks ago (from REPS.md and Done tickets). No notes. Score them; misses go to REPS.md.
2. Run `uv run --with pyyaml python -I tools/metrics.py` to refresh the auto section of METRICS.md. Ask me for the manual numbers (hours, applications, replies, posts, mock score). Show the week vs last week.
3. Velocity check: compare with the slice target (v1 in about 2–3 weeks). If behind, say so plainly and propose cuts (smaller scope first, then new dates). Never add time silently. Check hours vs the 20 h budget and say if the load looks unsustainable.
4. Ask me for ONE thing to change. One question at a time.
5. Sprint retro only: monthly depth-grid re-grade if a month has passed (evidence links only, DEPTH_GRID.md).
6. Sprint retro only: propose the next sprint (about 40 hours) from TICKET_CATALOG.md and the job loop: slice work ~70%, 1 teammate review, 6 applications, 2 posts, 2 timed sets, at most 1 field report. Check the REQ-NOW rows of COVERAGE_MAP.md for the current slice. Create the milestone and tickets after I commit to a subset.
7. Update PROGRESS.md (CURRENT + one HISTORY line).
