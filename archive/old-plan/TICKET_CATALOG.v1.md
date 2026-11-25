# TICKET CATALOG (the skeleton backlog)

This is the backlog skeleton for every stage, in order. It is not the final ticket text.
The mentor turns each line into a full ticket (TICKET_TEMPLATES.md) **just in time**: at sprint planning, after checking PROGRESS.md, the Concept Log, and my repos. Real teams plan this way: the epic list is known early, the ticket details are written when the work is close.

How to read a line: `[type] title — what "done" proves`.
- `ID` here is a catalog ID (e.g. `P0-07`). The tracker gives it a real ID (`TKT-0xx`) when created. Keep the catalog ID as a label (e.g. `cat:P0-07`) so audits can map them.
- Lines marked ★ are mastery-gate tickets (RDS_MODEL.md section 10, L4 evidence).
- Lines marked ⚡ are planted bugs or chaos incidents. This file shows only the symptom. The causes live in `.mentor/incident-plan.md`, which I (Rahul) do not read until the postmortem of each incident.

Both variants (Ping and public) follow CLAUDE.md: ask "Ping or public first?" before a project starts. The catalog shows the public variant in detail and lists Ping differences. All Ping rules in CLAUDE.md (data handling) apply.

**Completeness:** `COVERAGE_MAP.md` lists every concept with its depth target and home epic. Epic letters below (for example `DE-1·H`) are the homes it refers to. At sprint planning, check the map rows for the project; at the stage audit, every row must be covered.
Every project, without exception, also gets:
- `[chore] Repo skeleton + README + docs/architecture.md + docs/adr/ + CI` (first ticket)
- `[design] Architecture diagrams v1 (context, container, flow)` (mentor at L1, me from DE-2)
- `[docs] Runbook` once it runs on a schedule or a server
- `[chore] Ship v1 + add to FLEET.md`
- `[design] Project design review` (CLAUDE.md "After each project")

---

## STAGE 0 — Onboarding from zero (P0: Open-Meteo weather ETL → PostgreSQL CLI)

Starting point (CLAUDE.md CLEAN START): syntax-aware Python (functional style), SQL basics with CTEs and some window functions, BI work. Nothing else is assumed.

The ticket order below IS the foundations path. Each ticket adds at most ONE new concept (marked NEW), taught JIT to the depth that ticket needs. Tool installs are commands, taught in full, and do not count as the new concept.

Scope cap (CLAUDE.md): fetch → validate → test → load to PostgreSQL → CLI → schedule → CI → ship → on-call. Generators, decorators, packaging details, concurrency wait until a DE ticket needs them.

**Epic P0-A: Workstation and tools**
- P0-01 [chore] Workstation setup: terminal, package manager, Git, Node.js, Backlog.md — NEW: the terminal (paths, `cd`, `ls`, `pwd`, flags, PATH). Done when each tool prints its version in a new terminal window.
- P0-02 [chore] Commit the tracker to the Squad HQ git repo — NEW: Git basics (status, add, commit, log, `.gitignore`). Done when `git log` shows the tracker commit and `projects/` is ignored.
- P0-03 [chore] GitHub account, `gh auth login`, push Squad HQ to a private repo — NEW: remotes and push. Done when the repo shows on GitHub and `git status` says "up to date with origin/main".
- P0-04 [chore] Create the `weather-etl` project with uv; run a hello script; push it as its own GitHub repo — NEW: uv and virtual environments (what `.venv` is, why `uv run`). Done when a fresh clone runs `uv run python hello.py`.

**Epic P0-B: First data from a real API**
- P0-05 [chore] First pull request: add a README on a branch, open a PR with the template, squash-merge after review — NEW: branches and PRs. Done when `main` has the README via a merged PR.
- P0-06 [feature] Fetch tomorrow's hourly forecast for Dubai and print 24 temperatures — NEW: HTTP (request, response, status code, query string, JSON) with httpx. Done when the script prints 24 lines and a wrong URL prints a clear error, not a crash dump.
- P0-07 [feature] Save the raw response to `data/raw/<city>/<date>.json` and load it back — NEW: files, paths (`pathlib`), and the `json` module. Done when a rerun overwrites the same file and the reload equals the original.
- P0-08 [chore] Move the code into a `src/weather_etl/` package and run it as a module — NEW: modules, packages, imports. Done when `uv run python -m weather_etl` works from the project root.

**Epic P0-C: Validate and test**
- P0-09 [feature] `parse_hourly(payload) -> list[HourlyReading]` with a dataclass — NEW: classes via dataclasses. Done when the saved Dubai file gives 24 readings with `observed_at`, `temperature_c`, `location`.
- P0-10 [feature] First tests with pytest on the saved fixture — NEW: pytest (test functions, `assert`, reading a failure report). Done when `uv run pytest` passes and a deliberately broken assert shows a readable failure.
- P0-11 [feature] Raise `SchemaError` on a missing key or when `hourly.time` and `hourly.temperature_2m` lengths differ — NEW: exceptions (raise, catch, custom exception class, `pytest.raises`). Done when two error-path tests pass.
- P0-12 [feature] Test the fetch function without the network — NEW: test doubles (`monkeypatch`, a fake `httpx.Response`). Done when the tests pass with Wi-Fi off, including a 503 case.
- P0-13 [feature] Keep null readings as `None`, never 0, and count them in the run summary — reuse only. [Persona: Fatima] "A missing reading is not a 0°C reading."
- P0-14 [spike] ⚡ "What does Open-Meteo return around the Europe/Berlin DST change on 2026-10-25, with and without the `timezone` parameter?" — real calls saved as fixtures; written answer; 60-minute time box.

**Epic P0-D: Load into PostgreSQL**
- P0-15 [chore] PostgreSQL 16 in Docker Compose with a named volume and a healthcheck; connect with `psql` — NEW: Docker (image, container, volume, port, Compose). Done when data survives `docker compose down` and `up`.
- P0-16 [design] ADR-0001 and the table: `CREATE TABLE weather_hourly` with types, `timestamptz` in UTC, primary key (location_id, observed_at), NOT NULL rules — NEW: DDL and constraints (beyond my SQL baseline). Mentor decides (Design Level 1); I explain it back in the ADR.
- P0-17 [feature] `load_readings(conn, readings)` with psycopg and `INSERT ... ON CONFLICT DO UPDATE` — NEW: talking to a database from Python (connection, cursor, parameters, transactions, commit). Done when two runs for the same day leave exactly 24 rows and a changed value updates.
- P0-18 [feature] A data check in SQL: find city-days with missing or extra hours — NEW: `generate_series` (it reuses my CTE and window-function baseline: `LAG` to find gaps). Done when the query returns zero rows on good data and finds a gap I delete on purpose.

**Epic P0-E: Make it operable**
- P0-19 [feature] CLI `weather-etl run --city dubai --date 2026-11-02` with exit codes 0/1/2 — NEW: argparse and exit codes.
- P0-20 [security] Config from environment variables and `.env`; no secrets in git — NEW: environment variables and secrets hygiene. Done when `git grep -i password` finds only `.env.example`.
- P0-21 [feature] One structured log line per run (city, date, fetched, nulls, upserted, duration) — NEW: the `logging` module.
- P0-22 [feature] Retries with exponential backoff and jitter on timeouts, 429, and 5xx only; never on other 4xx — NEW: retry policy (which errors are safe to retry, and why). Done when a fake that fails twice then succeeds passes, and a 404 fails at once.
- P0-23 [chore] GitHub Actions CI: ruff + pytest with a PostgreSQL service container — NEW: CI. Done when a red build blocks merge.
- P0-24 [review] [Persona: Arjun] PR "multi-city support" — first review ticket. Graded.
- P0-25 [chore] Ship v0.1.0: tag, CHANGELOG, README with diagram, daily cron at 06:00, runbook — NEW: scheduling with cron and release tags. Done when the next scheduled run's log shows success. P0 joins FLEET.md.
- P0-26 [drill] Stage 0 coverage audit against the roadmap p0 checklist and the Educative syllabus (coverage map only) — gaps that a DE ticket needs soon become small tickets; the rest are "not needed now".

**Arrives later, unannounced (mentor files them as stakeholder reports when the data would show it):**
- P0-B1 [bug] ⚡ [Persona: Fatima] "The hottest hour in Dubai shows up at 10:00 in the morning."
- P0-B2 [bug] ⚡ [Persona: Fatima] "The Berlin numbers for Sunday 25 October look wrong."
- P0-I1 [incident] ⚡ SEV3 [Persona: Fatima] "No new weather rows since Tuesday." Postmortem.

**Field reports (at most one per week):** AWS Architecture Blog, "Exponential Backoff and Jitter" (with P0-22); Stripe, "Designing robust and predictable APIs with idempotency" (with P0-17).

**Stage 0 gate:** all P0 tickets Done, P0 in FLEET.md and healthy for 7 days, every core concept used in Stage 0 at Functional or better in the Concept Log (new rows, not pre-reset rows).

---

## STAGE 1 — Data engineering (mid-senior bar)

From here on, from the first sprint: 1 chaos incident per week on a fleet system, 1 review ticket per sprint, about 15% fleet maintenance.

### DE-1 Batch ingestion

**Public: NYC TLC trip records (monthly Parquet) → PostgreSQL**
- Epic 0 SQL beyond my baseline (taught JIT through reconciliation work): [bug] [Persona: Omar] "trip counts by zone don't match the TLC dashboard" — teaches join semantics (inner vs left, fan-out), NULL in `COUNT(col)` vs `COUNT(*)`, `NOT IN` with NULLs, and stating the grain of every query; [feature] a reconciliation query pack in SQL (anti-joins, `EXCEPT`, `UNION ALL` totals, `FILTER` clauses) that later becomes data tests.
- Epic A Source anatomy: [spike] TLC file layout, data dictionary, file sizes per year; [spike] "trace one HTTP download: DNS → TCP → TLS → HTTP" with `curl -v` and `dig` (networking checklist).
- Epic B Bulk load: [feature] stream one month into a staging table with `COPY` (not row inserts) — 1 month loads in < N minutes, memory stays below a stated cap; [perf] compare row inserts vs `executemany` vs `COPY` with numbers; [feature] load manifest table (file, checksum, rows, status) so reruns skip done files.
- Epic C Schema drift: ⚡ [bug] [Persona: Omar] "2019 and 2023 totals do not match the TLC's published counts"; [feature] a schema registry per year + mapping layer + a test per known drift.
- Epic D Partitioning: [design] ADR range-partition by pickup month; [feature] declarative partitions + attach/detach; [perf] EXPLAIN ANALYZE before/after partition pruning.
- Epic E OS under load: [drill] diagnose my running loader with `ps`, `top`, `vmstat`, `iostat`, `lsof`, `strace` — write what is the bottleneck, with evidence; ⚡ [incident] "loader killed overnight".
- Epic F PostgreSQL internals: [drill] B-tree index on (pickup_datetime) and plan reading; [spike] MVCC: update a row in one session, read it in another, see `xmin/xmax`; ⚡ [incident] "table is 3x bigger than the data"; ⚡ [incident] "inserts hang"; [spike] WAL: what happens on `kill -9` of Postgres mid-load, and why data is safe.
  Also in Epic F: [spike] isolation levels: reproduce a non-repeatable read and a write-skew anomaly in two `psql` sessions, then fix with the right level; ⚡ [incident] "two loaders deadlocked" (lock ordering); [drill] composite vs covering vs partial index on a real query, with plans; [spike] B-tree vs LSM-tree storage engines (ADR-style note).
- Epic G Git flow: [chore] rebase a branch on a moved `main` and resolve a conflict (mentor plants the conflict scenario with a teammate patch).
  Also in Epic G: [drill] `git bisect` to find which commit broke a test (mentor provides a repo with a planted regression); [drill] recover a "lost" commit with `reflog`.
- Epic H Python concurrency and lazy processing (roadmap p0 checklist + p011): [perf] download 24 monthly files sync vs threads vs asyncio (`httpx.AsyncClient`, a semaphore to cap concurrency, timeouts, cancellation on Ctrl+C) — benchmark table and a defended choice; [perf] CPU-bound validation of one month: threads vs processes (`ProcessPoolExecutor`) — explain the result with the GIL; ⚡ [bug] "manifest says 23 files done, 24 are loaded" (race condition on shared state; fix with a lock or a queue, explain); [feature] stream-parse a 5 GB CSV export with generators in constant memory, proved with `tracemalloc`; [feature] a context manager for "transaction + timing + structured log"; [tech-debt] replace P0's hand-written retry with a decorator (`functools.wraps`, arguments); [chore] type hints + mypy strict in CI; [perf] profile the slowest transform with cProfile, line_profiler, and py-spy, fix the hotspot; [feature] property-based tests with `hypothesis` for the row parser; [chore] package the loader properly (entry point, build a wheel, version 1.0.0); [drill] the classic concurrency interview set, each as a tested module: producer–consumer with a bounded queue, reader–writer lock, thread-safe rate limiter, dining philosophers (deadlock and its fix), an async crawler with a concurrency cap.
- Epic I Shell and ops: [feature] a bash ops script (`set -euo pipefail`, args, exit codes) that checks disk, DB size, and last-load freshness using `psql`, `grep`, `awk`, `jq`; [chore] run the loader as a systemd timer OR cron with logs rotated; [spike] namespaces and cgroups: why the container OOM-kill in Epic E happened at the kernel level.

**Public part 2 — UAE Government Open Data pipeline (roadmap p12 portfolio project 2):** API ingestion from UAE open-data portals (Bayanat / Dubai Pulse APIs or their downloadable datasets): dataset discovery from the catalog API, pagination, rate limits, incremental refresh by `last_modified`, schema registry per dataset, data contracts, and a small data catalog page listing freshness and owners. ⚡ [bug] "a dataset silently changed its column units" (contract check catches it).

**Ping: Kantata API (realistic mock built by the mentor in `tools/mocks/kantata/`, from the public API docs) → PostgreSQL**
- [spike] Integration anatomy (CLAUDE.md): auth, pagination, rate limits, errors, payloads.
- [feature] OAuth/token auth with refresh; [feature] pagination; [feature] incremental load on `updated_at` watermark with a safety overlap window; [feature] idempotent upsert; [feature] 30-minute schedule.
- ⚡ [bug] "records updated during the run are missing".
- ⚡ [incident] "429 storm, the job takes 3 hours".
- ⚡ [bug] "deleted projects still in reports".
- [review] [Persona: Arjun] pagination PR with an off-by-one and no `Retry-After` handling.

**Legacy (once in Stage 1):** `tools/legacy/arjun-etl/` — a 600-line script loading CSVs with pandas, global state, silent `except`. Tickets: characterization tests → split into modules → fix the bug the users report → 5x faster load.

**Field reports:** GitLab.com database incident postmortem (31 Jan 2017) — with the WAL/backup tickets; Use The Index, Luke — the chapter on the B-tree and the WHERE clause (with the index drill).

★ **Mastery gate DE-1:** "Backfill 10 years of TLC data while the monthly job keeps running, with zero double counts, under a memory cap, with a progress table and resumability after a kill -9 at any point." Proven by a chaos run during the backfill.

### DE-2 Data modeling, medallion, orchestration

**Public: multi-source warehouse (roadmap p12 portfolio project 4): Olist e-commerce (9 CSV tables) + the Olist marketing-funnel dataset (leads → closed deals) + a daily FX-rates API (BRL → AED/USD) → bronze/silver/gold → Snowflake.** Conformed dimensions across sources (seller, date, currency); late FX rates; source-to-target reconciliation per source.
- Epic A Modeling: [design] grain statements for every fact (order item, payment, review); [design] bus matrix (conformed dimensions); [feature] dim_customer using `customer_unique_id` not `customer_id`; ⚡ [bug] [Persona: Omar] "revenue is 20% too high"; ⚡ [bug] "review counts don't match"; [feature] geolocation dedupe by zip prefix with a documented rule.
  Also in Epic A: [design] normalize Olist's raw tables to 3NF/BCNF first (ER diagram), then explain why the warehouse denormalizes (OLTP vs OLAP); [feature] accumulating snapshot fact for the order lifecycle (purchase → approved → shipped → delivered timestamps); [feature] periodic snapshot fact (daily seller backlog); [feature] bridge table for orders with multiple payment types; junk dimension for order flags; degenerate dimension `order_id`; role-playing date dimension; [feature] customer entity resolution with union-find over matching rules (DSA tie-in); [spike] Data Vault: hubs, links, satellites for customer and order — compare with the star schema in an ADR; [design] semantic layer: define revenue, AOV, repeat rate once.
- Epic B SCD: [feature] SCD Type 1 and 2 by hand in SQL first; then dbt snapshots; [drill] Types 0, 3, 4, 6 on a toy dimension, then pick per attribute in an ADR; ⚡ [bug] "seller appears in two regions on the same day".
  Also in Epic B: every SCD type (0, 1, 2, 3, 4, 5, 6) implemented by hand in SQL on the seller dimension, each with a test, before choosing per attribute; [bug] fix overlapping SCD2 ranges with an interval-merge algorithm (DSA tie-in).
- Epic SQL Advanced SQL through Omar's finance pack: [feature] monthly revenue with subtotals by state and category using `GROUPING SETS`/`ROLLUP`/`CUBE`; [feature] a recursive CTE for a category hierarchy and a date spine; [feature] seller active streaks (gaps and islands); [feature] cohort retention matrix (first-purchase month × months since) and a conversion funnel; [feature] top-3 products per state (`ROW_NUMBER`/`QUALIFY`), pivot of payment types; [perf] the same question with `EXISTS` vs `IN` vs `JOIN`: read the three plans, explain; [feature] window frames: 7-day moving average with `ROWS` vs `RANGE` and the difference on gappy dates; [feature] a materialized view with refresh strategy; [spike] a SQL function and a trigger, and why triggers are risky in pipelines.
- Epic C dbt: [feature] sources + freshness; [feature] staging/intermediate/marts; [feature] tests (unique, not_null, relationships, accepted_values, a custom singular test); [feature] incremental model with `is_incremental()`; ⚡ [bug] "late-arriving orders never show up"; [feature] macros; [docs] lineage docs.
  Also in Epic C: seeds, Jinja loops, exposures, a generic custom test; [spike] dbt semantic layer / metrics (A).
- Epic D Airflow: [feature] DAG with retries, sensors, and SLAs; [feature] idempotent tasks keyed on the logical date; ⚡ [incident] "Airflow is running 600 jobs and the DB is on fire"; [feature] a safe backfill runbook.
  Also in Epic D: dynamic task mapping, task groups, pools, a deferrable sensor; [spike] Dagster/Prefect vs Airflow ADR.
- Epic E Data quality and five-failure drill (CLAUDE.md): source down, malformed record, schema change, duplicates, downstream DB failure — each injected by chaos, each recovered, then data contracts, a dead-letter table, and an alert.
  Also in Epic E: freshness and volume anomaly checks; Great Expectations or Soda suite on silver.
- Epic F Snowflake (trial): [feature] load the gold layer; [feature] clustering key and a query that benefits; [feature] time travel recovery after a bad `UPDATE` (chaos: mentor runs a wrong update script I must undo); [feature] stream + task pipeline; [chore] cost: warehouse auto-suspend, a credits check.
  Also in Epic F: stages and `COPY INTO` with file formats; zero-copy clone for a test environment; one big table vs star with credit usage compared; `QUALIFY`.
- [review] [Persona: Mei] dbt PR whose tests pass but test the wrong grain.

**Ping: Kantata bronze → silver → gold** — dimensional model for utilization, margin, billing; SCD2 on resource roles and rates; Airflow 30-minute refresh; Tableau on gold. ⚡ [bug] "utilization above 100%".

★ **Mastery gate DE-2:** [Persona: Omar] "Finance says gross margin for Q3 is wrong, and the board meeting is Thursday." Vague on purpose. I find the cause, fix it, backfill history, prove it with a reconciliation report, and write the stakeholder note.

**Field reports:** Airbnb engineering, "How Airbnb Achieved Metric Consistency at Scale" (Minerva); dbt docs "Best practice guides — How we structure our dbt projects".

### DOG-1 (after DE-2): ingest my own tracker, git logs, and Concept Log; dbt + Airflow; dashboard of my metrics (RDS_MODEL.md section 12). Includes a ticket-dependency graph with topological sort and cycle detection (DSA tie-in).

### DE-3 Distributed processing and cloud lakehouse

**Epic 0 Formats and platforms (both variants):** [spike] CSV vs JSON vs Parquet vs Avro vs ORC on the same data: size, write time, read time for a column subset, with snappy/zstd/gzip; [spike] Delta vs Iceberg vs Hudi ADR; [design] cloud equivalence ADR: Azure ↔ AWS (S3, Glue, Athena, EMR, Redshift, Kinesis, Lambda, Step Functions, IAM) ↔ GCP BigQuery — what my DE-3 design looks like on AWS; [spike] relational vs non-relational: when Cosmos DB (or DynamoDB) is the right store; [feature] local analytics on the lake with DuckDB and Polars vs pandas (timings).
**Ping (laptop): PySpark + Delta on Kantata history scaled with synthetic volume**
- [feature] PySpark pipeline: joins, aggregations, a tested UDF; [spike] Spark UI tour on my job: stages, tasks, shuffle read/write; ⚡ [incident] "job stuck at 199/200 tasks"; ⚡ [incident] "driver OOM"; [perf] broadcast join vs sort-merge with numbers; [feature] CDC with Delta `MERGE` (SCD2); ⚡ [bug] "MERGE fails: multiple source rows matched"; [perf] small-files problem and `OPTIMIZE`; [spike] read the physical plan: Catalyst stages, whole-stage codegen (Tungsten); [perf] cache vs persist levels with timings; [perf] repartition vs coalesce; [feature] pandas UDF vs Python UDF vs built-in, timed; [chore] Delta `VACUUM` and retention; [spike] OpenLineage events from one job (A).

**Public: Dubai real estate (Dubai Pulse open data) on Azure**
- Epic A Infra as code: [feature] Terraform: resource group, storage (ADLS Gen2), Key Vault; remote state; [drill] plan vs apply vs state, a drift scenario (mentor changes a tag in the portal; I detect it with `plan`).
- Epic B ADF: parameters, triggers, metadata-driven copy, watermark incremental, retries; ⚡ [bug] a late-arriving transaction and a backfill; [feature] Key Vault secrets in linked services; [security] RBAC: management plane vs data plane, least privilege for the ADF identity.
- Epic C Databricks medallion: Auto Loader with schema evolution; ⚡ [incident] "new column appeared, bronze job failed at 3am"; SCD2 with MERGE; time travel restore; liquid clustering or ZORDER with before/after numbers; Unity Catalog grants.
- Epic D Serving: Synapse serverless SQL over the lake; [design] ADR dedicated-pool distribution choice (hash vs round-robin vs replicated).
- Epic E CI/CD: multi-stage pipeline (validate → test → deploy dev → deploy prod with approval).
- [chore] Cost: budget alert; a cost report per pipeline run; [security] diagnostic settings and audit logs for Key Vault and storage access, with one alert on an unexpected reader.
- Epic F Property feature pipeline (roadmap p12 portfolio project 3): PySpark feature tables for a price-per-sqft model from the Dubai transactions (area-level rolling medians, time since last sale, project-level aggregates), point-in-time correct, written as Delta feature tables with documentation; consumed later by an ML-3 model; ⚡ [bug] "the model is too good" (features use future sales). ⚡ [incident] "Azure bill alert".

**Certs here:** Databricks Fundamentals, DP-900, Databricks DE Associate, Spark Developer (CLAUDE.md CERTIFICATION TRACK).

★ **Mastery gate DE-3:** "A Spark job got 5x slower after a data volume increase. Find the cause from the Spark UI and event logs only, fix it, prove the fix, and explain the mechanism (partitions, shuffle, skew, spill)."

**Field reports:** Databricks docs on Adaptive Query Execution; Uber engineering on its Hudi / incremental lake (data freshness at scale).

### FAB-1 Fabric lakehouse (for DP-700), alongside DE-4: rebuild DE-3 public pipeline in Fabric; mapping doc "Databricks concept → Fabric concept".

### DE-4 Streaming

**Public: Wikimedia EventStreams (recent changes, server-sent events) → Kafka → Spark Structured Streaming**
- [spike] SSE anatomy: reconnect with `Last-Event-ID`; [feature] producer with keys, acks, idempotence; [feature] consumer group; [drill] partitions vs ordering; [feature] replay from an earlier offset to rebuild a table.
- [feature] Structured Streaming with event-time windows and watermarks; ⚡ [bug] "counts for 10:00 change after we published them".
- ⚡ [incident] "consumer lag grows without limit".
- ⚡ [incident] "one bad event stops the pipeline".
- ⚡ [bug] "duplicates after a restart".
- [feature] schema registry with Avro, a compatible and an incompatible change (⚡ the incompatible one breaks consumers); [feature] a compacted topic for page metadata; [feature] session windows per editor; [feature] top-k most edited pages per 5 minutes with a heap (DSA tie-in); [spike] Flink vs Spark Structured Streaming ADR.
- [feature] alerting on lag and freshness; [drill] on-call runbook drill.

**Public part 2 — Streaming transaction monitor (roadmap p12 portfolio project 5):** a realistic card/real-estate payment event generator (configurable rates, merchants, geos, planted fraud patterns) → Kafka → Structured Streaming rules (velocity, impossible travel, amount spikes), stateful per-card windows, alerts to a topic and a live dashboard, exactly-once to the alerts table; ⚡ [incident] "alert volume dropped to zero at 14:05" (the generator's clock skew pushes events behind the watermark).

**Ping: Debezium CDC from local PostgreSQL → Kafka → near-real-time silver**
- [feature] logical replication setup (`wal_level=logical`), Kafka Connect with the Debezium connector, topic per table; ⚡ [incident] "Postgres disk filling up"; ⚡ [bug] "updates arrive before inserts for the same key in silver".

★ **Mastery gate DE-4:** "Rebuild a corrupted downstream table from Kafka history while live traffic continues, with no duplicates and a verified count match."

**Field reports:** Confluent, "Exactly-Once Semantics Are Possible: Here's How Kafka Does It"; Debezium PostgreSQL connector docs, the section on replication slots and WAL disk usage.

### DE-SD and DE-INT (CLAUDE.md): design drills from my own fleet; two mock interviews; STAR stories from my postmortems; resume built from FLEET.md and ticket metrics (honest: personal projects, not job titles).

**Promotion:** `PROMO DE` for L3 after DE-2 ships; for L4 after the DE-3 or DE-4 gate.

---

## STAGE 2 — Backend from first principles

From Stage 2, teammate reviews are 2 per sprint, and I write subtasks myself (L3).

### BE-1 Marketplace orders and payments platform (public, core — a standalone product built from an empty repo)
Business: a UAE online marketplace (sellers, buyers, catalog, cart, orders, payments, refunds, notifications). Its own OLTP database, its own users, its own traffic (a load generator plays the customers). Not a layer over earlier work.
Stack: FastAPI, PostgreSQL, Redis, a worker queue, Stripe in test mode (real payment API, test keys, real webhooks), Keycloak for identity, nginx, Docker Compose, then a cloud host with CI/CD.
- Epic A HTTP and networking from zero: ★ [feature] a tiny HTTP/1.1 server with raw sockets (request line, headers, Content-Length, keep-alive, concurrent clients) — then switch to FastAPI knowing what it hides; [spike] capture the TCP handshake, TLS handshake, and an HTTP request with tcpdump/Wireshark and annotate every packet; [feature] a minimal DNS resolver over UDP (query root → TLD → authoritative, RFC 1035 parsing); [spike] TCP vs UDP; Nagle and keep-alive effects on latency.
- Epic B API design: [design] OLTP schema for catalog, inventory, carts, orders, payments (ER diagram, 3NF, constraints, indexes); resources, status codes, cursor pagination, filtering, RFC 9457 errors, versioning; [feature] Pydantic validation; [feature] password hashing, JWT access + refresh; ⚡ [bug] "users get logged out at random"; [security] [Persona: Sara] OWASP review of every endpoint with a teammate PR to review; [feature] TDD for the pricing and discount rules.
- Epic C Layers: controllers, services, repositories; SQLAlchemy + Alembic migrations; dependency injection; strategy pattern for shipping and tax rules; ⚡ [incident] "order list p95 = 4 s".
- Epic D Data access: connection pooling (and PgBouncer A); ⚡ [incident] "503s under load"; read replica for the catalog with read-your-writes handling.
- Epic E Caching: catalog cache-aside with TTL and invalidation on price change; ⚡ [incident] "DB CPU 100% every hour on the hour"; [spike] CDN for product images (A).
- Epic F Async work: order confirmation emails and invoice PDFs in a worker; idempotency keys on POST /orders and POST /payments; ⚡ [bug] "a customer was charged twice"; retries with backoff and jitter; circuit breaker around the payment provider (chaos: mock adds 5 s latency); rate limiting per API key (token bucket, then sliding window); [design] RabbitMQ vs Kafka vs Redis Streams ADR.
- Epic G Operability: graceful shutdown on SIGTERM (⚡ [incident] "errors during every deploy"); liveness vs readiness; OpenTelemetry traces across API → worker → payment provider; Prometheus metrics, Grafana dashboards; structured logs with request IDs; dependency and image scanning.
- Epic H Scale: two API instances behind nginx (L7 load balancing, TLS termination); [perf] k6 load test of the checkout journey with p50/p95/p99; a gRPC internal inventory service; server-sent events for order status; [spike] HTTP/2 vs HTTP/1.1; GraphQL for the catalog read model (A).
- Epic I Identity and security (I work at an identity company; this must be strong): OAuth 2.0 authorization code + PKCE login via Keycloak; client credentials for the worker → API calls with scopes; OIDC ID-token validation (JWKS, issuer, audience, expiry); seller vs buyer vs admin RBAC plus an ABAC ownership rule; ⚡ [security] "a buyer can see another buyer's order" (find and fix); [spike] SAML SSO vs OIDC; [design] STRIDE threat model.
- Epic J Distributed systems: ⚡ [bug] "paid orders sometimes never get a confirmation email"; [feature] transactional outbox + relay; [feature] shard the cart cache across 3 Redis nodes with consistent hashing, add a node, measure key movement; [design] CAP/PACELC note for inventory vs catalog; [spike] Raft leader election with a 3-node etcd (kill the leader); [feature] an LRU cache (hash map + doubly linked list, DSA tie-in).
- Epic K Payments and inventory (the hard business core): Stripe test-mode checkout, webhook signature verification, webhook retries and out-of-order events; ⚡ [incident] "we sold 12 units of an item with 10 in stock" (overselling race; fix with row locks / atomic conditional update / reservation with expiry, and prove it with a concurrent load test); refunds and partial refunds as a state machine; [feature] daily reconciliation of orders vs payment-provider records (Omar).
- Epic L Search and notifications: PostgreSQL full-text search with ranking and trigram fuzzy match; [spike] OpenSearch vs Postgres FTS (A); notification service with user preferences and a digest job.
- Ships to the cloud with Terraform + GitHub Actions; joins FLEET.md with SLOs; chaos incidents from then on.
- Ping variant (secondary, ask): a "PS insights" API over the gold layer and churn scores, reusing Epics B–G.

### SYS-1 Storage and systems from first principles (a component the marketplace really uses)
Business: the marketplace needs a durable, ordered event log for order events. You build it yourself as a small service, put it behind the outbox relay for one event type, and benchmark it against Redis Streams. This is where OS, networking, and DBMS internals become code.
- [feature] append-only segment files with a length-prefixed, checksummed record format; `fsync` policy (every write vs batched) with a durability vs throughput benchmark; [spike] page cache, `O_DIRECT` (A), and why `fsync` is slow.
- [feature] an offset index (sparse index + binary search) and segment rollover; [feature] crash recovery: truncate a torn write found by checksum; ⚡ [bug] "events after a power cut are corrupted" (chaos: `kill -9` mid-write, then verify recovery).
- [feature] a TCP server for the log with a framed binary protocol; first one thread per connection, then an event loop with `selectors` (epoll/kqueue) — explain how this is what asyncio does underneath; backpressure when consumers are slow.
- [feature] consumer offsets stored durably; retention and compaction (keep the latest value per key: the LSM idea); [spike] memory-mapped index files with `mmap`.
- [feature] a key-value mode: an in-memory memtable + sorted string tables on disk + a write-ahead log (a mini LSM tree); compare with a B-tree (SQLite) for reads vs writes; [spike] buffer pool and page replacement (A).
- [perf] benchmark vs Redis Streams: throughput, p99 latency, disk usage; flame graph of the hot path; write the ADR "why production would still use Kafka/Redis, and what building this taught us".

### BE-2 Offer management system (Django rebuild of my 2020 VBA app; standalone product)
- Vertical slices: login and roles → quotes → technical/commercial offer to API spec → approval workflow (state machine) → email → PDF generation → audit log.
- ⚡ [bug] [Persona: Priya] "two approvers approved the same offer at once and it got two numbers".
- [chore] Zero-downtime migration (expand → migrate → contract) for a renamed column.
- Deploy to the cloud with CI/CD and Terraform; rollback drill.
- [legacy] import offers from an old Excel export (messy data) with a dry-run mode.
- [feature] the approval workflow as a saga with compensating steps; [security] Django CSRF/XSS protections verified with tests; [feature] PII handling: data retention job and a "delete my data" request (GDPR); [feature] encryption at rest for one sensitive field; [feature] optimistic locking with a version column on offers; [design] SOLID and patterns review of the service layer (repository, strategy for pricing rules).

### DOG-2: squad API over DOG-1 with auth and a webhook endpoint.

### BE-SD Backend system design (drills from my own systems first, then the classic set)
Each drill: requirements, scale estimate, API, data model, architecture diagram, deep dive on the hardest part, failure modes, what changes at 10x. Set: rate limiter, distributed job queue, URL shortener, notification system, payment system (idempotency, ledger, reconciliation), ticket/seat booking (concurrency), chat, news feed, distributed cache, typeahead, file storage service, metrics/monitoring system. BE-INT mocks draw from this set.

★ **Mastery gate BE:** "At 200 rps, p99 latency jumps from 150 ms to 3 s every few minutes." Find it with traces and metrics only, fix, and write the RFC for the long-term fix.

**Field reports:** Google SRE book chapter "Handling Overload"; Slack's public write-up of the 4 Jan 2021 outage; Stripe idempotency post (re-read with Epic F).

---

## STAGE 3 — Data science and ML with MLOps (Applied AI course is the coverage map)

CLAUDE.md Stage 3 rules apply in full: case-study method, from-scratch rule (NumPy first, then library), every Applied AI lesson mapped to a ticket, stakeholder report per project. Extra resources from "DSML Learning Resources — Final List" (Brunton probability/statistics, StatQuest, Practical Statistics for Data Scientists, Python for Data Analysis ch. 4–11, numpy-100, pandas_exercises) are registered as gap-fill resources only (CLAUDE.md step 4e); first ticket of Stage 3 adds them to the Resources tab with my approval.

### ML-0 Algorithm and statistics lab (Amazon Fine Food Reviews)
- [feature] Vectorize k-NN distances with NumPy broadcasting (first NumPy ticket; loop version first, then vectorized, with timing).
- [feature] EDA report with data-quality findings (duplicates in this dataset are real: same review text across product variants).
- [feature] Per algorithm (k-NN, NB, LR, linear SVM, trees, RF, GBDT): NumPy from scratch → scikit-learn → compare in one report table (metric, train time, predict time).
- [feature] Statistics lab from scratch (NumPy, then SciPy/statsmodels), one small ticket each, all on review/product data: descriptive stats and distributions; CLT by simulation; analytic and bootstrap CIs; z and t tests (one-sample, two-sample, paired, Welch); chi-square (independence, goodness of fit) and Fisher's exact; one-way ANOVA + post-hoc; Mann-Whitney, Wilcoxon, Kruskal-Wallis, KS; permutation test; Pearson/Spearman/Kendall.
- [feature] Math JIT inside the algorithm tickets: linear regression via normal equation (matrix ops) and gradient descent (derivatives); logistic regression gradient derived by hand (chain rule, cross-entropy, MLE); naive Bayes as MLE/MAP with Laplace smoothing; SVM hinge loss + kernels (Lagrange dual at concept level); trees with entropy/information gain; PCA from eigen/SVD.
- [feature] Bag-of-words, n-grams, TF-IDF features from scratch; AdaBoost from scratch alongside gradient boosting; bias-variance with learning and validation curves.
- ⚡ [bug] [Persona: Leila] "your test accuracy is 96%, that is too good".
- [feature] PCA from SVD; t-SNE plot with an honest caption of what t-SNE can and cannot show.

### ML-1 Classification in production (Ping: churn; public: Case Study 2 cancer diagnosis + Case 5)
- [design] problem framing: prediction time, label definition, the decision the score drives, the metric that matches cost.
- [feature] time-based split; ⚡ [bug] "AUC 0.95 offline, useless in production"; [feature] point-in-time feature table (ties to Data modeling: feature tables).
- [feature] class imbalance strategies compared; calibration (reliability plot, Brier score); SHAP explanations; stacking.
- [feature] Ping: survival analysis of time-to-churn: Kaplan-Meier by segment, log-rank test, Cox proportional hazards (check the assumption), discrete-time hazard model; compare with the classifier's framing.
- [feature] Ping: customer health score: design, then validate against churn outcomes; [feature] encoding strategies incl. target encoding with leakage-safe folds; missing-value strategies; feature selection (filter, wrapper, embedded, permutation importance); SMOTE vs class weights vs threshold moving; threshold choice from a cost matrix; fairness check across segments; partial dependence plots.
- [docs] stakeholder report for a non-technical reader.

### ML-2 Propensity, similarity, experimentation (Ping: propensity; public: Case 1 Quora + Cases 6, 7 + A/B test)
- [feature] XGBoost/LightGBM in depth; hyperparameter search with a fixed budget.
- [feature] A/B test end to end: design, power and sample size, analysis, readout; ⚡ [bug] [Persona: Priya] "the test is significant on day 3, ship it!"; [drill] multiple-testing correction; ⚡ [bug] "control group has 52% of users, not 50%".
- [feature] experimentation depth: ratio metrics with the delta method; CUPED variance reduction; Bayesian A/B readout; multi-armed bandit (Thompson sampling) simulation vs fixed A/B; sequential testing rule.
- [feature] causal inference (Ping, CX): confounding and Simpson's paradox ⚡ planted in NPS/CSAT survey data ("CSAT went up in every region but down overall"); difference-in-differences for a support process change; propensity score matching/weighting; uplift modeling (T-, S-, X-learner) with Qini curves for a retention campaign; [spike] synthetic control, IV, regression discontinuity (A).
- [feature] NPS/CSAT analytics with confidence intervals and driver analysis.
- [feature] CatBoost vs XGBoost vs LightGBM on categorical-heavy data; Optuna tuning with early stopping; word2vec/GloVe features and fuzzy matching with edit distance (DP, DSA tie-in) for Quora pairs.
- DOG-3 here.

### ML-3 Regression, forecasting, MLOps (Ping: productionize churn; public: Case 4 NYC taxi demand)
- [feature] baseline forecasts first (naive, seasonal naive) — models must beat them.
- [feature] MLflow tracking + registry; training pipeline as a package with tests; model card.
- [feature] batch scoring job back to PostgreSQL; [feature] online serving container (FastAPI) with input validation.
- ⚡ [incident] "predictions are flat since last week"; [feature] drift monitoring (PSI or KS) with an alert; retraining trigger with a guard (do not auto-promote a worse model).
- ML tests: data validation, performance threshold, slice tests, regression tests in CI.
- [feature] classical time series: decomposition, ADF stationarity test, differencing, ACF/PACF, ARIMA/SARIMA, ETS, Prophet, then gradient boosting with lags; rolling-origin backtesting; quantile regression for prediction intervals; regression inference (coefficients, standard errors, residual diagnostics, VIF); elastic net; [spike] hierarchical forecasting (A).
- [feature] GPU/CPU utilization monitoring for training and the model service; DVC for data versions; a Feast feature store (offline/online) with a consistency check; shadow deployment then canary for the new model (champion/challenger); warm vs cold start latency of the model service.

### ML-4 Unsupervised and recommenders (Ping: segmentation; public: Case 9 Netflix + 3, 8, ch. 56 design)
- [feature] RFM segmentation, then GMM (EM) vs k-means vs HDBSCAN; UMAP vs t-SNE for the segment map; anomaly detection on account behavior (z-score/IQR, isolation forest, LOF) — Ping.
- [feature] CLV with BG/NBD + Gamma-Gamma vs a heuristic baseline (Olist customers; Ping accounts); market-basket association rules (Apriori: support, confidence, lift) on Olist order items.
- [feature] learning to rank (pairwise with LightGBM ranker) for recommendations; [spike] two-tower retrieval + ranking architecture (A); graph features and link prediction (Case 3).
- k-means/hierarchical/DBSCAN with stability checks; matrix factorization from scratch (ALS or SGD) then a library; offline evaluation (recall@k, NDCG) vs a popularity baseline; ⚡ [bug] "recommender evaluation looks amazing"; music recommender design drill.

### ML-5 Deep learning and NLP (Ping: ticket classification; public: Cases 11, 10, 12, 13, 14 + Module 8)
- ★ [feature] neural network from scratch in NumPy with backprop, gradient check passes.
- [feature] PyTorch training loop with validation, early stopping, checkpoints, seeds; CNN; LSTM; fine-tune a small transformer.
- [feature] training experiments, one variable each: init (Xavier/He) and vanishing gradients; SGD vs momentum vs RMSProp vs Adam vs AdamW; LR schedules with warmup; dropout, weight decay, augmentation; batch norm vs layer norm; focal loss for imbalance.
- [feature] ResNet transfer learning (Case 10 data); seq2seq with attention; an autoencoder for anomaly detection; a small GAN; pretrained object detection and segmentation; OpenCV preprocessing; one Keras version of an earlier model.
- [feature] Ping: ticket topic modeling with LDA vs BERTopic; sentiment; SLA-breach prediction.
- ⚡ [bug] "loss is NaN after epoch 3"; ⚡ [bug] "validation accuracy higher than training".
- One small ticket per Module 8 topic (CLAUDE.md).

### ML-6 RL and ML at scale: Q-learning from scratch → Gymnasium; Spark MLlib pipeline on a large dataset.

★ **Mastery gate ML:** [Persona: Leila] "The churn model's precision dropped from 0.62 to 0.41 this month. Is the model broken, the data broken, or the world changed?" Deliver a diagnosis with evidence and a decision memo.

**Field reports:** Google, "Rules of Machine Learning" (Zinkevich) — a few rules per project; Sculley et al., "Hidden Technical Debt in Machine Learning Systems" (NeurIPS 2015); Uber engineering, Michelangelo platform post.

---

## STAGE 4 — AI engineering (LLMs, RAG, agents)

### AI-1 Text-to-SQL chatbot with charts (Ping: Ollama local; public: Olist + hosted API + simple UI)
- [spike] LLM API anatomy: tokens, context window, streaming, rate limits, pricing, errors (integration anatomy).
- [feature] eval set first: 30 real questions with gold SQL and expected answers; [feature] a harness that scores execution accuracy, tokens, latency, TTFT, cost.
- [feature] schema-aware prompting; structured output validated against a JSON schema; read-only DB role.
- ⚡ [security] [Persona: Sara] "a user got the bot to run `DELETE`".
- ⚡ [incident] "cost alert: 10x tokens today".
- Prompt v1 vs v2 comparison report; eval gate in CI; sampling settings (temperature, top-p) experiment; prompt and semantic caching; model routing by difficulty; LLM-as-judge calibrated against 30 human labels.

### AI-2 RAG with pgvector (public: SEC 10-K or UAE regulations)
- [feature] ingestion with chunking strategies compared; embeddings; HNSW index; hybrid search (BM25 + vector); reranking; citations.
- [feature] retrieval evals (recall@k on a labeled set) and answer evals (faithfulness); [perf] flat vs IVF vs HNSW: recall vs latency vs build time; query rewriting; embedding model comparison.
- ⚡ [bug] "answers cite the wrong year's filing"; ⚡ [security] prompt injection inside a document (Simon Willison's prompt injection writing as the field report).

### AI-3 Agents (Ping: renewal-risk agent with MCP server; public: multi-agent research)
- [feature] my own MCP server for PostgreSQL with least-privilege tools; human approval step before any write or send; ReAct-style loop, memory, step and budget limits; traces of every prompt, tool call, token count, and cost; Ping: ticket summarization and auto-triage with evals.
- ⚡ [incident] "agent looped for 40 steps and spent $X"; [feature] guardrails and output validation; traces of every tool call.
- DOG-4 here.

### AI-4 From scratch
- Adds: SFT with LoRA and QLoRA on a small model, compared with prompting and RAG on the same eval set; [spike] RLHF vs DPO, distillation, multimodal models (A).
- ★ BPE tokenizer → transformer block → GPT-style model on a small corpus → LoRA fine-tune → my own RAG library and agent loop with no frameworks → reproduce one Umar Jamil implementation, change one thing (KV cache, GQA, RoPE, RMSNorm), benchmark, explain.

★ **Mastery gate AI:** "Quality on the eval set dropped 8 points after a 'small' prompt change, and p95 latency went up 40%." Find both causes from eval diffs and traces; fix; add regression tests.

**Field reports:** Anthropic engineering, "Building effective agents"; Simon Willison's writing on prompt injection; Hamel Husain on LLM evals.

---

## STAGE 5 — Full-stack + DevOps

Build rule: vertical slices (migration → endpoint + tests → component + tests → integration test → deploy).

### FS-1 Ticketing and project-tracking product (public, core — a standalone full-stack product = DOG-5)
Business: a Jira-like tracker for small teams (workspaces, projects, tickets, boards, comments, mentions, attachments, notifications, audit history). It replaces Backlog.md for my own squad, so it has a real user from day one.
Stack: React + TypeScript + Redux Toolkit + RTK Query on the front end; a TypeScript backend (Node.js, NestJS, Prisma, PostgreSQL) so I own a second backend stack; Keycloak (OIDC); S3-compatible object storage (MinIO) for attachments.
- Foundations JIT through the first slices: semantic HTML, flexbox/grid, Tailwind; JavaScript closures, `this`, prototypes, modules, the event loop (browser and Node), promises, async/await; TypeScript strict mode, unions, generics, narrowing, utility types.
- Redux in depth: [feature] store, slices, reducers, actions, immutability (Immer), middleware, thunks; normalized entity state (`createEntityAdapter`); memoized selectors (reselect); RTK Query caching, tag invalidation, polling, optimistic updates with rollback; Redux DevTools; [design] ADR: what belongs in Redux vs server cache vs local state vs URL state (Zustand and TanStack Query compared, A).
- Backend in TypeScript: NestJS modules, controllers, providers, guards, interceptors, DTO validation; Prisma schema and migrations; ⚡ [bug] "ticket numbers collide in busy workspaces" (sequence per workspace under concurrency); background jobs (BullMQ); WebSocket gateway for live board updates.
- [feature] OIDC + PKCE login; token storage decision (security ADR); CORS and CSP; ⚡ [security] [Persona: Sara] "opening one ticket made my browser run a script."
- [feature] resumable chunked attachment uploads with presigned URLs; rich-text comments with mentions; zod-validated forms; search autocomplete with a trie (DSA tie-in); keyboard shortcuts.
- Slices: auth → workspaces and roles → ticket list with server pagination, filters in the URL → detail → create/edit → comments → board view with drag and drop → live updates → notifications → audit history.
- ⚡ [bug] "the list shows another filter's results"; ⚡ [bug] "screen reader users can't use the board"; ⚡ [incident] "the board freezes with 2,000 tickets" (list virtualization, memoization, profiler); [perf] Core Web Vitals budget, bundle splitting; Storybook component library with a small design system; React Testing Library + Playwright E2E in CI; i18n and micro-frontends (A).
- DOG-5: migrate every Backlog.md ticket into the product with a verified zero-loss ETL, then switch over.
- Ping variant (secondary, ask): an account health portal over the BE-1 Ping API.

### FS-2 Real-time team chat on Kubernetes (standalone product)
Business: Slack-like channels, DMs, threads, presence, typing indicators, read receipts, file sharing, search, for the tracker's workspaces.
- WebSocket service with presence and reconnect with backoff; message ordering and delivery guarantees (client IDs, server sequence numbers, at-least-once with dedup); ⚡ [incident] "messages lost when we scaled to 3 pods" (fan-out across instances with Redis pub/sub or NATS); offline sync on reconnect; message search.
- [feature] Kubernetes objects one by one as needed: Deployment, Service, Ingress (with WebSocket support), ConfigMap, Secret, requests/limits, probes, HPA, a StatefulSet (W), namespaces; Helm chart; Argo CD GitOps; Docker multi-stage, non-root images; [chore] move P0's cron job into a Kubernetes CronJob.
- ⚡ [incident] "pods restart in a loop"; ⚡ [incident] "HPA flapping"; ⚡ [incident] "every deploy disconnects everyone" (connection draining, graceful shutdown for sockets); SLOs with error budgets and symptom-based alerts; blue-green and canary deploys.
- [spike] collaborative editing for ticket descriptions: CRDTs vs operational transforms (A, with a tiny Yjs demo).

### FS-3 React UIs for AI-1 and AI-3 in Next.js (SSR vs SSG vs server components ADR; streaming tokens, cancel, error states, server actions).

### FS-4 Full-stack capstones (standalone products)
- **Small-business ERP (Next.js full-stack, TypeScript end to end):** multi-tenant (tenant isolation tested), customers, products, inventory with stock movements, purchase and sales orders, invoices with PDF and tax rules, payments, role-based access, reporting dashboards, CSV import/export, audit log. Vertical slices, deployed, monitored.
- **Video calling app (WebRTC):** signaling server over WebSockets, STUN/TURN (coturn), 1:1 then small-group calls with an SFU (A: mediasoup/LiveKit), screen share, network-quality handling; ⚡ [incident] "calls fail on corporate Wi-Fi" (NAT traversal, TURN fallback).

### FS-SD Frontend system design (drills, then FS-INT mocks)
Each drill: requirements, component tree, state model (server cache vs Redux vs local vs URL), API contract, rendering strategy (CSR/SSR/SSG/ISR), performance, accessibility, offline and error states, testing. Set: news feed with infinite scroll, typeahead, real-time dashboard, chat client, e-commerce product page and checkout, collaborative editor, kanban board, file uploader (resumable), design system/component library, image gallery/carousel, offline-first PWA, multi-step form wizard.

### FS-INT Interview readiness: frontend system design mocks from FS-SD, a full-stack design mock (the tracker or the ERP), React/Redux/TypeScript and JavaScript event-loop questions.

★ **Mastery gate FS:** "Ship a feature end to end in one sprint from a vague PM request, behind a feature flag, with a canary rollout and a rollback plan you actually test."

**Field reports:** Discord engineering on how it stores messages; Kubernetes docs on liveness/readiness/startup probes.

---

## STAGE 6 — AI infrastructure, inference, performance (right after Stage 5)

Hardware: Apple Silicon or any laptop for llama.cpp; rented hourly GPUs for CUDA, vLLM, TensorRT. First ticket of the stage: [chore] GPU budget and a "stop the instance" checklist.

### INF-1 Performance engineering (on BE-1, AI-1, DOG-6)
- [perf] the 10-step performance loop on a real endpoint; flame graphs (py-spy, perf); latency percentiles with k6/Locust; ⚡ [incident] "p99 regressed 3x after a dependency upgrade"; field report after the incident is closed.

### INF-2·0 C++ foundation (before CUDA)
- [feature] a multithreaded log aggregator in C++: CMake build, RAII, references vs pointers, `unique_ptr`/`shared_ptr`, STL containers and algorithms, move semantics (measure copy vs move), a class template; threads, mutexes, condition variables, atomics; ⚡ [bug] a data race found with ThreadSanitizer, and a leak found with AddressSanitizer; [feature] expose a hot function to Python with pybind11 and benchmark vs pure Python and NumPy; [spike] CPU caches: row-major vs column-major traversal timing.
### INF-2 GPU and CUDA
- [spike] GPU model: warps, blocks, memory hierarchy; [feature] kernels: vector add → naive matmul → tiled matmul (shared memory) → reduction → softmax; each benchmarked vs PyTorch with correct timing (warm-up, sync, repeats); Nsight Compute: occupancy and memory throughput; [feature] a Triton kernel vs PyTorch.
- [feature] histogram with atomics and with shared-memory privatization; 2D convolution; coalesced vs strided access benchmark; bank conflicts; PCIe transfer timing with pageable vs pinned memory; CUDA streams to overlap copy and compute; CUDA events for timing; a CUDA graph for a sequence of small kernels (explain the launch-overhead win); a fused softmax or layernorm in Triton; a FlashAttention-style tiled attention kernel in Triton (W).
- ⚡ [bug] "my kernel is 2x faster!".

### INF-3 PyTorch performance (AI-4 model)
- Adds: `inference_mode`, pinned memory + `non_blocking` copies, DataLoader workers, CUDA graphs in PyTorch, BF16 vs FP16 and Tensor Core use, PyTorch profiler + Nsight Systems timeline.
- profiler traces; `torch.compile`; mixed precision; ⚡ [incident] "GPU utilization is 30% during training".

### INF-4 LLM serving
- [drill] KV cache memory math by hand for a given model, sequence length, batch size; check against the server's numbers.
- vLLM vs llama.cpp vs TensorRT-LLM benchmark: TTFT, inter-token latency, tokens/s, p95/p99 under concurrency, GPU memory, cost per 1M tokens.
- Quantization (INT8/INT4, AWQ/GPTQ) with a quality check on my AI-1 eval set — not only speed.
- ⚡ [incident] "OOM at long context under load"; prefix caching hit rate experiment; speculative decoding experiment.
- Epic T TensorRT: export to ONNX, build FP16, FP8 (if the GPU supports it), and INT8 (calibrated) engines, layer fusion inspection, timing cache, multi-stream execution; baseline → optimized → profiled → re-benchmarked.
- Epic P Parallelism: [spike] tensor vs pipeline vs data vs expert vs context parallelism; [perf] one 2-GPU tensor-parallel vLLM run vs 1 GPU (rented); SGLang vs vLLM comparison; chunked prefill experiment; [spike] MoE and state-space models (Mamba) serving implications (A).
- [feature] serve through vLLM's OpenAI-compatible API and point the AI-1 app at it with zero code change.
- Ping variant: optimize my local chatbot model on my laptop.

### INF-5 Capstone: production inference lab
- API → service → vLLM → load generator → metrics → Kubernetes GPU autoscaling. Optimization sweep: batch size, concurrency, context length, quantization, prefix caching, CUDA graphs. Comparison chain: naive PyTorch → optimized PyTorch → vLLM → quantized vLLM → TensorRT(-LLM). Publish the repo with architecture, methodology, baseline, experiments, graphs, profiler screenshots, bottleneck analysis, results, cost analysis, and lessons learned (roadmap p35).

★ **Mastery gate INF:** "TTFT p95 doubles above 24 concurrent users while tokens/s looks fine. Explain from scheduler and KV-cache metrics, fix, and prove it with a before/after sweep."

**Field reports:** vLLM team, the PagedAttention announcement blog (2023); Anyscale, the continuous batching post (2023); Horace He, "Making Deep Learning Go Brrrr From First Principles"; Simon Boehm, "How to Optimize a CUDA Matmul Kernel for cuBLAS-like Performance".

After the core INF projects: the CLAUDE.md optional projects, deeper benchmarks, and open-source contribution tickets (good-first-issue in vLLM or llama.cpp → a real upstream PR reviewed by real maintainers: the closest thing to RDS's "real users").
