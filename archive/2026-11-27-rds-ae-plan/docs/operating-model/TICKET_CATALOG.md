# TICKET CATALOG (slices S1–S6)

This is the slice backlog. The mentor turns a line into a full ticket (TICKET_TEMPLATES.md) just in time, at sprint planning, sized to my depth-grid level in that layer.
Line format: `[type] title — what "done" proves`. Catalog IDs (`S1-03`) go on the ticket as a label `cat:S1-03`.
⚡ = planted bug or chaos (symptom only; causes in `.mentor/`). 🤖 = agent-built ticket (I write spec + tests, an agent writes code, I review and sign off).
Every slice version ends with: `/ship` → `[docs] Write-up + post` (PUB) → PORTFOLIO.md row. Every slice v1 ends with a transfer ticket.
Old catalog (Stage 0–6, 408 lines): `archive/old-plan/TICKET_CATALOG.v1.md`. The mapping is at the bottom.

---

## DIAG — Diagnostic and market (week 1)

- DIAG-01 [spike] SQL test-out: joins and fan-out, windows, read an EXPLAIN plan — known list for SQL
- DIAG-02 [spike] Python test-out: a small class, file I/O, an API call with errors, one pytest test — known list for Python
- DIAG-03 [spike] Git + PR test-out: branch → commit → PR → squash-merge on a scratch repo — known list for Git
- DIAG-04 [spike] UAE job market: 10–15 postings, skill counts, primary cloud + tools chosen from data — `docs/market/uae-2026-11.md`
- DIAG-05 [chore] Baseline depth grid from DIAG-01..04 — DEPTH_GRID.md filled with evidence

## S1 — Ingest → bronze/silver/gold (PS public twin)

Data: a synthetic PS generator (projects, resources, time entries, invoices). New custom fields appear over time (drift), plus late records and duplicates ⚡.
v1 (Level 1 design; about 2–3 weeks):
- S1-01 [chore] Repo skeleton: uv, ruff, mypy, pytest, Makefile `make run`, README stub with a diagram, CI (lint + types + tests) — clean clone runs CI green; type hints from day 1
- S1-02 [feature] Bronze: land the generator's daily JSON/CSV drops as Delta (local PySpark) with ingest metadata, partitioned by date — rerun of a day is idempotent; I read `explain()` and say where the shuffle is; Parquet vs CSV vs JSON trade-off in the README
- S1-03 [feature] Silver: types, dedup on natural key (window), late records kept, quarantine ⚡ — row counts reconcile bronze → silver; NULL logic tested
- S1-04 [feature] `dynamic_pivot(df, key, attr_col, value_col)` handles fields that appear over time, with tests — a new field shows up as a column with no code change
- S1-05 [feature] Gold: utilization and billable-hours facts with a stated grain, in dbt (dbt-duckdb or dbt-databricks) — dbt tests pass; grain written in the model doc
- S1-06 [feature] Data-quality checks: not null, unique, accepted values, freshness, volume range — a planted bad day fails loudly ⚡
- S1-07 [feature] Orchestrate the daily run with Airflow in Docker Compose: retries, catchup/backfill of 7 days, idempotent tasks, structured logging and config from env — one scheduled run + one backfill succeed; FLEET.md entry
- S1-08 [feature] API ingestion of one source from a local mock API (auth token, pagination via a generator, 429/5xx retry via a decorator with backoff + jitter, idempotent reload) ⚡ — backend: HTTP + retries
- S1-09 [chore] AWS basics: S3 bucket + IAM least-privilege user, land bronze files to S3 (free tier) — role policy reviewed, no root keys
- S1-10 [feature] Incremental silver with Delta MERGE on a watermark; backfill a date range; time travel to undo a bad load; OPTIMIZE/VACUUM and the small-files problem — a rerun and a backfill give identical results (test)
- S1-11 [perf] Spark performance basics at 10x volume: read the physical plan, broadcast vs sort-merge join, repartition vs coalesce, one skewed key and its fix, Spark UI screenshots — before/after numbers in the README
- S1-T [chore/transfer] Apply dynamic pivot + medallion to the PS pod — counts and outcomes only
v2/v3 (deepen; pick by need): **run S1 on Databricks Free Edition (Auto Loader, Unity Catalog, Workflows) — before interviews if DIAG-04 shows Databricks demand** · async paginated fetch with asyncio + semaphore (Python concurrency [W]) · pandas vs PySpark vs DuckDB on the same transform (when to use which) · schema drift contract (fail vs evolve) · MySQL on RDS as a sink (the team pattern) · Spark partitioning and file sizing · data contracts · DuckDB vs Spark ADR · 🤖 agent-built connector for a second source · rebuild metrics.py as a real pipeline over my tracker (old DOG-1)

## S2 — Semantic layer, BI, governance (on S1 gold)

v1 (Level 2 design):
- S2-01 [design] Ontology and glossary: ARR, utilization, billable vs non-billable, Sales vs Finance revenue (Omar ⚡ double count) — `docs/glossary.md` with owners
- S2-02 [feature] Clean the gold model: conformed dims, one fact per grain, names a stranger understands — "which table is real" answered by the model, not a note
- S2-02b [feature] SCD Type 2 on resource role and bill rate: by hand in SQL MERGE, then as a dbt snapshot; Type 1 vs 2 vs 3 trade-offs in the README — point-in-time utilization by rate is correct (test)
- S2-02c [feature] Finance views for Omar: GROUPING SETS/ROLLUP subtotals, cohort retention of projects, EXISTS vs IN vs JOIN with plans — totals reconcile to the cent
- S2-03 [feature] Metric layer: metric views (Databricks) or dbt semantic models / MetricFlow — 5 metrics defined once, queried twice the same way
- S2-04 [feature] Supervision tiers: tag every asset Core / Curated / Wild West with a quality bar and a promotion check — `docs/tiers.md`; Core metric tests in CI
- S2-05 [feature] Agent context file: joinable fields, metric definitions, gotchas, generated from the model where possible — an agent answers 5 sample questions correctly
- S2-06 [feature] BI view on the metric layer (Tableau Public or Power BI Desktop concepts: semantic model, measures/DAX basics) — Fatima's dashboard reconciles to a Core metric
- S2-07 [chore] Lineage + access control: dbt docs lineage, column descriptions, role-based grants (Unity Catalog concepts or Postgres roles) — a restricted role cannot see PII columns
- S2-09 [spike] Statistics for AE interviews: design and read an A/B test on a synthetic experiment (power, CI, t-test, peeking pitfall) in NumPy then SciPy — a 1-page readout Fatima can act on
- S2-T [chore/transfer] Metric views for PS self-service — counts and outcomes only
v2/v3: row-level security · data contracts with owners · metric change process (versioned definitions) · self-service adoption metrics · Power BI semantic model deeper if postings ask

## S3 — Renewals: GRR/NRR + churn (renewals public twin)

Data: a public subscription/churn dataset + synthetic contracts (start, end, amount, upgrades, downgrades).
v1:
- S3-01 [feature] Contracts model + GRR/NRR by month (gaps-and-islands for contract continuity, date spine via recursive CTE), reconciled by hand on 3 accounts — Omar signs off
- S3-02 [spike] Churn framing: label, prediction date, horizon, leakage list (Leila ⚡) — a 1-page framing doc
- S3-03 [feature] Point-in-time features + time-based split — no feature uses data after the cutoff (test proves it)
- S3-04 [feature] Baseline (logistic regression) vs boosting (XGBoost/LightGBM), class imbalance, calibration — metrics table with PR-AUC
- S3-05 [feature] MLflow tracking + registry — every run reproducible from the registry
- S3-06 [feature] Batch scoring job writes scores to the warehouse — scheduled run lands scores
- S3-07 [feature] Monitoring: data drift (PSI) + score distribution report — a planted shift fires the alarm ⚡
- S3-08 [docs] Stakeholder report for Renewals leadership — decision, trade-offs, limits in plain words
- S3-T [chore/transfer] GRR/NRR pipeline + churn baseline at work — counts and metrics only
v2/v3: SHAP explanations · survival analysis (time to churn) · uplift for retention offers · retraining policy · feature table in a feature store (aware)

## S4 — AI on data (over S2)

v1 (Level 3 design):
- S4-01 [feature] Eval set: 30 questions with known answers from the Core metrics — evals run in one command
- S4-02 [feature] Multi-turn text-to-SQL agent over the S2 context file (Claude API) — eval accuracy baseline recorded
- S4-03 [feature] Context v2: improve the model or the context, re-run evals — accuracy delta, tokens and cost per answer
- S4-04 [feature] MCP server exposing read-only SQL + glossary tools (auth, least privilege, row limits) — backend: a small service with tests
- S4-05 [feature] RAG over the docs/glossary with a vector store (pgvector or DuckDB VSS) — citation checks in evals
- S4-06 [security] Guardrails: prompt injection test, read-only enforcement, PII refusal (Sara) — tests prove each control
- S4-07 [chore] Eval gate in CI + cost/latency log (p95, tokens) — a regressed prompt fails CI
- S4-T [chore/transfer] Genie/Glean-style agent at work — eval pass rate and adoption counts only
v2/v3: eval drift over time (catch answer drift first) · LLM-as-judge calibrated against hand labels · agent failure catalog (where agents go wrong on SQL) · 🤖 agent-built dashboard (Dive-style) with sign-off · multi-agent (aware)

## S5 — Data app serving (time entry + consultant booking)

v1:
- S5-01 [feature] FastAPI skeleton: health check, settings from env, structured logs, tests — layered (router → service → repository)
- S5-02 [feature] REST endpoints for time entries: validation (Pydantic), errors, pagination, idempotency key on create — contract tests
- S5-03 [feature] Postgres with migrations (Alembic), transactions, connection pooling — migration up/down works
- S5-04 [feature] AuthN/authZ: OIDC login (or JWT), roles (consultant, manager) — a consultant cannot approve hours
- S5-05 [feature] Booking: no double booking under concurrent requests (locking or constraint) ⚡ — a concurrent test proves it
- S5-06 [feature] Simple UI (Streamlit or a small HTML/HTMX page; Databricks Apps pattern) — book a slot end to end
- S5-07 [chore] Docker + CI/CD deploy to a free host, smoke test, rollback drill — deployed URL in README
- S5-T [chore/transfer] Apply the pattern to the work time-entry/booking app — outcomes only
v2/v3: caching hot reads · background jobs (email/notify) · rate limiting · OpenTelemetry traces · 🤖 agent-built admin page with review · React + TypeScript UI (100xDevs React sections; only if a job needs it)

## S6 — Reliability, performance, cost

v1:
- S6-01 [spike] CDC awareness: Debezium or MySQL binlog → Kafka → bronze, in Docker — a design note + one working local demo
- S6-02 [perf] Spark tuning on S1 at 10x volume: partitions, skew, broadcast join, Spark UI — before/after numbers
- S6-03 [perf] Profile a slow Python step (cProfile/py-spy) and fix it — before/after
- S6-04 [perf] Load test S5 (k6 or Locust): p50/p95/p99, then one fix (pool size, cache, index) — report
- S6-05 [perf] LLM cost and latency for S4: cache, smaller model routing, prompt size — cost per answer before/after
- S6-06 [incident] Incident drill on the fleet ⚡ — postmortem + STAR story
- S6-07 [docs] Platform cost note: warehouse/cluster cost drivers and 3 savings — numbers from my runs
- S6-T [chore/transfer] One cost or reliability fix at work — outcome only
v2/v3: Structured Streaming with watermarks · Kubernetes awareness (deploy S5 on kind) · SLOs and alerts · circuit breakers and timeouts on S4 tools

## JOB and PUB (every sprint from week 3)

- JOB-x [chore] `/apply` week n: 3 applications, 1 resume/LinkedIn tweak, 1 timed SQL/Python set
- JOB-RES [docs] Resume + LinkedIn v1 from real slices (honest: personal projects) — week 2–3
- JOB-MOCK [drill] Monthly mock with Khalid: SQL, Python, one design, one STAR story — score in METRICS.md
- PUB-x [docs] Weekly public post / repo update from the slice write-up — link in PORTFOLIO.md
- JOB-SD [drill] DE/AE system design drills, **one per week from week 3**: batch ingestion, CDC pipeline (incl. Kafka basics at [A]: topics, partitions, offsets, consumer groups, at-least-once), lakehouse, metric layer, AI-on-data — from my own slices
- JOB-TARGETS [docs] Target list: 30 UAE companies in 3 tiers by pay (from DIAG-04 salary data + recruiter reports), with the slice to lead with for each — week 2
- JOB-STAR [docs] 8 STAR stories, honest: 4 from my real BI/analyst work (stakeholders, a metric fix, automation, a dashboard decision) + 4 from slices/incidents — week 2–3
- JOB-OUT [chore] Outreach: 3 messages a week to UAE data people/recruiters (ask for a referral or a 15-min chat), tracked in METRICS.md — from week 3
- JOB-LOG [docs] Move logistics: notice period, relocation budget, visit-visa vs remote-interview plan, documents (degree attestation), LinkedIn location and "open to work" settings — week 2
- JOB-NEG [drill] Salary negotiation: my floor, target and stretch (monthly total package: basic + housing + transport), how to answer "current salary", one mock negotiation — before the first offer
- JOB-DSA [drill] Light coding-round prep inside /apply timed sets: 1 LeetCode easy/medium a week (hashing, two pointers, sliding window, sorting, stacks) + 1 pandas problem — from week 3

---

## Deep track (later: after S1–S5 v1 ship and the job switch, or when a job needs it)

BE-2 offer management (Django) · SYS-1 log/LSM store from first principles · FAB-1 Fabric lakehouse (only if postings ask for DP-700) · ML-0 algorithm lab · ML-4 unsupervised/recommenders · ML-5 deep learning · ML-6 RL and ML at scale · AI-4 from-scratch tokenizer/transformer · FS-2 chat on Kubernetes · FS-3 Next.js UIs · FS-4 capstones · INF-2·0 C++ · INF-2 CUDA/Triton · INF-3 PyTorch performance · INF-4 LLM serving · INF-5 inference lab. Full lines: `archive/old-plan/TICKET_CATALOG.v1.md`.

## Old → new mapping

| Old epic | New home |
|---|---|
| P0 (weather ETL) | Archived. Its concepts (HTTP, retries, pytest, upsert, CLI, CI) live in S1-01, S1-08 and DIAG-02 |
| DE-1, DE-2, DE-3 | S1 (v1–v3); DE-2 modeling also S2 |
| DE-4, INF-1 | S6 |
| ML-1, ML-2, ML-3 | S3 |
| AI-1, AI-2, AI-3 | S4 |
| FS-1, BE-1 (trimmed) | S5 |
| DE-SD, DE-INT | JOB-SD, JOB-MOCK |
| DOG-1..6 | tools/metrics.py now; optional S1 v3 rebuild |
| BE-2, SYS-1, FAB-1, ML-0/4/5/6, AI-4, FS-2/3/4, INF-2..5 | Deep track |
