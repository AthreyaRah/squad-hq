#!/usr/bin/env bash
# Bootstrap the Squad HQ tracker (Backlog.md) and seed Stage 0 (P0) tickets.
# Run from the workspace root:  bash tools/bootstrap_tracker.sh
# Safe to read before running. It only touches ./backlog and creates a git repo here if none exists.
set -euo pipefail

need() { command -v "$1" >/dev/null 2>&1 || { echo "Missing: $1. $2"; exit 1; }; }
need git "Install git first."
need backlog "Install Backlog.md first: npm i -g backlog.md   (needs Node.js 18+)"

# 1. The workspace root must be a git repo (Backlog.md stores tickets as files in git).
if [ ! -d .git ]; then
  git init -q
  echo "Initialized git repo in $(pwd)"
fi

# 2. Init Backlog.md, then apply the Squad HQ config (custom statuses, types, priorities, projects).
if [ ! -d backlog/tasks ]; then
  [ -f backlog/config.yml ] && mv backlog/config.yml /tmp/squadhq-config.yml
  backlog init "Squad HQ" --defaults --agent-instructions none --integration-mode cli \
    --task-prefix tkt --zero-padded-ids 3 >/dev/null
  if [ -f /tmp/squadhq-config.yml ]; then mv /tmp/squadhq-config.yml backlog/config.yml; fi
fi
echo "Tracker config:"; backlog config list | sed -n '1,8p'

# 3. Sprint S01 (2 weeks). Milestones are sprints.
backlog milestone add "S01 2026-10-26" -d "Sprint 1: workstation, Git, GitHub, uv, first API fetch, validation and tests" --due-date 2026-11-08 >/dev/null 2>&1 || true
backlog milestone add "S02 2026-11-09" -d "Sprint 2: Docker, PostgreSQL load, CLI, config, logging, retries, CI, ship v0.1.0" --due-date 2026-11-22 >/dev/null 2>&1 || true

# Helper: create a ticket and print its ID.
mk() {
  local out id
  out=$(backlog task create "$@" --plain 2>&1) || { echo "FAILED: backlog task create $1" >&2; echo "$out" >&2; exit 1; }
  id=$(printf '%s\n' "$out" | sed -n 's/^Task \([A-Za-z]*-[0-9.]*\) - .*/\1/p' | head -1)
  [ -n "$id" ] || { echo "Could not read the new ticket ID:" >&2; echo "$out" >&2; exit 1; }
  echo "$id"
}

S1="S01 2026-10-26"; S2="S02 2026-11-09"

# Short body for tickets the mentor completes at Ready (TICKET_TEMPLATES.md).
later() { printf '%s' $'**Spec owner:** mentor (L1). Mentor writes the full template when this moves to Ready.\n\n'"$1"; }

# ---------------- Epic P0-A: workstation and tools ----------------
T01=$(mk "Workstation setup: terminal, package manager, Git, Node.js, Backlog.md" --type chore --priority P0 --project P0 -m "$S1" -s "In Progress" \
  -l stage-0,cat:P0-01 \
  --desc $'**Spec owner:** mentor (L1)\n\n### Why this ticket exists\nEvery later ticket runs in the terminal with these tools. (The bootstrap script runs `git init` for the tracker; TKT-002 teaches what Git does with it.) A tool that only works in one window is not installed.\n\n### This ticket uses\nThe terminal (NEW, core). Installs are commands the mentor teaches in full.\n\n### Production for a chore\nEvery tool works from a NEW terminal window.' \
  --plan $'Taught from zero in session 1, one tool at a time: terminal → package manager → Git → Node.js → Backlog.md → run tools/bootstrap_tracker.sh.' \
  --ac '`git --version`, `node --version`, and `backlog --version` print versions in a new terminal window' \
  --ac 'I can explain what PATH is and why a new window matters, in 2–3 sentences' \
  --ac '`backlog board` shows this ticket In Progress')

T02=$(mk "Commit the tracker to the Squad HQ git repo" --type chore --priority P1 --project P0 -m "$S1" -s Ready \
  -l stage-0,git,cat:P0-02 --dep "$T01" \
  --desc $'**Spec owner:** mentor (L1)\n\n### Why this ticket exists\nGit is the save history of every engineering team. The tracker is the first thing we save.\n\n### This ticket uses\nThe terminal (TKT-001), Git basics (NEW, core): status, add, commit, log, .gitignore.\n\n### Deliverables\nCommit: `chore(tracker): bootstrap Squad HQ (TKT-xxx)`' \
  --ac '`git log --oneline` shows the tracker commit' \
  --ac '`git status` is clean; `projects/` and `.mentor/` do not appear (ignored)' \
  --ac 'I explain the difference between the working folder, the staging area, and a commit')

T03=$(mk "GitHub account, gh auth login, push Squad HQ to a private repo" --type chore --priority P1 --project P0 -m "$S1" -s Ready \
  -l stage-0,git,cat:P0-03 --dep "$T02" \
  --desc $'**Spec owner:** mentor (L1)\n\n### This ticket uses\nGit basics (TKT-002), remotes and push (NEW, core).' \
  --ac 'The private repo shows the tracker commit on GitHub' \
  --ac '`git status` says the branch is up to date with origin/main' \
  --ac 'I explain what `origin` is and what `git push` sends')

T04=$(mk "Create the weather-etl project with uv and push it as its own repo" --type chore --priority P1 --project P0 -m "$S1" -s Backlog \
  -l stage-0,python,cat:P0-04 --dep "$T03" \
  --desc "$(later 'NEW: uv and virtual environments. Done when a fresh clone runs `uv run python hello.py`.')")

# ---------------- Epic P0-B: first data from a real API ----------------
T05=$(mk "First pull request: README on a branch, PR with template, squash-merge" --type chore --priority P1 --project P0 -m "$S1" -s Backlog -l stage-0,git,cat:P0-05 --dep "$T04" \
  --desc "$(later 'NEW: branches and pull requests. Copy .github/pull_request_template.md into the repo in this PR.')")
T06=$(mk "Fetch tomorrow's hourly forecast for Dubai and print 24 temperatures" --type feature --priority P1 --project P0 -m "$S1" -s Backlog -l stage-0,http,python,cat:P0-06 --dep "$T05" \
  --desc "$(later 'NEW: HTTP (request, response, status code, query string, JSON) with httpx.')")
T07=$(mk "Save the raw response to data/raw/<city>/<date>.json and load it back" --type feature --priority P1 --project P0 -m "$S1" -s Backlog -l stage-0,python,cat:P0-07 --dep "$T06" \
  --desc "$(later 'NEW: files, paths (pathlib), and the json module.')")
T08=$(mk "Move the code into a src/weather_etl package and run it as a module" --type chore --priority P1 --project P0 -m "$S1" -s Backlog -l stage-0,python,cat:P0-08 --dep "$T07" \
  --desc "$(later 'NEW: modules, packages, imports.')")

# ---------------- Epic P0-C: validate and test ----------------
T09=$(mk "parse_hourly(payload) -> list[HourlyReading] with a dataclass" --type feature --priority P1 --project P0 -m "$S1" -s Backlog -l stage-0,python,cat:P0-09 --dep "$T08" \
  --desc "$(later 'NEW: classes via dataclasses.')")
T10=$(mk "First tests with pytest on the saved fixture" --type feature --priority P1 --project P0 -m "$S1" -s Backlog -l stage-0,testing,cat:P0-10 --dep "$T09" \
  --desc "$(later 'NEW: pytest (test functions, assert, reading a failure report).')")
T11=$(mk "Raise SchemaError on missing keys or mismatched array lengths" --type feature --priority P1 --project P0 -m "$S1" -s Backlog -l stage-0,python,testing,cat:P0-11 --dep "$T10" \
  --desc "$(later 'NEW: exceptions (raise, catch, custom exception class, pytest.raises).')")
T12=$(mk "Test the fetch function without the network" --type feature --priority P1 --project P0 -m "$S1" -s Backlog -l stage-0,testing,http,cat:P0-12 --dep "$T11" \
  --desc "$(later 'NEW: test doubles (monkeypatch, a fake httpx.Response). Done when tests pass with Wi-Fi off, including a 503 case.')")
T13=$(mk "Keep null readings as None, never 0, and count them" --type feature --priority P2 --project P0 -m "$S1" -s Backlog -l stage-0,python,cat:P0-13 --dep "$T12" \
  --desc "$(later '[Persona: Fatima, Head of Ops Analytics] "A missing reading is not a 0°C reading. Never invent data." Reuse only, no new concept.')")
T14=$(mk "Spike: Open-Meteo output around the Berlin DST change (2026-10-25)" --type spike --priority P2 --project P0 -m "$S2" -s Backlog -l stage-0,http,cat:P0-14 --dep "$T07" \
  --desc "$(later 'Question: what timestamps does the API return for Europe/Berlin on 2026-10-25, with and without the timezone parameter, and with timezone=UTC? Time box 60 minutes. Evidence from real calls.')")

# ---------------- Epic P0-D: load into PostgreSQL ----------------
T15=$(mk "PostgreSQL 16 in Docker Compose with a named volume and healthcheck" --type chore --priority P1 --project P0 -m "$S2" -s Backlog -l stage-0,docker,postgres,cat:P0-15 --dep "$T08" \
  --desc "$(later 'NEW: Docker (image, container, volume, port, Compose).')")
T16=$(mk "ADR-0001 and CREATE TABLE weather_hourly (UTC timestamptz, natural key)" --type design --priority P1 --project P0 -m "$S2" -s Backlog -l stage-0,postgres,sql,data-modeling,cat:P0-16 --dep "$T14,$T15" \
  --desc "$(later 'NEW: DDL and constraints. Design Level 1: mentor decides, I explain it back in the ADR.')")
T17=$(mk "load_readings(conn, readings) with psycopg and an idempotent upsert" --type feature --priority P1 --project P0 -m "$S2" -s Backlog -l stage-0,postgres,sql,cat:P0-17 --dep "$T13,$T16" \
  --desc "$(later 'NEW: talking to a database from Python (connection, cursor, parameters, transaction, commit). Done when two runs leave exactly 24 rows.')")
T18=$(mk "SQL data check: city-days with missing or extra hours" --type feature --priority P2 --project P0 -m "$S2" -s Backlog -l stage-0,sql,cat:P0-18 --dep "$T17" \
  --desc "$(later 'NEW: generate_series. Reuses my baseline: CTEs and LAG.')")

# ---------------- Epic P0-E: make it operable ----------------
T19=$(mk "CLI: weather-etl run --city --date with exit codes 0/1/2" --type feature --priority P1 --project P0 -m "$S2" -s Backlog -l stage-0,python,cat:P0-19 --dep "$T17" \
  --desc "$(later 'NEW: argparse and exit codes.')")
T20=$(mk "Config from environment variables and .env; no secrets in git" --type security --priority P1 --project P0 -m "$S2" -s Backlog -l stage-0,python,cat:P0-20 --dep "$T19" \
  --desc "$(later 'NEW: environment variables and secrets hygiene.')")
T21=$(mk "One structured log line per run" --type feature --priority P2 --project P0 -m "$S2" -s Backlog -l stage-0,python,cat:P0-21 --dep "$T19" \
  --desc "$(later 'NEW: the logging module. Fields: city, date, fetched, nulls, upserted, duration.')")
T22=$(mk "Retries with backoff and jitter on timeout, 429, 5xx only" --type feature --priority P2 --project P0 -m "$S2" -s Backlog -l stage-0,http,cat:P0-22 --dep "$T19" \
  --desc "$(later 'NEW: retry policy (which errors are safe to retry, and why).')")
T23=$(mk "GitHub Actions CI: ruff + pytest with a Postgres service" --type chore --priority P1 --project P0 -m "$S2" -s Backlog -l stage-0,testing,cat:P0-23 --dep "$T17" \
  --desc "$(later 'NEW: CI. Done when a red build blocks merge.')")
T24=$(mk "Review Arjun's PR: multi-city support" --type review --priority P2 --project P0 -m "$S2" -s Backlog -l stage-0,cat:P0-24 --dep "$T19" \
  --desc $'**Author:** [Persona: Arjun]\n\nMentor writes `reviews/TKT-xxx/change.patch` and `PR.md` when this moves to Ready.')
T25=$(mk "Ship v0.1.0: tag, CHANGELOG, README diagram, daily cron, runbook" --type chore --priority P1 --project P0 -m "$S2" -s Backlog -l stage-0,fleet,cat:P0-25 --dep "$T18,$T20,$T21,$T22,$T23" \
  --desc "$(later 'NEW: scheduling with cron and release tags. Done when the next scheduled run logs success. P0 joins FLEET.md.')")
T26=$(mk "Stage 0 coverage audit" --type drill --priority P2 --project P0 -s Backlog -l stage-0,cat:P0-26 --dep "$T25" \
  --desc "$(later 'Check roadmap p0 checklist and the Educative syllabus as a coverage map. Gaps a DE ticket needs soon become small tickets; the rest are not needed now.')")

# P0-B1, P0-B2 (planted bugs) and P0-I1 (incident) are NOT pre-created.
# The mentor files them as stakeholder reports when the data would really show the problem.

echo
echo "Seeded: $T01 .. $T26. Bugs and incidents arrive later, unannounced."
backlog board | sed -n '1,12p'
echo
echo "Next: finish TKT-001 with the mentor, then TKT-002 commits this tracker."
