# Squad HQ

My learning workspace, run like a real data team. Claude Code is the tech lead. I own the tickets.
Goal: hireable mid-level DE/AE in the UAE within about 2 months, with public proof of work. Long term: a full-stack data and AI engineer (the "data intelligence engineer" role).

## What each file is

| Path | What it is | When it is read |
|---|---|---|
| `CLAUDE.md` | Who I am, the bar, the 6 slices, how the mentor teaches, the rules | Every session (auto) |
| `docs/operating-model/RDS_MODEL.md` | The work system: tracker, statuses, production per slice, personas, metrics, commands, content stack | Every session (imported) |
| `docs/operating-model/TICKET_CATALOG.md` | Slice backlog: DIAG, S1–S6 (v1 tickets, v2/v3 ideas, transfer), JOB/PUB, Deep track | Sprint planning, /next |
| `docs/operating-model/COVERAGE_MAP.md` | Concepts with depth tags and REQ-NOW / JIT / LATER / DEEP tags | Sprint planning, monthly re-grade |
| `docs/operating-model/TICKET_TEMPLATES.md` | Ticket bodies, the definition of done, transfer / job-search / publish / diagnostic templates | When a ticket is written |
| `docs/operating-model/FLEET.md` | Systems I run on a schedule (S1 pipeline first) | /ship, /page |
| `PROGRESS.md` | CURRENT status (8 lines) + HISTORY | Start and end of every session |
| `DEPTH_GRID.md` | My level per layer (L1–L4), spike layers, known list, evidence | /diag, monthly re-grade |
| `REPS.md` | Spaced-repetition queue fed by reviews and mistakes | /reps, /standup |
| `METRICS.md` | Weekly numbers: tickets, build ratio, streak, findings, job loop | Weekly retro |
| `PORTFOLIO.md` | Per slice: repo, problem, stack, numbers, transfer result; STAR stories | /publish, /apply |
| `backlog/` | The tracker (Backlog.md). `backlog/archive/` holds old tickets | Always |
| `curriculum/` | `roadmap.html` and `resource-library.xlsx`: a reference library, never a syllabus | Only when a ticket stalls |
| `projects/<name>/` | One public repo per slice (git-ignored here) | Build time |
| `tools/` | `metrics.py`, mocks, chaos scripts | As needed |
| `.claude/commands/` | Slash commands | — |
| `archive/` | The old Stage 0–6 plan and the old kit. **Never re-run `archive/old-kit/*.sh`** | Never |

## Daily loop (about 2.5 h; Tuesday is a light day)

```
/standup → /reps (due drills, 5–10 min each)
        → /next → I attempt first (time box) → mentor teaches only the gap
        → PR → /submit TKT-x → fix → merge → /ship TKT-x
        → LOG
```
Tuesday: one /reps drill only. It counts as a kept day.

## Weekly loop

- Mon, Wed, Thu: build (~2.5 h each).
- Fri, Sat: longer build blocks + the job loop (~5 h each).
- Sun: review day — /retro (5 retrieval questions, METRICS.md, one change), /publish, blank-file rebuilds.
- One public post or repo update every week.
- Every 2 weeks: sprint retro and planning. Every month: depth-grid re-grade and a mock interview with Khalid (hiring manager persona).

## Job loop (from week 3)

`/apply` each week: 3 applications (I send them), 1 resume or LinkedIn tweak, 1 timed SQL/Python set.
`/publish` each week: README pass, write-up, post draft in my voice (I post it).
Week 1: DIAG-04 picks the primary cloud and tools from 10–15 real UAE postings.

## Rules that matter most

- Attempt first. AI is a reviewer and tutor, not the author. Never keep code I cannot explain.
- Ship a v1 even when I do not feel ready. Compare only with my previous version.
- Real work data never enters this workspace. Counts and outcomes only.
- The mentor never commits, pushes, applies or posts for me.

Board: `backlog board` (terminal) or `backlog browser` → http://127.0.0.1:6420.
