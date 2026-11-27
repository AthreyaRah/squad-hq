---
description: Turn a finished slice version into a README pass, a write-up and a public post draft; update PORTFOLIO.md.
argument-hint: [slice version, e.g. S1 v1]
---
Publish $ARGUMENTS (CLAUDE.md "Definition of done"; template "publish" in TICKET_TEMPLATES.md).

1. Read the slice repo (README, diagram, CI status, numbers), its Done tickets and review comments, and PORTFOLIO.md.
2. Check the definition of done item by item (public repo, one-command run, tests + green CI, README with diagram, numbers, known limitations). List anything missing as a blocker; do not publish around it.
3. README pass: suggest concrete edits. I make them in my repo.
4. Write-up draft (300–600 words): problem → approach → numbers → what broke → what I would do next. Use my words from tickets and reviews so it sounds like me. Save it to the project's `docs/writeup.md` only if I ask; otherwise show it in chat.
5. Post draft (LinkedIn or similar, under 200 words) in my voice. I edit and post it myself.
6. Honesty check: personal project stated as such, no work data or work numbers beyond what I approved.
7. Update PORTFOLIO.md (repo, problem, stack, key numbers, transfer result, next step) and METRICS.md (posts published, once I confirm it is live). Close the PUB ticket.
