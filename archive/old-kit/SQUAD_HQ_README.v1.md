# Squad HQ kit — RDS-style ticket workflow for Claude Code

Drop these files into your Claude Code workspace root (the folder with CLAUDE.md, PROGRESS.md, curriculum/).

## What is in the kit

| Path | What it is |
|---|---|
| `CLAUDE.md` | Your CLAUDE.md, updated: clean-slate baseline (CX BI analyst; syntax-aware functional Python; SQL basics with CTEs and some window functions), JIT depth rule replacing the teaching ladder and retention cycles, ticket-driven Stage 0, CLEAN START replacing the migration section, and the RDS ticket model wired in. Back up your old one first. |
| `PROGRESS.md` | Fresh progress log: not started, with your baseline. |
| `docs/operating-model/RDS_MODEL.md` | The work system: tracker, statuses, review gates, "production" per stage, fleet and on-call, chaos, teammate PRs, legacy code, personas, levels, metrics, dogfood thread. Imported into CLAUDE.md. |
| `docs/operating-model/TICKET_TEMPLATES.md` | Body templates for every ticket type, plus postmortem, standup, extension request, promotion packet. |
| `docs/operating-model/TICKET_CATALOG.md` | The skeleton backlog from Stage 0 to Stage 6, with mastery-gate tickets and field reports. Symptoms only. |
| `docs/operating-model/COVERAGE_MAP.md` | The completeness contract: every concept across 32 domains with a depth tag (Solid / Working / Aware) and the epic that teaches it. Checked at sprint planning and every stage audit. |
| `docs/operating-model/FLEET.md` | Registry of systems you run in production. Starts empty. |
| `.mentor/incident-plan.md` | Causes of every planted bug and incident. **Do not read.** It is git-ignored. |
| `backlog/config.yml` | Tracker config: 8 statuses, 12 ticket types, P0–P3, all project IDs. |
| `tools/bootstrap_tracker.sh` | Initializes the tracker, creates sprints S01–S02, seeds all 26 Stage 0 tickets from zero (TKT-001 In Progress). Tested with Backlog.md 1.55. |
| `.claude/commands/*.md` | Slash commands: /standup, /next, /submit, /ship, /page, /pr-review, /retro. |
| `.github/pull_request_template.md` | Copy into each project repo. |
| `.gitignore` | For the workspace repo: ignores `projects/`, `.mentor/`, secrets. |

## Setup (clean start)

1. Back up: `cp CLAUDE.md CLAUDE.md.bak`. If you have an old PROGRESS.md, rename it `PROGRESS.pre-reset.md`.
2. Copy the kit contents into the workspace root (this includes a fresh `PROGRESS.md` that says "not started").
3. Open Claude Code in the workspace and type: `Start the clean start: RDS_MODEL.md section 16.`
4. Session 1 is ticket TKT-001: the mentor teaches the terminal and installs (package manager, Git, Node.js, Backlog.md) from zero, one at a time. At the end you run `bash tools/bootstrap_tracker.sh`, which creates the tracker, sprints S01–S02, and all 26 Stage 0 tickets.
5. From then on, the board drives everything.

## Daily loop

`/standup` → `/next` → learn only what this ticket needs → build → PR → `/submit TKT-xxx` → fix → merge → `/ship TKT-xxx` → `/standup` next day.
Incidents arrive on their own (or `/page`). Sprint ends with `/retro`.

Board: `backlog board` in the terminal, or `backlog browser` for the web board at http://127.0.0.1:6420.
