---
id: TKT-030
title: >-
  UAE job market: 10–15 postings, skill counts, choose the primary cloud and
  tools
status: Ready
assignee:
  - '@rahul'
created_date: '2026-11-25T17:02:00Z'
updated_date: '2026-11-27T04:37:00Z'
labels:
  - job-search
  - cat:DIAG-04
milestone: m-2
dependencies: []
priority: p2
type: spike
project: DIAG
ordinal: 7000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
**Spec owner:** me (method from mentor) · **Time box:** 3 h

### Why this ticket exists
The data, not my guess, chooses the primary cloud and tools. It also sets the depth for BI (Power BI vs Tableau), Snowflake, Azure and certifications.

### Method
- Sources: LinkedIn Jobs, Bayt, GulfTalent, Indeed UAE, company career pages. Titles: Data Engineer, Analytics Engineer, BI/Data Engineer, Data Intelligence/Analytics Platform.
- Level: 2–5 years asked (mid-level). Location: UAE (Dubai, Abu Dhabi), on-site or hybrid.
- For each posting record: title, company type, years asked, cloud, warehouse/lakehouse, orchestration, BI tool, languages, nice-to-haves, salary if shown, link.
- Paste the postings (text, no personal data) or my table; mentor counts skills.

### Output
`docs/market/uae-2026-11.md`: the table, skill counts, the decision (primary cloud, BI tool, warehouse), and what becomes awareness only.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 10–15 postings recorded with all fields
- [ ] #2 Skill counts table with percentages
- [ ] #3 Decision written: primary cloud, BI tool, warehouse; rest marked awareness
- [ ] #4 CLAUDE.md slice S1 tooling and COVERAGE_MAP §13 tags updated if the decision changes them
- [ ] #5 Salary data recorded for every posting that shows it, plus 2 public salary guides/recruiter reports (source + date)
- [ ] #6 Floor/target/stretch bands in CLAUDE.md confirmed or corrected from the data
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

author: @mentor
created: 2026-11-25T17:25:00Z

---

Interview-coverage pass (2026-11-25): added AC so this ticket covers an interview-critical concept.

---

created: 2026-11-27T04:37:00Z

---

Kept: this is market research, not a skill test. Moved to P2; runs in week 2-3 alongside the job loop.

---
<!-- COMMENTS:END -->
