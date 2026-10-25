# COVERAGE MAP (the completeness contract)

This file lists every concept I must own to be a solid engineer across my target domains. Each concept has a depth target and a home: the project or catalog epic whose ticket teaches it.

How it works with the JIT rule:
- Nothing here is taught on its own. Each concept is taught when its home ticket needs it, to the depth its tag says. The map makes sure every concept HAS a home, so nothing is skipped.
- At sprint planning, the mentor checks the map rows for the current project and makes sure the planned tickets cover them.
- At each stage audit (CLAUDE.md GATES), every row for that stage must be covered by a Done ticket at its depth. Any uncovered row gets a ticket before the gate passes. Mark coverage in the Concept Log (new rows, ticket ID in the Notes).
- If a real ticket needs a concept that is not listed here, add the row. Do not remove rows without asking me.

Depth tags:
- **[S] Solid:** I build it, debug it under pressure, explain the trade-offs, and answer interview questions on it with no notes. Usually used in 2+ tickets.
- **[W] Working:** I used it correctly in a shipped ticket and can explain what it does and why it was chosen.
- **[A] Aware:** one spike or ADR: what it is, when to choose it, and why it was or was not chosen here. Enough to speak about it in a design review or interview.

Homes use catalog IDs from TICKET_CATALOG.md (for example `P0-17`, `DE-2·A` = DE-2 epic A).

---

## 1. Python engineering

**Core language and the object model**
- [S] Names, objects, references, mutability, identity vs equality, copying (shallow vs deep) — P0-09, P0-24 (mutable default bug), DE-1·H
- [S] Functions, scope (LEGB), closures, `*args`/`**kwargs`, keyword-only args — P0-19, DE-1·H
- [S] Comprehensions and functional tools (map, filter, `functools`, `itertools`) — baseline, extended in DE-1·H
- [S] Classes, dataclasses, `__init__`/`__repr__`/`__eq__`, properties, inheritance vs composition — P0-09, BE-1·C
- [W] Dunder methods and the data model (`__iter__`, `__len__`, `__getitem__`, `__enter__`/`__exit__`, `__call__`) — DE-1·H
- [W] Protocols and abstract base classes (structural vs nominal typing) — BE-1·C
- [S] Exceptions: raise, catch, custom hierarchy, chaining (`raise ... from`), `finally`, never swallowing — P0-11, P0-24
- [S] Iterators and generators, `yield`, lazy pipelines, `itertools` chains — DE-1·H (lazy large-file parse)
- [S] Context managers (`with`, `contextlib.contextmanager`) — DE-1·H (transaction/timer context)
- [S] Decorators (with `functools.wraps`, with arguments), higher-order functions — DE-1·H (retry/timing decorator replaces P0-22 code)
- [W] Introspection and metaprogramming (`getattr`, `inspect`, class decorators, descriptors; metaclasses A) — BE-1·C (plugin registry)
- [W] Memory model: reference counting, garbage collection, `__slots__`, `tracemalloc` — DE-1·H
- [S] Type hints, generics, `TypedDict`, `Protocol`, mypy in CI — DE-1·H, every repo after
- [S] Modules, packages, imports, `__main__`, relative vs absolute imports — P0-08
- [S] Packaging: `pyproject.toml`, uv, lockfiles, entry points, building a wheel, semantic versioning — P0-04, DE-1·H
- [S] Files and paths (`pathlib`), encodings, JSON, CSV — P0-07, DE-1
- [W] Serialization formats from Python (JSON, Parquet via pyarrow, Avro, Protobuf) — DE-1·B, DE-4
- [S] Logging (levels, handlers, structured logs), configuration via environment — P0-20, P0-21
- [S] CLI building (argparse; typer A) — P0-19

**Concurrency and performance**
- [S] Concurrency vs parallelism; CPU-bound vs I/O-bound — DE-1·H
- [S] The GIL in practice (what it blocks, what it does not, free-threaded Python A) — DE-1·H
- [S] `threading`, locks, race conditions, queues, thread-safe design — DE-1·H (race-condition bug)
- [S] `multiprocessing`, process pools, shared state and managers, pickling limits — DE-1·H
- [S] `concurrent.futures` (ThreadPoolExecutor, ProcessPoolExecutor) — DE-1·H
- [S] `asyncio`: event loop, coroutines, tasks, `gather`, semaphores for concurrency limits, timeouts, cancellation, async HTTP with `httpx.AsyncClient`, async context managers, never blocking the loop — DE-1·H, BE-1 (FastAPI async), INF-1 (sync-in-async incident)
- [S] Choosing sync vs threads vs processes vs asyncio for a real workload, defended with benchmarks — DE-1·H
- [S] Classic concurrency problems as tested code: producer–consumer, reader–writer, thread-safe rate limiter, dining philosophers, bounded async crawler — DE-1·H
- [S] Profiling: cProfile, line_profiler, py-spy, flame graphs, `tracemalloc` — DE-1·H, INF-1
- [W] Vectorization with NumPy instead of Python loops — ML-0

**Testing**
- [S] pytest: fixtures, parametrize, markers, temp paths, reading failures — P0-10 onward
- [S] Test doubles: monkeypatch, fakes, mocks (`unittest.mock`), when mocks lie — P0-12, BE-1
- [S] Unit vs integration vs end-to-end tests; test pyramid — P0-17, BE-1, FS-1
- [W] Property-based testing (`hypothesis`) — DE-1·H (parser invariants)
- [W] Test-driven development where it helps — BE-1·B
- [S] Coverage and what it does not tell you — P0-23

## 2. Software engineering craft
- [S] Git: commits, branches, PRs, rebase, merge vs rebase, conflicts, tags — P0-02 to P0-05, DE-1·G
- [W] Git deeper: cherry-pick, bisect (find a regression), reflog (recover lost work), stash — DE-1·G, INF-1
- [S] Code review: giving and receiving, severity, tone — every review ticket
- [S] Clean code: naming, small functions, single responsibility, removing duplication — every review
- [W] SOLID principles and design patterns: repository, dependency injection, strategy, factory, adapter, observer — BE-1·C, BE-2
- [S] Refactoring legacy code with characterization tests — legacy tickets each stage
- [S] ADRs and RFCs, technical writing — every project
- [S] Estimation and planning, breaking work into tickets — RDS model, from L3
- [W] Semantic versioning, CHANGELOGs, release notes — P0-25 onward
- [W] Dependency management and upgrades (pinning, vulnerability alerts) — fleet maintenance

## 3. SQL (from my baseline: CTEs, some window functions)
- [S] Query logic order (FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY) — DE-1·0
- [S] Join semantics: inner, left, full, cross, self, anti-join, semi-join; fan-out — DE-1·0, DE-2·A
- [S] NULL logic (three-valued logic, `COUNT(*)` vs `COUNT(col)`, `NOT IN` with NULLs, `COALESCE`) — DE-1·0
- [S] Aggregation and grain; `HAVING`; `FILTER` clause — DE-1·0
- [S] Set operations: `UNION`/`UNION ALL`/`INTERSECT`/`EXCEPT` — DE-1·0 (reconciliation)
- [S] `EXISTS` vs `IN` vs `JOIN`, with plans — DE-2·SQL
- [S] Window functions in depth: ranking, `LAG`/`LEAD`, running totals, frames (`ROWS` vs `RANGE`), `QUALIFY` (Snowflake/Databricks) — P0-18, DE-2·SQL
- [S] Recursive CTEs (hierarchies, date spines) — DE-2·SQL
- [S] `GROUPING SETS`, `ROLLUP`, `CUBE` (finance subtotals) — DE-2·SQL
- [S] Classic patterns: gaps and islands, sessionization, deduplication with `ROW_NUMBER`, top-N per group, pivot/unpivot, date spines, cohort retention — DE-2·SQL, DE-4
- [S] DDL and constraints: types, PK, FK, UNIQUE, CHECK, NOT NULL, defaults — P0-16, BE-2
- [S] DML: `INSERT ... ON CONFLICT`, `MERGE`, `UPDATE ... FROM`, `DELETE` safely — P0-17, DE-3
- [S] Views, materialized views, CTAS, temporary tables — DE-2·SQL
- [W] Functions, stored procedures, triggers (and why triggers are risky) — DE-2·SQL
- [S] Indexes: B-tree, composite (column order), covering, partial, expression; GIN, BRIN, hash (W) — DE-1·F
- [S] Reading query plans (`EXPLAIN ANALYZE`): scans, join algorithms (nested loop, hash, merge), estimates vs actuals — DE-1·F, DE-2·SQL
- [S] Partitioning and partition pruning — DE-1·D
- [S] Transactions and isolation levels in practice — DE-1·F
- [S] Timed SQL interview problems — standing practice from Stage 1

## 4. Database internals (roadmap p2d)
- [S] Pages, heap files, B-trees, how an index lookup works — DE-1·F
- [S] ACID; isolation levels (read committed, repeatable read, serializable) and anomalies (dirty read, non-repeatable read, phantom, write skew) — DE-1·F
- [S] Locks, deadlocks, MVCC (`xmin`/`xmax`), why readers do not block writers — DE-1·F
- [S] VACUUM, bloat, autovacuum — DE-1·F
- [S] WAL, checkpoints, crash recovery — DE-1·F
- [S] Replication (physical vs logical), replication slots, read replicas, lag — DE-4 (Debezium), BE-1·D
- [S] Connection pooling (application pools, PgBouncer A) — BE-1·D
- [W] Query execution and the planner, statistics, `ANALYZE` — DE-1·F
- [W] Backups, point-in-time recovery — DE-1·F (GitLab field report)
- [S] Building storage: append-only logs, checksummed records, segment files, sparse indexes, crash recovery from torn writes, compaction — SYS-1
- [S] LSM trees (memtable, SSTables, WAL, compaction) vs B-trees (SQLite), read vs write amplification — SYS-1, DE-1·F
- [A] Buffer pools and page replacement — SYS-1
- [W] Full-text search internals (inverted index, ranking, trigram) — BE-1·L
- [A] Column stores and vectorized execution — DE-2 (Snowflake), DE-3

## 5. Linux, OS, and the shell (roadmap p2a)
- [S] Terminal, paths, permissions, environment variables, PATH — P0-01, P0-20
- [S] Shell scripting: bash, pipes, redirection, exit codes, `set -euo pipefail`, grep, sed, awk, jq, xargs, find — DE-1·I
- [S] Kernel vs user space, system calls — DE-1·E
- [S] Processes vs threads, signals (SIGTERM, SIGKILL), process states — DE-1·E, BE-1·G
- [S] Scheduling, CPU usage, load average — DE-1·E
- [S] Virtual memory, paging, swap, OOM killer — DE-1·E
- [S] File systems, inodes, file descriptors, disk I/O, page cache — DE-1·E
- [S] Tools: ps, top/htop, vmstat, iostat, lsof, strace, ss, df, du, free, dmesg — DE-1·E
- [W] cron and systemd services — P0-25, DE-1·I
- [W] Containers under the hood: namespaces and cgroups (why Docker memory limits OOM-kill) — DE-1·E, DE-1·I
- [S] Durability and the OS: `fsync`, page cache, write ordering, `kill -9` vs power loss — SYS-1
- [S] I/O multiplexing: blocking vs non-blocking sockets, `select`/`epoll`/`kqueue`, how event loops (asyncio, Node) work underneath — SYS-1, FS-1
- [W] Memory-mapped files (`mmap`) — SYS-1
- [S] Sockets: TCP server and client from raw sockets, framing a binary protocol, backpressure — BE-1·A, SYS-1

## 6. Networking (roadmap p2b)
- [S] The full path: DNS → IP → TCP → TLS → HTTP → load balancer → app → DB — DE-1·A, BE-1·A
- [S] Packet capture with tcpdump/Wireshark: TCP handshake, TLS handshake, HTTP request annotated — BE-1·A
- [S] UDP vs TCP; a minimal DNS resolver over UDP — BE-1·A
- [W] Nagle's algorithm, keep-alive, and their latency effects — BE-1·A
- [W] NAT traversal: STUN, TURN, ICE — FS-4 (video calling)
- [S] TCP: handshake, retransmission, flow and congestion control, latency vs bandwidth — DE-1·A, BE-1·A
- [S] DNS resolution, records, caching, TTLs — DE-1·A
- [S] HTTP/1.1 (methods, status codes, headers, keep-alive), HTTPS and TLS (certificates, handshake) — P0-06, BE-1·A
- [W] HTTP/2 and HTTP/3 (QUIC) — BE-1·H
- [S] Reverse proxies and load balancers (L4 vs L7), nginx — BE-1·H
- [W] NAT, ports, firewalls, private networks (VPC/VNet) — DE-3·A
- [W] CORS, cookies, sessions — BE-1·B, FS-1
- [A] CDNs and edge caching — BE-1·E

## 7. Data structures and algorithms (roadmap p11)
Daily practice from Stage 1 (NeetCode patterns, Python, timed). Each pattern ALSO appears once in a real ticket:
- [S] Complexity (Big-O, amortized) — every perf ticket
- [S] Arrays, strings, hash maps/sets — DE-1 (dedupe)
- [S] Two pointers, sliding window — DE-4 (windowed counts)
- [S] Stacks, queues, deques — BE-1·F (worker queue)
- [S] Linked lists — BE-1 (LRU cache implementation)
- [S] Binary search — DE-1 (watermark/offset lookup)
- [S] Trees, BST, traversals — DE-2·SQL (hierarchy), FS-1
- [S] Heaps / priority queues, top-k — DE-4 (top-k edited pages)
- [S] Intervals (merge, overlap) — DE-2·B (SCD2 overlapping ranges)
- [S] Graphs: BFS, DFS, topological sort, cycle detection — DOG-1 (ticket dependency graph), Airflow DAG concepts
- [S] Union-find — DE-2·A (customer entity resolution)
- [W] Dijkstra / shortest paths — ML Case 3 (graph mining)
- [S] Tries — FS-1 (search autocomplete)
- [S] Dynamic programming (1D, 2D), edit distance — ML-2 (fuzzy matching in Quora pairs)
- [W] Backtracking, greedy — practice set
- [S] Writing clean, bug-free Python under time pressure — DE-INT, BE-INT

## 8. Data modeling
- [S] Conceptual, logical, physical models; ER diagrams — DE-2·A, BE-2
- [S] Normalization 1NF → 3NF, BCNF; when to denormalize — DE-2·A (normalize Olist raw first)
- [S] OLTP vs OLAP modeling — DE-2·A, BE-2
- [S] Grain statements, always first — DE-2·A
- [S] Fact types: transactional, periodic snapshot, accumulating snapshot — DE-2·A (Olist order lifecycle = accumulating snapshot)
- [S] Dimensions: conformed, role-playing, junk, degenerate, bridge tables (many-to-many), outriggers (W) — DE-2·A
- [S] Bus matrix — DE-2·A
- [S] SCD Type 0, 1, 2, 3, 4, 5, 6 — implement each by hand in SQL; 2 in dbt snapshots, PySpark, and Delta MERGE — DE-2·B, DE-3
- [S] Star vs snowflake schema — DE-2·A
- [W] Data Vault 2.0 (hubs, links, satellites) on two Olist entities — DE-2·A
- [W] One big table (OBT) vs star, with query cost comparison — DE-2·F (Snowflake)
- [S] Medallion layers (bronze/silver/gold) and what belongs in each — DE-2, DE-3
- [S] Lakehouse table design: partitioning, clustering, Z-order/liquid clustering, file sizes, compaction — DE-3
- [S] OLTP schema design, migrations (expand → migrate → contract) — BE-2
- [S] Feature tables and point-in-time correctness — ML-1
- [W] Semantic layer / metrics definitions (dbt metrics or MetricFlow A) — DE-2·C

## 9. Data engineering: batch, formats, and pipelines
- [S] Ingestion patterns: full, incremental (watermark with overlap), CDC, append vs upsert — DE-1
- [S] Idempotency, reruns, backfills, deduplication — P0-17, DE-1, DE-2·D
- [S] Late-arriving data and late-arriving dimensions — DE-2·C, DE-3·B
- [S] Schema evolution and drift handling — DE-1·C, DE-3·C
- [S] File formats: CSV, JSON, Parquet, Avro, ORC; row vs columnar; compression (snappy, zstd, gzip) — DE-3·0
- [S] Bulk loading (`COPY`), batching, memory caps — DE-1·B
- [S] API ingestion: auth, pagination, rate limits, retries — P0, DE-1 Ping
- [W] Table formats: Delta (S), Apache Iceberg and Hudi (A, comparison ADR) — DE-3·0
- [S] Data contracts — DE-2·E
- [W] Data catalog and lineage (Unity Catalog S, OpenLineage A) — DE-3·C, DE-2·C
- [W] Python dataframes: pandas (S), Polars (W), DuckDB (W) for local analytics — DE-1·B, DE-2
- [S] Roadmap p12 portfolio, all five shipped: Dubai real estate lakehouse (DE-3), UAE government open data pipeline (DE-1 public part 2), property feature pipeline (DE-3·F), multi-source warehouse (DE-2 public), streaming transaction monitor (DE-4 public part 2)

## 10. Orchestration and transformation
- [S] Airflow: DAGs, operators, sensors, scheduling, retries, SLAs, XCom, backfills, catchup, idempotent tasks keyed on logical date, pools — DE-2·D
- [W] Dynamic task mapping, task groups, deferrable operators — DE-2·D
- [S] dbt: sources, refs, staging/intermediate/marts, materializations, incremental models, snapshots, tests (generic, singular, custom), macros, Jinja, seeds, docs, lineage, exposures (W) — DE-2·C
- [A] Dagster / Prefect vs Airflow (ADR) — DE-2·D
- [W] ADF pipelines, triggers, integration runtime, metadata-driven ingestion — DE-3·B

## 11. Distributed processing: Spark and the lakehouse
- [S] Spark architecture: driver, executors, tasks, stages, partitions, shuffle — DE-3
- [S] Transformations vs actions, lazy evaluation, DAG — DE-3
- [S] Joins (broadcast vs sort-merge vs shuffle hash), aggregations, window functions in PySpark — DE-3
- [S] Catalyst optimizer and Tungsten (read the physical plan) — DE-3
- [S] Caching and persistence levels — DE-3
- [S] Data skew (salting, AQE skew join), spill, OOM (driver vs executor) — DE-3 incidents
- [S] Partitioning, repartition vs coalesce, small files problem — DE-3
- [S] UDFs (Python vs pandas UDFs vs built-ins) and testing them — DE-3
- [S] Spark UI and event logs — DE-3, mastery gate
- [S] Delta Lake: ACID on files, transaction log, MERGE, time travel, OPTIMIZE, VACUUM, schema enforcement and evolution — DE-3
- [S] Databricks: clusters, jobs, Auto Loader, Unity Catalog, Workflows — DE-3·C
- [W] Liquid clustering / Z-order — DE-3·C
- [A] Delta Sharing; Photon — DE-3·C
- [W] Spark MLlib pipeline — ML-6

## 12. Streaming
- [S] Kafka: topics, partitions, keys and ordering, offsets, consumer groups, rebalancing, retention, replay — DE-4
- [S] Delivery semantics: at-most-once, at-least-once, exactly-once (idempotent producer, transactions, idempotent sinks) — DE-4
- [W] Log compaction — DE-4
- [W] Schema registry with Avro or Protobuf, compatibility modes — DE-4
- [W] Kafka Connect (Debezium runs on it) — DE-4 Ping
- [S] CDC with Debezium, logical replication — DE-4 Ping
- [S] Spark Structured Streaming: triggers, checkpoints, state, output modes — DE-4
- [S] Event time vs processing time, windows (tumbling, sliding, session), watermarks, late data — DE-4
- [S] Backpressure, consumer lag, dead-letter topics, poison messages — DE-4 incidents
- [A] Apache Flink vs Spark Structured Streaming (ADR) — DE-4
- [A] Kinesis / Event Hubs mapping — DE-3·0 (cloud equivalence)

## 13. Warehouses and cloud data platforms
- [S] Snowflake: architecture (storage/compute separation), virtual warehouses, loading (stages, COPY), clustering, time travel, zero-copy clone, streams and tasks, cost control — DE-2·F
- [W] Synapse: serverless vs dedicated SQL, distribution strategies (hash, round-robin, replicated) — DE-3·D
- [W] Microsoft Fabric: lakehouse, warehouse, pipelines, real-time intelligence basics — FAB-1
- [S] Azure data services and when to use each: Azure SQL, Cosmos DB (A), Storage/ADLS Gen2, ADF, Synapse, Databricks — DE-3
- [S] Relational vs non-relational; transactional vs analytical — DE-3·0
- [W] AWS equivalence (S3, Glue, Athena, EMR, Redshift, Kinesis, Lambda, Step Functions, IAM) — DE-3·0 ADR (for Europe/UAE job market)
- [A] BigQuery architecture — DE-3·0 ADR

## 14. Data quality, reliability, observability (roadmap p9)
- [S] Schema, null, uniqueness, referential, accepted-values checks — DE-2·C
- [S] Freshness and volume anomaly detection — DE-2·E
- [S] Reconciliation against source systems — DE-1·0, DE-2 mastery gate
- [S] Dead-letter patterns, quarantine tables — DE-2·E
- [S] Alerting and runbooks — DE-2·E, fleet
- [W] Great Expectations or Soda (one of them) — DE-2·E
- [S] The five-failure drill — DE-2·E

## 15. Cloud, infrastructure as code, CI/CD
- [S] Terraform: providers, resources, variables, outputs, modules, remote state, plan/apply/destroy, drift — DE-3·A
- [S] GitHub Actions: workflows, jobs, matrices, services, secrets, environments, caching — P0-23, BE-1
- [W] Azure DevOps multi-stage YAML pipelines — DE-3·E
- [S] Deployment strategies: rolling, blue-green, canary, feature flags, rollback — BE-2, FS-2
- [S] Cost awareness: budgets, auto-termination, cost per run — DE-3, INF

## 16. Security and identity (I work at an identity company: this domain must be strong)
- [S] Secrets management (env, Key Vault, never in git), rotation — P0-20, DE-3·B
- [S] Authentication vs authorization; RBAC, ABAC (W), least privilege — BE-1·B, DE-3·B
- [S] Password hashing (bcrypt/argon2), sessions vs tokens — BE-1·B
- [S] JWT: structure, signing (HS256 vs RS256), expiry, refresh, revocation, clock skew — BE-1·B
- [S] OAuth 2.0 flows: authorization code + PKCE, client credentials, refresh tokens; scopes — BE-1·I
- [S] OpenID Connect (ID tokens, userinfo, discovery) — BE-1·I, FS-1
- [W] SAML basics and SSO — BE-1·I (spike)
- [S] OWASP Top 10: injection, broken access control (IDOR), XSS, CSRF, SSRF, security misconfiguration — BE-1·B, BE-2, FS-1
- [W] Encryption in transit (TLS) and at rest; hashing vs encryption — BE-2
- [S] PII handling, data minimization, GDPR basics (right to erasure, retention) — BE-2, DE-2
- [W] Threat modeling (STRIDE) for a service — BE-1·I
- [W] Dependency and container scanning — BE-1·G
- [S] LLM security: prompt injection (direct and indirect), tool least privilege, output validation — AI-1, AI-2, AI-3
- [S] Azure management plane vs data plane, managed identities — DE-3·B

## 17. Backend engineering (roadmap p2c)
- [S] A standalone product built from an empty repo (the marketplace: catalog, carts, orders, payments, refunds, notifications) — BE-1
- [S] HTTP server from raw sockets, then FastAPI — BE-1·A
- [S] REST API design: resources, status codes, pagination (cursor vs offset), filtering, errors (RFC 9457), versioning, idempotency — BE-1·B
- [S] Validation and serialization (Pydantic) — BE-1·B
- [S] Layered architecture: controllers, services, repositories — BE-1·C
- [S] ORM vs raw SQL (SQLAlchemy), N+1, migrations (Alembic) — BE-1·C
- [S] Caching: cache-aside, write-through, TTLs, invalidation, stampede protection — BE-1·E
- [S] Queues and background jobs: Redis-based queue or Celery, at-least-once processing, idempotent consumers — BE-1·F
- [W] RabbitMQ vs Kafka vs Redis Streams (ADR) — BE-1·F
- [S] Retries with backoff and jitter, timeouts, circuit breakers, bulkheads — P0-22, BE-1·F
- [S] Rate limiting (token bucket, sliding window), per key — BE-1·F
- [S] Graceful shutdown, health checks (liveness vs readiness) — BE-1·G
- [S] Observability: structured logs with request IDs, metrics (Prometheus), traces (OpenTelemetry), dashboards (Grafana) — BE-1·G
- [W] gRPC and Protobuf — BE-1·H
- [W] WebSockets and server-sent events — BE-1·H, FS-2
- [A] GraphQL (when it helps, N+1 risk) — BE-1·H spike
- [S] Django: models, migrations, views, templates, forms, admin, auth, signals (W) — BE-2
- [S] Concurrency control: transactions, `SELECT ... FOR UPDATE`, optimistic locking (version column) — BE-2
- [W] Email sending, PDF generation, file storage (object storage) — BE-1·F, BE-2
- [S] Payments integration: provider API in test mode, webhook signature verification, retries and out-of-order webhooks, refunds as a state machine, reconciliation — BE-1·K
- [S] Inventory correctness under concurrency: overselling races, atomic conditional updates, reservations with expiry, proving it with concurrent load — BE-1·K
- [S] Search: PostgreSQL full-text with ranking and trigram fuzzy match; OpenSearch (A) — BE-1·L
- [S] A second backend stack in TypeScript: Node.js runtime and event loop, NestJS (modules, controllers, providers, guards, interceptors, DTO validation), Prisma (schema, migrations), BullMQ jobs, WebSocket gateways — FS-1
- [S] Backend system design drills: rate limiter, job queue, URL shortener, notification system, payment system, seat booking, chat, news feed, distributed cache, typeahead, file storage, metrics system — BE-SD

## 18. Distributed systems and system design (roadmap p10)
- [S] Requirements, scale estimation (back-of-envelope) — DE-SD, every project
- [S] Availability, reliability, scalability; SLIs, SLOs, error budgets — FS-2, fleet
- [S] Horizontal vs vertical scaling, stateless services — BE-1·H
- [S] Partitioning and sharding; consistent hashing — BE-1·J
- [S] Replication and consistency models (strong, eventual, read-your-writes) — BE-1·J
- [S] CAP and PACELC, explained with my own systems — BE-1·J
- [W] Consensus (Raft) and leader election, at concept level — BE-1·J spike
- [S] Dual-write problem and the outbox pattern — BE-1·J
- [W] Sagas for multi-step workflows — BE-2 (approval workflow)
- [S] Idempotency keys, exactly-once illusions — BE-1·F
- [S] Backpressure, load shedding, queue-based leveling — BE-1·F, DE-4
- [S] Classic designs practiced: batch ingestion, CDC pipeline, lakehouse, event-driven platform, rate limiter, job queue, URL shortener, chat, notification system, feature store, RAG platform, LLM serving platform — DE-SD, BE-INT, ML-INT, AI-INT, FS-2, INF-5

## 19. Mathematics for ML (taught JIT inside from-scratch tickets)
- [S] Vectors, matrices, dot product, norms, matrix multiplication, transpose, inverse — ML-0 (linear regression from scratch)
- [S] Eigenvalues/eigenvectors, SVD, projections — ML-0 (PCA from SVD)
- [S] Derivatives, partial derivatives, gradients, the chain rule, Jacobian (W) — ML-0 (logistic regression gradient by hand), ML-5 (backprop)
- [S] Probability: random variables, distributions (Bernoulli, binomial, Poisson, normal, exponential), expectation, variance, covariance, conditional probability, Bayes' theorem, independence — ML-0 stats lab, naive Bayes
- [S] MLE and MAP — ML-0 (naive Bayes, logistic regression)
- [S] Optimization: gradient descent, SGD, mini-batch, convexity, learning rates — ML-0
- [W] Constrained optimization and Lagrange multipliers (SVM dual) — ML-0 (SVM)
- [S] Information theory: entropy, cross-entropy, KL divergence, information gain — ML-0 (decision trees), ML-5

## 20. Statistics, experimentation, and causal inference
**Descriptive and inferential (ML-0 stats lab; each in NumPy first, then SciPy/statsmodels)**
- [S] Descriptive statistics, distributions, outliers, skew, transformations
- [S] Sampling, sampling bias, the central limit theorem (by simulation)
- [S] Confidence intervals (analytic and bootstrap)
- [S] Hypothesis testing logic: null/alternative, p-values, Type I/II errors, effect size
- [S] z-test, one- and two-sample t-tests, paired t-test, Welch's t-test
- [S] Chi-square tests (independence, goodness of fit), Fisher's exact test
- [S] ANOVA (one-way) and post-hoc tests
- [S] Non-parametric: Mann-Whitney U, Wilcoxon signed-rank, Kruskal-Wallis, Kolmogorov-Smirnov
- [S] Permutation tests
- [S] Correlation: Pearson, Spearman, Kendall; correlation vs causation
- [S] Regression inference: coefficients, standard errors, p-values, R², residual diagnostics, multicollinearity (VIF) — ML-3

**Experimentation (ML-2)**
- [S] A/B test design: hypothesis, primary and guardrail metrics, randomization unit
- [S] Power, minimum detectable effect, sample size
- [S] Multiple testing corrections (Bonferroni, Benjamini-Hochberg)
- [S] Peeking and sequential testing
- [S] Sample ratio mismatch checks
- [S] Ratio metrics and the delta method
- [S] Variance reduction with CUPED
- [W] Bayesian A/B testing
- [W] Multi-armed bandits (epsilon-greedy, Thompson sampling) vs A/B tests

**Causal inference (ML-2, Ping variant, CX focus)**
- [S] Confounding, selection bias, Simpson's paradox
- [S] Difference-in-differences
- [S] Propensity score matching and weighting
- [S] Uplift modeling (T-learner, S-learner, X-learner), Qini curves
- [A] Synthetic control, instrumental variables, regression discontinuity

## 21. Classical machine learning
**Algorithms (from scratch in NumPy first, then library; ML-0 unless noted)**
- [S] Linear regression (normal equation and gradient descent), polynomial features — ML-0, ML-3
- [S] Regularization: ridge, lasso, elastic net — ML-0, ML-3
- [W] Quantile regression (prediction intervals) — ML-3
- [S] Logistic regression (binary and multinomial/softmax) — ML-0, ML-1
- [S] k-NN (distance metrics, curse of dimensionality, KD-tree A) — ML-0
- [S] Naive Bayes (Gaussian, multinomial, Bernoulli; Laplace smoothing) — ML-0, ML-1
- [S] SVM (hard/soft margin, hinge loss, kernels: linear, polynomial, RBF; the kernel trick) — ML-0, ML-1
- [S] Decision trees (Gini, entropy, pruning) — ML-0
- [S] Bagging and random forests (OOB error, feature importance) — ML-0
- [S] Boosting: AdaBoost, gradient boosting (from scratch), XGBoost, LightGBM, CatBoost (categorical handling) — ML-0, ML-2
- [S] Stacking and cascading — ML-1
- [W] Multi-label and multi-class strategies (one-vs-rest, binary relevance) — Case 5
- [W] Learning to rank (pointwise, pairwise, listwise) — ML-4

**Feature engineering and data prep (ML-1, ML-3)**
- [S] Encoding: one-hot, ordinal, target encoding (and its leakage), hashing
- [S] Scaling and normalization; when trees do not care
- [S] Missing values: deletion, imputation, indicator features
- [S] Date/time features, lags, rolling windows (point-in-time safe)
- [S] Text features: bag-of-words, n-grams, TF-IDF — ML-0
- [S] Word embeddings: word2vec, GloVe, averaged embeddings — ML-2 (Quora)
- [S] Feature selection: filter, wrapper, embedded, permutation importance
- [S] Class imbalance: class weights, resampling, SMOTE, threshold moving

**Evaluation and model selection**
- [S] Train/validation/test, k-fold, stratified, group, and time-series cross-validation — ML-0, ML-1
- [S] Leakage (target, temporal, group) — ML-0, ML-1 incidents
- [S] Bias-variance trade-off, learning curves, validation curves — ML-0
- [S] Classification metrics: accuracy, precision, recall, F1, ROC-AUC, PR-AUC, log loss, confusion matrix — ML-0
- [S] Regression metrics: MAE, MSE, RMSE, MAPE/sMAPE, R² — ML-3
- [S] Ranking metrics: precision@k, recall@k, MAP, NDCG — ML-4
- [S] Probability calibration (Platt, isotonic; reliability plots, Brier score) — ML-1
- [S] Threshold selection and cost-sensitive decisions — ML-1
- [S] Hyperparameter tuning: grid, random, Bayesian (Optuna), early stopping — ML-2
- [S] Explainability: SHAP, permutation importance, partial dependence (W), LIME (A) — ML-1
- [W] Fairness metrics and checks — ML-1

**Unsupervised (ML-4)**
- [S] k-means, k-means++, elbow and silhouette — ML-3, ML-4
- [S] Hierarchical clustering (linkages, dendrograms) — ML-4
- [S] DBSCAN; HDBSCAN (W) — ML-4
- [W] Gaussian mixture models and EM — ML-4
- [S] PCA; t-SNE (S); UMAP (W) — ML-0, ML-4
- [S] Anomaly detection: z-score/IQR, isolation forest, local outlier factor — ML-4 Ping
- [W] Association rules (Apriori, support, confidence, lift) — ML-4 (Olist market basket)
- [W] Topic modeling: LDA; BERTopic — ML-5 Ping

**Time series (ML-3)**
- [S] Decomposition (trend, seasonality, residual), stationarity (ADF test), differencing
- [S] ACF and PACF
- [S] ARIMA / SARIMA, exponential smoothing (ETS)
- [W] Prophet
- [S] Gradient boosting with lag features
- [S] Baselines (naive, seasonal naive) and backtesting (rolling origin)
- [A] Hierarchical forecasting and reconciliation

**Recommenders (ML-4)**
- [S] Content-based filtering — Case 8
- [S] Collaborative filtering (user-based, item-based) — Case 9
- [S] Matrix factorization (SVD, ALS, SGD), implicit vs explicit feedback
- [S] Cold start strategies, popularity baselines, offline evaluation with time splits
- [A] Two-tower retrieval models and candidate generation + ranking architecture

**Graph and reinforcement learning**
- [W] Graph features and link prediction — Case 3
- [W] Tabular Q-learning, Gymnasium environments — ML-6

## 22. CX data science (my target domain: senior DS in CX)
- [S] Churn framing: logo vs revenue churn, prediction horizon, label leakage — ML-1 Ping
- [S] Survival analysis: Kaplan-Meier curves, log-rank test, Cox proportional hazards, discrete-time hazard models — ML-1 Ping
- [S] Customer lifetime value: BG/NBD and Gamma-Gamma models; simple heuristic CLV as a baseline — ML-4 (Olist customers; Ping accounts)
- [S] RFM segmentation and behavioral clustering — ML-4
- [S] Propensity models (expansion, attach) and next-best-action framing — ML-2 Ping
- [S] Uplift modeling for retention campaigns — ML-2 Ping
- [S] NPS and CSAT analytics with confidence intervals; driver analysis — ML-2 (synthetic survey data with a planted Simpson's paradox)
- [S] Support ticket analytics: classification, sentiment, topic modeling, SLA breach prediction — ML-5 Ping
- [S] Cohort retention analysis and funnel analysis in SQL — DE-2·SQL, ML-1
- [S] Customer health scores: design, validation against outcomes — ML-1 Ping, FS-1 Ping
- [S] Translating models into stakeholder decisions and reports — every ML project
- [W] LLM-based ticket summarization and auto-triage with evals — AI-3 Ping

## 23. Deep learning (ML-5 unless noted)
- [S] Perceptron, MLP, activation functions (sigmoid, tanh, ReLU, GELU), softmax
- [S] Loss functions: MSE, cross-entropy, focal loss (W)
- [S] Backpropagation from scratch in NumPy, gradient checking
- [S] Weight initialization (Xavier, He); vanishing and exploding gradients
- [S] Optimizers: SGD, momentum, RMSProp, Adam, AdamW; learning-rate schedules, warmup
- [S] Regularization: L2/weight decay, dropout, early stopping, data augmentation
- [S] Normalization: batch norm, layer norm
- [S] PyTorch: tensors, autograd, `nn.Module`, Dataset/DataLoader, training loop, checkpoints, reproducibility (seeds)
- [W] TensorFlow / Keras (one task, as the course uses it)
- [S] CNNs: convolution, padding, stride, pooling, receptive field; ResNet (skip connections) — Case 10
- [S] Transfer learning and fine-tuning pretrained models
- [S] RNNs, LSTMs, GRUs; sequence modeling — Case 11
- [S] Encoder-decoder (seq2seq) and attention — Module 8
- [S] Transformers: self-attention, multi-head attention, positional encoding, encoder vs decoder, BERT, GPT — ML-5, AI-4
- [W] Autoencoders (for anomaly detection) — ML-5
- [W] GANs (one small task) — Module 8
- [W] Object detection and image segmentation with pretrained models; OpenCV basics — Module 8 small tasks
- [S] Debugging training: overfit one batch, loss curves, NaNs — ML-5 incidents

## 24. MLOps
- [S] Experiment tracking (MLflow) — ML-3
- [S] Data and model versioning (DVC W), model registry, reproducibility — ML-3
- [S] Training pipelines as packages with tests and configs — ML-3
- [S] Batch vs online serving; FastAPI model service; containerized models — ML-3
- [W] Feature stores (Feast) and online/offline consistency — ML-3
- [S] Train/serve skew, data drift, concept drift; PSI, KS — ML-3
- [S] Model monitoring and alerting; retraining triggers with guards — ML-3
- [S] Shadow deployments, canary releases for models, champion/challenger — ML-3
- [S] ML testing: data validation, performance thresholds, slice tests, regression tests — ML-3
- [S] Model cards and documentation — every ML project
- [W] Warm/cold starts and request batching for model servers — ML-3, INF-4

## 25. LLMs and AI engineering (Stage 4)
- [S] Tokenization (BPE from scratch), vocabularies, token costs — AI-4, AI-1
- [S] Embeddings and similarity search — AI-2
- [S] Transformer inference basics: prefill vs decode, context windows, sampling (temperature, top-p, top-k) — AI-1, AI-4
- [S] Prompting: task specification, few-shot, system prompts, decomposition — AI-1
- [S] Structured outputs and JSON schema validation; tool/function calling — AI-1
- [S] Evals: golden sets, metrics, LLM-as-judge calibrated against human labels, regression tests in CI — AI-1, AI-2
- [S] RAG: chunking strategies, metadata, hybrid search (BM25 + vectors), reranking, citations, query rewriting — AI-2
- [S] Vector indexes: flat, IVF, HNSW; pgvector; recall vs latency trade-offs — AI-2
- [S] Agents: tool loops, ReAct, planning, memory, human-in-the-loop approval, step and budget limits — AI-3
- [S] MCP servers and clients — AI-3
- [W] Multi-agent orchestration — AI-3 public
- [S] Guardrails and output validation; prompt injection defenses — AI-1, AI-2, AI-3
- [S] Cost and latency engineering: caching (prompt and semantic), model routing, batching, streaming — AI-1
- [S] LLM observability: traces of prompts, tool calls, tokens, cost — AI-3
- [S] Fine-tuning: SFT, LoRA, QLoRA; when fine-tuning beats prompting or RAG — AI-4
- [A] Preference tuning (RLHF, DPO), distillation, multimodal models — AI-4 spike
- [S] Building a GPT-style model from scratch; KV cache, GQA, RoPE, RMSNorm — AI-4

## 26. Frontend (Stage 5)
- [S] HTML semantics, CSS layout (flexbox, grid), responsive design; Tailwind (W) — FS-1
- [S] JavaScript: types, closures, `this`, modules, the event loop, promises, async/await — FS-1
- [S] TypeScript: types, interfaces, unions, generics, narrowing, strict mode — FS-1
- [S] React: components, props, state, hooks (`useState`, `useEffect`, `useMemo`, `useCallback`, `useRef`), effects pitfalls, context, reducers — FS-1
- [S] Data fetching and caching (TanStack Query), race conditions, optimistic updates — FS-1
- [S] Routing, forms and validation (zod) — FS-1
- [S] Redux in depth: store, slices, reducers, actions, immutability (Immer), middleware, thunks, normalized entities (`createEntityAdapter`), memoized selectors (reselect), DevTools — FS-1
- [S] RTK Query: caching, tag invalidation, polling, optimistic updates with rollback — FS-1
- [S] State placement decisions: Redux vs server cache vs local state vs URL state (Zustand and TanStack Query compared, A) — FS-1 ADR
- [S] Large-list performance: virtualization, memoization, React Profiler — FS-1
- [S] Resumable chunked uploads with presigned URLs — FS-1
- [W] Component library and design system with Storybook — FS-1
- [A] i18n, micro-frontends and module federation — FS-1 spike
- [A] Collaborative editing: CRDTs vs operational transforms — FS-2 spike
- [S] Standalone full-stack products: the ticket tracker (FS-1), team chat (FS-2), a multi-tenant ERP in Next.js (FS-4), a WebRTC video app (FS-4)
- [S] Next.js: SSR, SSG, server components, API routes — FS-3
- [S] Accessibility (WCAG basics, keyboard, screen readers) — FS-1
- [S] Frontend performance: Core Web Vitals, bundle size, code splitting, memoization — FS-1
- [S] Frontend security: XSS, CSRF, CORS, CSP, token storage — FS-1
- [S] SPA auth with OIDC + PKCE — FS-1
- [S] Testing: React Testing Library, Playwright E2E — FS-1
- [S] Real-time UIs: WebSockets, reconnect with backoff, message ordering and dedup, offline sync — FS-2
- [S] Multi-tenancy: tenant isolation in schema and queries, tested — FS-4 (ERP)
- [S] WebRTC: signaling, STUN/TURN, peer connections, SFU (A), screen share — FS-4
- [S] Frontend system design drills: news feed with infinite scroll, typeahead, real-time dashboard, chat client, product page and checkout, collaborative editor, kanban board, resumable uploader, design system, carousel, offline-first PWA, multi-step form wizard — FS-SD, FS-INT

## 27. DevOps, containers, Kubernetes, SRE
- [S] Docker: images, layers, caching, multi-stage builds, non-root users, image size, volumes, networks, Compose — P0-15, BE-1·G
- [S] Kubernetes: pods, deployments, services, ingress, ConfigMaps, Secrets, resource requests/limits, liveness/readiness/startup probes, HPA, Jobs and CronJobs, StatefulSets (W), namespaces — FS-2 (and P0's cron moves to a K8s CronJob)
- [S] Helm charts — FS-2
- [W] GitOps with Argo CD — FS-2
- [W] WebSocket-aware ingress, connection draining on deploys, pub/sub fan-out across pods (Redis or NATS) — FS-2
- [S] Observability stack: Prometheus, Grafana, OpenTelemetry, log aggregation (Loki W) — BE-1, FS-2
- [S] SLOs, SLIs, error budgets, alert design (symptom-based, low noise) — FS-2
- [S] Incident management: on-call, severity, comms, blameless postmortems — fleet (all stages)
- [S] Load testing (k6 or Locust) — BE-1·H, INF-1

## 28. Performance engineering (roadmap p16, p21)
- [S] Latency percentiles (p50/p95/p99), throughput, utilization, saturation — INF-1
- [S] The 10-step performance loop; changing one variable at a time; benchmarking with warm-up and variance — INF-1
- [S] Compute-bound vs memory-bound vs I/O-bound vs launch-bound — INF-1, INF-2
- [S] CPU caches, memory bandwidth, cache hit rates — INF-2·0
- [S] Profilers: perf, flame graphs, py-spy, cProfile, line_profiler, PyTorch profiler, Nsight Systems, Nsight Compute — INF-1 to INF-3
- [S] Cost per request and per token — INF-4

## 29. C++ (roadmap p17)
- [S] Compilation and linking, headers, CMake — INF-2·0
- [S] References vs pointers, stack vs heap, RAII — INF-2·0
- [S] Smart pointers (`unique_ptr`, `shared_ptr`, `weak_ptr`) — INF-2·0
- [S] STL containers and algorithms; iterators — INF-2·0
- [S] Move semantics vs copy, rule of zero/three/five — INF-2·0
- [S] Templates (function and class templates) — INF-2·0
- [S] Threads, mutexes, condition variables, atomics, memory ordering (W) — INF-2·0
- [S] Sanitizers (AddressSanitizer, ThreadSanitizer) and debugging (gdb/lldb W) — INF-2·0
- [S] Binding C++ to Python (pybind11) and benchmarking against Python — INF-2·0

## 30. GPU, CUDA, Triton, TensorRT, PyTorch performance (roadmap p18–p21, p24, p25)
- [S] GPU architecture: SIMT, warps, threads, blocks, grids, SMs; occupancy; divergence — INF-2
- [S] Memory hierarchy: registers, shared memory, L1/L2, global memory; coalesced access; bank conflicts — INF-2
- [S] Host↔device transfers over PCIe, pinned memory — INF-2
- [S] CUDA kernels: vector add, naive and tiled matmul, reduction, softmax, histogram (atomics), convolution — INF-2
- [S] CUDA streams and async execution (overlap copy and compute), events for timing, CUDA graphs — INF-2
- [S] Correct GPU benchmarking (synchronization, warm-up, repeats) — INF-2
- [S] Triton kernels: tiling, fusion (fused softmax or layernorm), comparison with PyTorch — INF-2
- [W] An attention kernel in Triton (FlashAttention-style tiling) — INF-2
- [S] PyTorch performance: `inference_mode`, pinned memory and async loading, DataLoader workers, `torch.compile`, mixed precision (FP16/BF16) and Tensor Cores, CUDA graphs in PyTorch — INF-3
- [S] TensorRT: ONNX export, engine building, FP16/INT8 (calibration), layer fusion, timing cache — INF-4·T

## 31. LLM inference and serving (roadmap p22, p23, p26, p35)
- [S] Prefill (compute-bound) vs decode (memory-bandwidth-bound) — INF-4
- [S] KV-cache memory math (layers, heads, head dim, dtype, sequence length, batch) — INF-4
- [S] Batching: static, dynamic, continuous; chunked prefill — INF-4
- [S] PagedAttention and FlashAttention (concepts and measured effect) — INF-4
- [S] Prefix caching — INF-4
- [S] Quantization: FP16, BF16, FP8, INT8, INT4; GPTQ, AWQ; quality checks on my eval set — INF-4
- [S] Speculative decoding — INF-4
- [S] vLLM serving and benchmarking (TTFT, inter-token latency, tokens/s, p95/p99, GPU memory and utilization, cost) — INF-4
- [W] llama.cpp (Apple Silicon/CPU), SGLang, TensorRT-LLM comparisons — INF-4
- [W] Parallelism: tensor, pipeline, data, expert, context; one 2-GPU tensor-parallel experiment — INF-4·P
- [A] Mixture-of-experts serving, state-space models (Mamba) — INF-4 spike
- [S] Kubernetes GPU serving and autoscaling; the full inference lab — INF-5

## 32. Professional and career skills
- [S] Stakeholder communication: plain-language updates, incident comms, saying no with options — persona tickets
- [S] Writing: ADRs, RFCs, READMEs, postmortems, model cards, stakeholder reports — every project
- [S] Estimation and commitment, extension requests — RDS model
- [S] Behavioral interviews (STAR from my real postmortems) — SCENARIO BANK, every INT block
- [S] System design interviews per track — DE-SD, BE-INT, ML-INT, AI-INT, FS-INT
- [S] Reviewing others' code well — review tickets

---

## 33. Roadmap traceability (every roadmap.html phase item → home)

Generated from roadmap.html focus and checklist items. Every item has a home. The stage audit ticks these too.

**p0 Python Engineering Foundation** — focus (object model & mutability; functions & scope; comprehensions & functional tools; modules & classes; error handling & testing; iterators & generators; files & APIs & databases; packaging & environments; GIL & concurrency (0.11)) → P0, DE-1·H
- [ ] Write a small package with clean structure → P0-08, DE-1·H (wheel)
- [ ] Write tests for it → P0-10, P0-12
- [ ] Handle failures without swallowing errors → P0-11, P0-24
- [ ] Log correctly → P0-21
- [ ] Read/write files and call an API → P0-06, P0-07
- [ ] Connect to a database → P0-17
- [ ] Write an ETL script → P0 (whole project)
- [ ] Process a large file lazily (generators) → DE-1·H (5 GB lazy parse)
- [ ] Use concurrency appropriately for the workload → DE-1·H (benchmarks)
- [ ] Explain when async helps and when it doesn't → DE-1·H (asyncio vs threads ADR)
- [ ] Profile a slow function → DE-1·H (cProfile, line_profiler, py-spy)
- [ ] Explain the GIL at a practical level → DE-1·H (threads vs processes)

**p011 Concurrency, GIL & Async (0.11)** — focus (concurrency vs parallelism; CPU-bound vs I/O-bound; GIL; threading + locks; multiprocessing + managers; concurrent.futures; asyncio event loop; interview-style practice problems) → DE-1·H
- [ ] Build the same I/O workload sync / threaded / asyncio and benchmark all three → DE-1·H (sync/threaded/asyncio downloads)
- [ ] Build a CPU-bound workload and compare threads vs processes → DE-1·H (threads vs processes)
- [ ] Deliberately introduce a race condition, fix it, explain the fix → DE-1·H (manifest race bug)
- [ ] Choose sync/threading/multiprocessing/asyncio for a real workload and defend the choice → DE-1·H (defended choice ADR)

**p1 SQL** — focus (DDL/DML; joins & set ops; CTEs & window functions; views/CTAS; indexes & partitions; EXISTS vs IN vs JOIN; recursive CTEs; GROUPING SETS / CUBE; query plans) → P0-16 to P0-18, DE-1·0, DE-1·F, DE-2·SQL
- [ ] Model an unfamiliar schema correctly → DE-2·A (normalize Olist), BE-1·B
- [ ] Write correct SQL for a non-trivial problem → DE-1·0, DE-2·SQL
- [ ] Explain the query in plain language → every SQL PR (explain in plain language)
- [ ] Identify likely bottlenecks before running it → DE-2·SQL (predict before running)
- [ ] Inspect the query plan → DE-1·F, DE-2·SQL
- [ ] Improve the query → DE-2·SQL
- [ ] Explain why the new query is better → DE-2·SQL (EXISTS vs IN vs JOIN)

**p2a Linux / Operating Systems** — focus (kernel vs user space; processes & threads; scheduling; virtual memory & paging; filesystems; sockets; strace/ps/top/vmstat/lsof/ss) → DE-1·E, DE-1·I, SYS-1
- [ ] Explain process vs thread → DE-1·E
- [ ] Explain virtual memory & paging → DE-1·E, SYS-1
- [ ] Use ps/top/vmstat/strace to diagnose a running process → DE-1·E
- [ ] Explain how a filesystem stores and retrieves a file → SYS-1, DE-1·E

**p2b Networking** — focus (TCP handshake & retransmission; DNS; HTTP/HTTPS/TLS; load balancing & reverse proxies; NAT; congestion & latency) → DE-1·A, BE-1·A, BE-1·H
- [ ] Trace browser → DNS → IP → TCP → TLS → HTTP → LB → app → DB → DE-1·A, BE-1·A (tcpdump)
- [ ] Explain the TCP handshake and why retransmission happens → BE-1·A
- [ ] Explain what a reverse proxy does and why you'd use one → BE-1·H (nginx)

**p2c Backend Systems** — focus (routing & serialization; auth/authz; controllers/services/repositories; caching; queues & background jobs; fault tolerance; observability; graceful shutdown) → BE-1 epics A–L
- [ ] Design a REST API with proper auth and validation → BE-1·B, BE-1·I
- [ ] Explain caching strategy trade-offs → BE-1·E
- [ ] Explain how a queue decouples producer/consumer failure modes → BE-1·F

**p2d Database Engineering** — focus (pages & B-trees; ACID & isolation; locks & MVCC; WAL & replication; connection pooling; query execution) → DE-1·F, SYS-1, BE-1·D
- [ ] Explain how a B-tree index speeds up a lookup → DE-1·F
- [ ] Explain MVCC and why it avoids read locks → DE-1·F
- [ ] Explain WAL and its role in crash recovery → DE-1·F, SYS-1
- [ ] Explain a transaction isolation level and its trade-off → DE-1·F

**p3a Azure Data Fundamentals** — focus (relational vs non-relational; transactional vs analytical; Azure SQL; Cosmos DB; Storage; Synapse; ADF; Databricks) → DE-3·0, DE-3
- [ ] Explain when to use each core Azure data service → DE-3·0 ADR

**p3b Azure Data Factory** — focus (pipelines/activities/linked services; triggers & scheduling; integration runtime; incremental ingestion; metadata-driven pipelines; secrets & monitoring) → DE-3·B
- [ ] Build a pipeline with parameters and triggers → DE-3·B
- [ ] Implement incremental ingestion with watermarking → DE-3·B
- [ ] Handle a late-arriving record and a backfill → DE-3·B
- [ ] Wire in retries and error handling → DE-3·B
- [ ] Explain idempotency in this pipeline → DE-3·B

**p3c Azure Synapse** — focus (dedicated vs serverless SQL; Spark pool; external data; partitioning & distribution) → DE-3·D
- [ ] Query external data via serverless SQL → DE-3·D
- [ ] Explain distribution strategy trade-offs for a dedicated SQL pool → DE-3·D ADR

**p3d Azure DevOps + CI/CD + Terraform** — focus (YAML build pipelines; multi-stage releases; automated testing; Terraform plan/apply/destroy; state & variables) → DE-3·A, DE-3·E
- [ ] Build a multi-stage CI/CD pipeline for a data project → DE-3·E
- [ ] Provision a resource group + storage account with Terraform → DE-3·A
- [ ] Explain plan vs apply vs state → DE-3·A

**p3e Azure Security (Key Vault, RBAC)** — focus (secrets/keys/certificates; Azure AD & RBAC; management vs data plane; audit logging) → DE-3·B, DE-3 cost/audit ticket
- [ ] Wire Key Vault secrets into an ADF pipeline → DE-3·B
- [ ] Explain management plane vs data plane access → DE-3·B

**p4a PySpark Fundamentals** — focus (SparkSession; schemas; transformations vs actions; aggregations & joins; UDFs; sources & sinks) → DE-3 Ping
- [ ] Build a PySpark pipeline with joins and aggregations → DE-3 Ping
- [ ] Write and test a UDF → DE-3 Ping
- [ ] Read from and write to a data source → DE-3 Ping

**p4b Spark Internals & Optimization** — focus (Catalyst & Tungsten; broadcast joins; caching/persistence; data skew; Spark UI; Structured Streaming; SCD Type 2; idempotent upserts) → DE-3 Ping, DE-4
- [ ] Diagnose data skew from the Spark UI → DE-3 Ping (skew incident)
- [ ] Fix a slow join with a broadcast join → DE-3 Ping (broadcast perf)
- [ ] Explain driver/executor/task/partition/shuffle → DE-3 (Spark UI tour)
- [ ] Implement SCD Type 2 in PySpark → DE-3 Ping (CDC MERGE)

**p5 Databricks / Delta Lake / Lakehouse** — focus (clusters & jobs; Delta Lake & time travel; Unity Catalog; Auto Loader & incremental ingestion; schema evolution; ZORDER/liquid clustering; Delta Sharing) → DE-3·C
- [ ] Build a medallion-architecture Delta pipeline → DE-3·C
- [ ] Use Auto Loader for incremental ingestion → DE-3·C
- [ ] Implement SCD Type 2 with Delta → DE-3·C
- [ ] Explain Unity Catalog's role → DE-3·C
- [ ] Use time travel and ZORDER → DE-3·C

**p6 Data Modeling + Warehousing** — focus (star vs snowflake schema; fact & dimension tables; slowly changing dimensions; Kimball vs Data Vault vs OBT; loading patterns) → DE-2·A, DE-2·B
- [ ] Define the grain before modeling a new table — every time → DE-2·A (grain first)
- [ ] Design a star schema for a real dataset → DE-2·A
- [ ] Implement a slowly changing dimension → DE-2·B (all SCD types)

**p7 Snowflake** — focus (architecture & warehouses; loading & formats; clustering; time travel; streams & tasks) → DE-2·F
- [ ] Load data into Snowflake and model it dimensionally → DE-2·F
- [ ] Explain clustering and time travel → DE-2·F
- [ ] Set up a stream + task pipeline → DE-2·F

**p8a dbt** — focus (models & sources; ref(); incremental models; tests & snapshots; macros; docs & lineage) → DE-2·C
- [ ] Build a dbt project with sources, models, and tests → DE-2·C
- [ ] Implement an incremental model → DE-2·C
- [ ] Generate and read the lineage docs → DE-2·C

**p8b Airflow** — focus (DAGs & dependencies; scheduling & retries; sensors & operators; XCom; backfills; idempotency) → DE-2·D
- [ ] Build a DAG with retries and a sensor → DE-2·D
- [ ] Run a backfill safely → DE-2·D
- [ ] Explain idempotency in an orchestrated pipeline → DE-2·D

**p8c Kafka** — focus (topics & partitions; offsets & consumer groups; ordering & retention; delivery semantics; replay) → DE-4
- [ ] Build a producer/consumer pair → DE-4
- [ ] Explain at-least-once vs exactly-once delivery → DE-4
- [ ] Replay a topic from an earlier offset → DE-4

**p9 Data Quality / Reliability / Observability** — focus (schema & null/uniqueness checks; freshness & volume anomalies; reconciliation & lineage; alerting & dead-letter patterns; data contracts) → DE-2·E
- [ ] Build a pipeline that fails 5 ways: source down, malformed record, schema change, duplicate data, downstream DB failure → DE-2·E (five-failure drill)
- [ ] Recover the pipeline from each failure → DE-2·E
- [ ] Add data-quality checks and alerting → DE-2·E

**p10 System Design for Data Engineers** — focus (requirements & scale estimation; availability/reliability/scalability; caching & partitioning; messaging & consistency; iterative architecture refinement) → DE-SD, every project
- [ ] Clarify requirements & assumptions for an unfamiliar design problem → DE-SD
- [ ] Estimate scale (back-of-envelope) → DE-SD
- [ ] Choose storage/compute/communication components and defend them → DE-SD
- [ ] Explain bottlenecks, failure modes, and what changes at 10x scale → DE-SD
- [ ] Practice: batch ingestion, CDC pipeline, lakehouse, event-driven platform → DE-SD

**p11 DSA / Interview Preparation** — focus (arrays/strings/hash maps; trees & graphs; binary search & intervals; heaps; basic DP) → Daily DSA from Stage 1 + DSA tie-in tickets (map §7)
- [ ] Recognize the pattern behind a new problem quickly → daily timed practice
- [ ] Write clean, bug-free Python under time pressure → DE-INT, BE-INT

**p12 Portfolio — 5 Projects** — focus (Dubai Real Estate Lakehouse (ADF/Databricks/Delta); UAE Gov Open Data Pipeline (API ingestion); Property Feature Pipeline (PySpark/ML-ready); Multi-Source Warehouse (dimensional modeling); Streaming Transaction Monitor (Structured Streaming/Kafka)) → Five portfolio projects
- [ ] Project 1 — Dubai Real Estate Lakehouse shipped → DE-3
- [ ] Project 2 — UAE Gov Open Data Pipeline shipped → DE-1 public part 2
- [ ] Project 3 — Property Feature Pipeline shipped → DE-3·F
- [ ] Project 4 — Multi-Source Warehouse shipped → DE-2 public
- [ ] Project 5 — Streaming Transaction Monitor shipped → DE-4 public part 2
- [ ] At least 1 strong Azure/Databricks project, 1 warehouse/Snowflake/dbt project, 1 streaming/stretch project → DE-3, DE-2·F, DE-4

**p13 Production Engineering Add-ons (Git, Docker)** — focus (branching/rebasing/PRs; clean commits & tagging; Docker images/volumes/networks; Dockerfiles & Compose) → P0-02 to P0-05, P0-15, DE-1·G, BE-1·G
- [ ] Use a clean branch/PR workflow on a real project → every project
- [ ] Containerize a service with a Dockerfile and Compose → P0-15, BE-1·G

**p14 Applied AI / ML Foundation** — focus (vectors/matrices/probability/gradients; linear & logistic regression, trees, ensembles; neural nets/backprop/optimizers; tokenization/embeddings/attention; serving/batching/latency basics) → ML-0, ML-5, AI-4
- [ ] Implement a simple neural net forward+backward pass → ML-5 (NumPy backprop)
- [ ] Explain attention and positional encoding → AI-4
- [ ] Explain training vs inference for a transformer → AI-4, INF-4

**p15 LLM Fundamentals** — focus (Hands-On Large Language Models; LLMs from Scratch (tokenization→generation); Chip Huyen — Designing ML Systems (serving/monitoring/drift)) → AI-1 to AI-4, ML-3
- [ ] Implement a minimal transformer block → AI-4
- [ ] Explain RAG end to end → AI-2
- [ ] Explain distribution shift and why it matters for serving → ML-3 (drift)

**p15a Prompt Engineering, Behavior & Evaluation** — focus (task specification & few-shot; structured outputs & tool calling; eval sets & regression testing; prefix caching / prefill vs decode implications; prompt injection as an app-layer threat) → AI-1
- [ ] Build a benchmark: 20–50 tasks, compare prompt v1 vs v2 on quality/tokens/latency → AI-1
- [ ] Measure TTFT and cost across prompt versions → AI-1
- [ ] Validate structured output against a schema → AI-1

**p15b MLOps / Production ML Bridge** — focus (experiment→train→evaluate→serve→monitor; versioning & reproducibility; batch vs online serving; warm/cold starts & request batching; drift & GPU/CPU utilization monitoring) → ML-3
- [ ] Package a model with reproducible config/versioning → ML-3
- [ ] Stand up a serving endpoint with logging + monitoring → ML-3
- [ ] Explain batch vs online inference trade-offs → ML-3 ADR

**p15c Umar Jamil Deep-Dive Companion** — focus (transformer/attention from first principles; KV cache, GQA, RoPE, RMSNorm; FlashAttention derivation & Triton) → AI-4
- [ ] Reproduce a selected implementation from scratch → AI-4
- [ ] Modify it and benchmark the change → AI-4
- [ ] Explain the mechanism and its performance implication → AI-4

**p16 Performance Engineering Fundamentals** — focus (p50/p95/p99 latency; throughput & utilization; memory bandwidth & cache hit rate; TTFT & inter-token latency; cost per request/token) → INF-1
- [ ] Run the 10-step performance loop on a real workload → INF-1
- [ ] Change exactly one variable and explain the result → INF-1
- [ ] Distinguish compute-bound vs memory-bound vs launch-bound → INF-1, INF-2

**p17 C++ Foundation** — focus (references/pointers/RAII; STL & smart pointers; move semantics & templates; threads/mutexes/atomics) → INF-2·0
- [ ] Write a small multithreaded C++ program with RAII and smart pointers → INF-2·0
- [ ] Explain move semantics vs copy → INF-2·0

**p18 GPU Fundamentals** — focus (SIMD/SIMT, warps, threads, blocks, grids; registers/shared/global memory; occupancy & kernel launch overhead; PCIe host/device transfer) → INF-2
- [ ] Explain the warp/block/grid hierarchy → INF-2
- [ ] Explain why host↔device transfer can dominate a naive kernel's runtime → INF-2 (PCIe timing)

**p19 CUDA** — focus (thread hierarchy & memory hierarchy; shared memory & coalesced access; streams & async execution; CUDA graphs & events) → INF-2
- [ ] Build & benchmark: vector add, matmul, reduction, histogram, convolution → INF-2
- [ ] Use streams for overlap → INF-2 (streams)
- [ ] Use a CUDA graph and explain the win → INF-2 (CUDA graph)

**p20 PyTorch Performance** — focus (pinned memory & async loading; no-grad inference; torch.compile; mixed precision & Tensor Cores; CUDA graphs in PyTorch) → INF-3
- [ ] Benchmark correctly: warm-up, sync, repeat for variance → INF-2, INF-3
- [ ] Apply torch.compile and measure the delta → INF-3
- [ ] Use mixed precision and measure the delta → INF-3

**p21 Profiling** — focus (perf & flame graphs; py-spy/cProfile/line_profiler; PyTorch Profiler; Nsight Systems / Nsight Compute) → INF-1, INF-2, INF-3
- [ ] Generate and read a flame graph → INF-1
- [ ] Profile a Python hotspot with py-spy or cProfile → INF-1, DE-1·H
- [ ] Profile a GPU kernel with Nsight Compute and explain occupancy → INF-2

**p22 LLM Inference Internals** — focus (prefill (compute-bound) vs decode (bandwidth-bound); KV cache growth (layers/heads/dim/dtype); static vs dynamic vs continuous batching; FP16/BF16/FP8/INT8/INT4, GPTQ/AWQ; FlashAttention & PagedAttention concepts) → INF-4
- [ ] Calculate KV-cache memory for a given model/sequence-length/batch size → INF-4 (KV drill)
- [ ] Explain why decode is memory-bandwidth bound → INF-4
- [ ] Explain the quantization trade-off (memory/latency/cost vs accuracy risk) → INF-4
- [ ] Explain FlashAttention and PagedAttention conceptually → INF-4

**p23 vLLM** — focus (continuous batching & chunked prefill; prefix caching; tensor/pipeline/data/expert/context parallelism; OpenAI-compatible serving) → INF-4, INF-4·P
- [ ] Serve an open-weight model with vLLM → INF-4
- [ ] Benchmark across batch sizes, quantization, context length, concurrency → INF-4
- [ ] Record TTFT, p50/p95/p99, tokens/sec, GPU memory & utilization, cost/request → INF-4

**p24 TensorRT** — focus (ONNX → engine building; FP16/BF16/FP8/INT8; layer fusion & Tensor Cores; multi-streaming & timing cache) → INF-4·T
- [ ] Build a TensorRT engine from ONNX → INF-4·T
- [ ] Benchmark baseline → optimized, profile, identify bottleneck, re-benchmark → INF-4·T

**p25 Triton / Custom Kernels** — focus (memory access & tiling; reductions & fusion; GEMM & attention kernels; launch configuration) → INF-2 (Triton)
- [ ] Write a custom Triton kernel and benchmark it against the PyTorch baseline → INF-2

**p26 Ajay Shenoy — Advanced AI Engineering** — focus (GPTQ/AWQ/FP8/INT4; FlashAttention/PagedAttention; vLLM/SGLang/TensorRT/Triton; speculative decoding; MoE/SSMs/Mamba; Kubernetes + GPU serving) → INF-4, INF-4·P, INF-5 (resource sections at step 4e)
- [ ] Complete relevant modules after the core inference-internals foundation is solid → INF-4, INF-5

**p35 Capstone — Production LLM Inference Performance Lab** — focus (Layer: API → service → vLLM model → load gen → metrics; Optimize: batch size, concurrency, context length, quantization, prefix caching, CUDA graphs; Compare: naive PyTorch → optimized PyTorch → vLLM → quantized vLLM → TensorRT) → INF-5
- [ ] Stand up all 5 layers (API, service, model, load gen, metrics) → INF-5
- [ ] Run the optimization sweep and record TTFT/p50/p95/p99/tokens-per-sec/GPU util → INF-5
- [ ] Publish a repo: architecture, methodology, baseline, experiments, graphs, profiler screenshots, bottleneck analysis, results, cost analysis, lessons learned → INF-5

