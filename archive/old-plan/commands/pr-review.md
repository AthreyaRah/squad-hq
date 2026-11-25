---
description: Create a teammate PR review ticket (patch + PR description + hidden answer key).
---
Create a teammate review ticket (RDS_MODEL.md section 8c).

1. Pick the active project repo and a persona (Arjun before Stage 2; Arjun or Mei after).
2. Write a realistic change for that repo as a patch at reviews/<TKT-ID>/change.patch, plus reviews/<TKT-ID>/PR.md. Make sure `git apply --check` succeeds against current main.
3. Plant 3–7 issues across severities, using only concepts I have at Functional or better in the Concept Log, plus good code that deserves approval. Write the answer key to .mentor/review-keys/<TKT-ID>.md.
4. Create the ticket with the review template (type review) and brief it in two lines.
5. When I submit reviews/<TKT-ID>/my-review.md, grade it: caught/planted, false alarms, severity accuracy, tone. Then show the answer key and teach the misses with the explain skill.
