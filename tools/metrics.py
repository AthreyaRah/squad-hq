"""Fill the AUTO section of METRICS.md from the tracker, git and REPS.md.

Run from the workspace root:
    uv run --with pyyaml python -I tools/metrics.py

Only the block between the AUTO markers is rewritten. Manual rows stay.
"""
import datetime as dt
import pathlib
import re
import subprocess
from collections import Counter

import yaml

ROOT = pathlib.Path(__file__).resolve().parent.parent
METRICS = ROOT / "METRICS.md"
BEGIN, END = "<!-- AUTO:BEGIN -->", "<!-- AUTO:END -->"
TODAY = dt.date.today()
WEEK_AGO = TODAY - dt.timedelta(days=7)


def read_tickets():
    tickets = []
    for path in sorted((ROOT / "backlog" / "tasks").glob("*.md")):
        text = path.read_text(encoding="utf-8")
        parts = text.split("---", 2)
        if len(parts) < 3:
            continue
        meta = yaml.safe_load(parts[1]) or {}
        meta["_body"] = parts[2]
        tickets.append(meta)
    return tickets


def to_date(value):
    if not value:
        return None
    return dt.datetime.fromisoformat(str(value).replace("Z", "+00:00")).date()


def git_commits_since(repo, since):
    try:
        out = subprocess.run(
            ["git", "-C", str(repo), "log", f"--since={since.isoformat()}", "--oneline"],
            capture_output=True, text=True, check=True,
        ).stdout
    except (subprocess.CalledProcessError, FileNotFoundError):
        return 0
    return len([line for line in out.splitlines() if line.strip()])


def reps_stats():
    path = ROOT / "REPS.md"
    if not path.exists():
        return 0, 0, 0
    active = due = retired = 0
    section = None
    for line in path.read_text(encoding="utf-8").splitlines():
        if line.startswith("## "):
            section = line[3:].strip().lower()
            continue
        cells = [c.strip() for c in line.strip().strip("|").split("|")]
        if not line.startswith("| R") or len(cells) < 6:
            continue
        if section and section.startswith("active"):
            active += 1
            try:
                if dt.date.fromisoformat(cells[5]) <= TODAY:
                    due += 1
            except ValueError:
                pass
        elif section and section.startswith("retired"):
            retired += 1
    return active, due, retired


def main():
    tickets = read_tickets()
    done = [t for t in tickets if t.get("status") == "Done"]
    done_week = [t for t in done if (to_date(t.get("updated_date")) or dt.date.min) >= WEEK_AGO]
    by_status = Counter(t.get("status") for t in tickets)
    by_type = Counter(t.get("type") for t in done)
    by_project = Counter(t.get("project") for t in done)
    cycle = sorted(
        (to_date(t.get("updated_date")) - to_date(t.get("created_date"))).days
        for t in done if t.get("created_date") and t.get("updated_date")
    )
    median_cycle = cycle[len(cycle) // 2] if cycle else "—"
    revise = sum(len(re.findall(r"\bREVISE\b", t["_body"])) for t in tickets)
    findings = Counter(
        sev for t in tickets for sev in re.findall(r"\((critical|high|medium|low)\)", t["_body"], re.I)
    )
    repos = [ROOT] + [p for p in (ROOT / "projects").glob("*") if (p / ".git").exists()]
    commits_week = sum(git_commits_since(r, WEEK_AGO) for r in repos)
    active, due, retired = reps_stats()

    lines = [
        BEGIN,
        f"_Generated {TODAY.isoformat()} by tools/metrics.py. Do not edit by hand._",
        "",
        "| Metric | Value |",
        "|---|---|",
        f"| Tickets Done (all time / last 7 days) | {len(done)} / {len(done_week)} |",
        f"| Done by type | {dict(by_type) or '—'} |",
        f"| Done by project | {dict(by_project) or '—'} |",
        f"| Open by status | {dict((k, v) for k, v in by_status.items() if k != 'Done') or '—'} |",
        f"| Median cycle time (created → last update, days, approx.) | {median_cycle} |",
        f"| REVISE verdicts recorded in tickets | {revise} |",
        f"| Review findings by severity (tagged in ticket comments) | {dict(findings) or '—'} |",
        f"| Commits in last 7 days (workspace + {len(repos) - 1} project repos) | {commits_week} |",
        f"| REPS active / due today / retired | {active} / {due} / {retired} |",
        END,
    ]
    block = "\n".join(lines)
    text = METRICS.read_text(encoding="utf-8")
    text = re.sub(re.escape(BEGIN) + r".*?" + re.escape(END), block, text, flags=re.S)
    METRICS.write_text(text, encoding="utf-8")
    print(block)


if __name__ == "__main__":
    main()
