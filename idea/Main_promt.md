# WDBX Database Engine

## Project Mission

Build a production-grade, open-source, high-performance database management system called **WDBX**.

WDBX stands for **Webda Database eXchange**.

WDBX will be owned and maintained by **Webda Studio** and should be designed as a modern database engine capable of supporting both:

1. Relational SQL workloads
2. Native NoSQL/document workloads

The goal is to create a serious general-purpose database engine that combines the strengths of PostgreSQL-style relational databases with modern document-oriented databases.

WDBX must NOT simply be a wrapper around PostgreSQL, MySQL, MongoDB, SQLite, or another existing database.

Use the PostgreSQL source code at:

https://github.com/postgres/postgres

as an architectural and engineering reference where legally and technically appropriate, but design WDBX as an independently structured database project with its own architecture, storage layer, APIs, query language extensions, security model, configuration system, branding, and development roadmap.

Do not blindly copy PostgreSQL implementation details.

---

# 1. Core Requirements

WDBX must support:

### SQL

Provide a powerful SQL interface with support for:

* SELECT
* INSERT
* UPDATE
* DELETE
* UPSERT
* JOIN
* GROUP BY
* ORDER BY
* HAVING
* UNION
* CTE
* Subqueries
* Window functions
* Transactions
* Views
* Materialized views
* Stored procedures
* Functions
* Triggers
* Constraints
* Foreign keys
* Primary keys
* Unique constraints
* Check constraints
* Generated columns
* Indexes
* Full-text search
* JSON/JSONB-style data

### NoSQL

Provide native document storage.

Example:

```json
{
  "id": "usr_123",
  "name": "Badhon",
  "email": "user@example.com",
  "skills": ["AI", "Cloud", "Web"],
  "profile": {
    "country": "Bangladesh",
    "experience": 5
  }
}
```

Support:

* Schemaless collections
* JSON documents
* Nested objects
* Arrays
* Dynamic fields
* Document indexes
* Document queries
* Atomic document updates
* Partial document updates
* TTL indexes
* Aggregation pipelines
* Full-text search
* Vector fields
* Geospatial fields

---

# 2. Hybrid SQL + NoSQL Architecture

WDBX should allow SQL tables and NoSQL collections to coexist inside the same database.

Example:

```sql
CREATE DATABASE webda;
```

Create relational data:

```sql
CREATE TABLE users (
    id UUID PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);
```

Create document data:

```sql
CREATE COLLECTION user_profiles;
```

Insert a document:

```sql
INSERT INTO user_profiles DOCUMENT {
    "user_id": "123",
    "skills": ["AI", "Cloud", "React"],
    "preferences": {
        "theme": "dark"
    }
};
```

The engine should also support cross-model queries where technically practical.

Example:

```sql
SELECT
    users.name,
    user_profiles.preferences->>'theme'
FROM users
JOIN user_profiles
ON users.id = user_profiles.user_id;
```

---

# 3. Storage Engine

Design a modern storage engine with:

* Page-based storage
* Buffer pool
* Write-ahead logging
* Crash recovery
* Checkpointing
* MVCC
* Deadlock detection
* Transaction isolation
* Atomic commits
* Durable writes
* Background compaction
* Free-space management
* Data checksums
* Page checksums
* Data corruption detection
* Automatic recovery

Support multiple storage strategies where practical:

```text
Row Storage
Document Storage
Columnar Storage
Index Storage
Vector Storage
```

Do not implement everything at once.

Build the architecture so additional storage engines can be introduced later.

---

# 4. Transaction System

Implement a serious transaction subsystem.

Required concepts:

* ACID transactions
* MVCC
* Snapshot isolation
* Read committed
* Repeatable read
* Serializable isolation
* Atomic commit
* Rollback
* Savepoints
* Deadlock detection
* Lock management
* Transaction IDs
* Visibility rules
* Crash recovery

Transactions must remain consistent across both SQL and document operations.

Example:

```sql
BEGIN;

UPDATE users
SET name = 'Badhon'
WHERE id = '123';

UPDATE user_profiles
SET DOCUMENT {
    "verified": true
}
WHERE user_id = '123';

COMMIT;
```

If any operation fails, the entire transaction must safely roll back.

---

# 5. Query Engine

Create a modular query processing architecture:

```text
Parser
   ↓
AST
   ↓
Semantic Analyzer
   ↓
Query Rewriter
   ↓
Planner
   ↓
Optimizer
   ↓
Execution Engine
   ↓
Storage Engine
```

Implement:

* Cost-based query optimization
* Statistics
* Index selection
* Join optimization
* Predicate pushdown
* Projection pushdown
* Query plan caching
* Prepared statements
* Parallel query execution
* Partition pruning
* Automatic index recommendations

Create:

```sql
EXPLAIN
EXPLAIN ANALYZE
```

for query analysis.

---

# 6. Indexing

Implement a modular indexing subsystem.

Initial indexes:

* B-Tree
* Hash
* GIN-style document index
* Full-text index
* Spatial index
* Vector index

Support:

```sql
CREATE INDEX idx_users_email
ON users(email);
```

and document indexes:

```sql
CREATE INDEX idx_profile_country
ON user_profiles(profile.country);
```

Design the index interface so new index algorithms can be added later without rewriting the storage engine.

---

# 7. Security

Security is a first-class requirement.

Implement:

* Role-based access control
* Users
* Roles
* Permissions
* Database-level permissions
* Schema-level permissions
* Table-level permissions
* Collection-level permissions
* Row-level security
* Document-level security
* Authentication
* Password authentication
* TLS
* Certificate authentication
* SCRAM-style authentication
* API key authentication
* Connection limits
* Audit logs
* Security events
* Session management
* Password hashing using modern password hashing algorithms
* Secrets must never be stored in plaintext

Never implement custom cryptographic algorithms.

Use well-tested cryptographic libraries.

---

# 8. Encryption

Support:

### In transit

TLS 1.3 where supported.

### At rest

Provide optional encryption for:

* Database files
* WAL
* Backups
* Temporary files
* Sensitive metadata

Encryption keys must never be stored directly inside database data files.

Design a key-management interface supporting future integration with:

* AWS KMS
* GCP KMS
* Azure Key Vault
* HashiCorp Vault

---

# 9. Reliability

WDBX must prioritize data safety.

Implement:

* WAL
* Crash recovery
* Checksums
* Atomic filesystem operations
* Safe shutdown
* Automatic recovery
* Corruption detection
* Backup support
* Point-in-time recovery
* Incremental backups
* Restore verification

Never sacrifice durability merely to achieve benchmark numbers.

Provide configurable durability modes, with safe defaults.

---

# 10. Replication

Design replication as a first-class subsystem.

Support:

```text
Primary
   ↓
Replica
   ↓
Read Replicas
```

Future architecture should support:

* Streaming replication
* Logical replication
* Replication slots
* Automatic failover
* Replica monitoring
* Read scaling
* Multi-region replication
* Conflict detection
* Eventual consistency modes where explicitly requested

Do not claim distributed ACID behavior unless it is actually implemented and tested.

---

# 11. Horizontal Scaling

Architect WDBX so distributed functionality can be introduced without redesigning the entire engine.

Future-ready architecture:

```text
WDBX Cluster
│
├── Coordinator
├── Storage Nodes
├── Query Nodes
├── Replica Nodes
└── Metadata Service
```

Potential capabilities:

* Sharding
* Partitioning
* Distributed queries
* Distributed transactions
* Rebalancing
* Node discovery
* Health checking
* Automatic failover

Distributed functionality should be introduced incrementally.

Do not fake distributed functionality.

---

# 12. Vector Database Support

WDBX should support modern AI workloads.

Add native vector fields:

```sql
CREATE TABLE documents (
    id UUID PRIMARY KEY,
    content TEXT,
    embedding VECTOR(1536)
);
```

Support:

* Vector storage
* Vector indexing
* Cosine similarity
* Euclidean distance
* Inner product
* Approximate nearest neighbor search
* Metadata filtering
* Hybrid keyword + vector search

Example:

```sql
SELECT *
FROM documents
ORDER BY embedding <=> '[...]'
LIMIT 10;
```

Design this so future AI/ML features can be added without modifying the core SQL engine.

---

# 13. Geospatial Support

Design support for:

* Point
* LineString
* Polygon
* MultiPolygon
* GeoJSON
* Distance queries
* Bounding-box queries
* Spatial indexes

Example:

```sql
SELECT *
FROM locations
WHERE distance(location, point(90.4125, 23.8103)) < 5000;
```

---

# 14. API Layer

WDBX should expose multiple interfaces.

### Native wire protocol

Create a dedicated WDBX protocol.

### SQL

Provide a PostgreSQL-compatible layer where practical.

### REST API

Example:

```http
POST /api/v1/query
GET /api/v1/databases
GET /api/v1/tables
GET /api/v1/collections
```

### JSON API

Allow document-oriented applications to interact with WDBX naturally.

### Drivers

Design drivers for:

* Node.js
* TypeScript
* Python
* Go
* Rust
* Java
* PHP

Do not implement every driver immediately.

First create a stable protocol and one official driver.

---

# 15. CLI

Create a command-line client:

```bash
wdbx
```

Example:

```bash
wdbx connect localhost:5432
```

Commands:

```text
\databases
\connect
\tables
\collections
\describe
\indexes
\users
\roles
\replication
\stats
\backup
\restore
\help
\quit
```

---

# 16. Configuration

Create a clear configuration system.

Example:

```toml
[server]
host = "0.0.0.0"
port = 7432

[storage]
data_directory = "./data"
wal_directory = "./wal"

[memory]
shared_buffers = "512MB"

[security]
tls = true

[logging]
level = "info"
```

Use safe defaults.

Never require users to understand dozens of low-level settings just to start the database.

---

# 17. Observability

Build first-class observability.

Expose:

* Metrics
* Logs
* Query statistics
* Connection statistics
* Cache statistics
* WAL statistics
* Replication statistics
* Storage statistics
* Slow query logs
* Error tracking

Provide Prometheus-compatible metrics.

Example:

```text
wdbx_connections_total
wdbx_queries_total
wdbx_query_duration_seconds
wdbx_cache_hit_ratio
wdbx_wal_bytes_written
wdbx_replication_lag
```

---

# 18. Performance

Optimize for:

* Low latency
* High throughput
* Efficient memory usage
* Efficient disk I/O
* Parallel execution
* Query planning
* Index utilization
* Cache locality
* Batch operations
* Connection pooling

Do not make unsupported performance claims.

Every optimization must be benchmarked.

Create benchmark suites for:

```text
INSERT
UPDATE
SELECT
JOIN
Aggregation
Transactions
Document operations
JSON queries
Vector search
Concurrent workloads
Large datasets
```

Compare benchmark results against established databases only as measured experiments.

---

# 19. Concurrency

Design the engine for high concurrency.

Support:

* Multiple clients
* Concurrent transactions
* Background workers
* Parallel queries
* Connection pooling
* Lock management
* Deadlock detection
* Thread-safe internal components

Avoid unnecessary global locks.

Use fine-grained synchronization where practical.

---

# 20. Developer Architecture

Use a modular repository structure.

Suggested architecture:

```text
wdbx/
│
├── core/
├── parser/
├── sql/
├── nosql/
├── planner/
├── optimizer/
├── executor/
├── storage/
├── buffer/
├── wal/
├── transaction/
├── mvcc/
├── index/
├── document/
├── vector/
├── geo/
├── security/
├── replication/
├── networking/
├── protocol/
├── api/
├── cli/
├── observability/
├── backup/
├── recovery/
├── tests/
├── benchmarks/
├── docs/
└── tools/
```

Keep components independently testable.

---

# 21. Programming Language

Choose the implementation language based on engineering requirements.

Primary preference:

**Rust**

because WDBX requires:

* Memory safety
* Concurrency
* Performance
* Low-level storage control
* Strong type safety
* Modern tooling

Do not use unsafe Rust unless necessary.

Every unsafe section must include a clear safety justification.

Use C/C++ only when there is a strong technical reason.

---

# 22. Testing

Create a serious testing strategy.

Required:

* Unit tests
* Integration tests
* SQL compatibility tests
* Document tests
* Transaction tests
* Crash-recovery tests
* Concurrency tests
* Fuzz tests
* Parser fuzzing
* Storage fuzzing
* Network fuzzing
* Security tests
* Performance regression tests
* Backup/restore tests

Important:

The database must be able to survive forced process termination during writes and recover consistently.

Create automated crash testing.

---

# 23. Security Testing

Include protection against:

* SQL injection
* Parser vulnerabilities
* Memory corruption
* Buffer overflow
* Integer overflow
* Authentication bypass
* Authorization bypass
* Privilege escalation
* Path traversal
* Malicious documents
* Resource exhaustion
* Denial-of-service conditions
* Unsafe deserialization

Never trust client input.

All external input must be validated.

---

# 24. Resource Protection

Implement configurable limits for:

* Connections
* Query execution time
* Memory usage
* Result size
* Document size
* Transaction size
* Statement size
* Concurrent queries
* Temporary storage
* Background workers

Prevent one client from consuming all system resources.

---

# 25. Backup System

Provide:

```bash
wdbx backup
wdbx restore
```

Support:

* Full backups
* Incremental backups
* WAL archiving
* Point-in-time recovery
* Backup verification
* Encrypted backups
* Compression

A backup is not considered successful until it can be verified.

---

# 26. Migration System

Provide migration tooling.

Example:

```bash
wdbx migrate create users
wdbx migrate up
wdbx migrate down
wdbx migrate status
```

Design migration metadata carefully so migrations remain deterministic and recoverable.

---

# 27. Compatibility

Where practical, provide PostgreSQL-compatible SQL syntax.

However:

Do not advertise full PostgreSQL compatibility until compatibility tests prove it.

Create a compatibility matrix documenting:

```text
Supported
Partially Supported
Not Supported
WDBX-specific
```

---

# 28. WDBX-Specific Features

WDBX should have features that distinguish it from traditional databases.

Potential native features:

### Unified SQL + Document Model

One engine for relational and document data.

### Native Vector Storage

AI workloads without requiring a separate vector database.

### Unified Transactions

SQL and document operations inside the same ACID transaction.

### Adaptive Storage

Choose optimized storage structures based on workload.

### Automatic Index Advisor

Analyze query patterns and recommend indexes.

### Query Intelligence

Expose query plans and performance insights.

### Built-in Observability

Metrics and diagnostics without requiring external extensions.

### Safe-by-default Security

Secure configuration should be the default.

---

# 29. Webda Studio Ownership

The database project must be branded as:

**WDBX**

**Webda Database eXchange**

Copyright and project ownership:

**Webda Studio**

Website:

```text
https://webda.in
```

Do not use PostgreSQL branding, logos, trademarks, or project identity for WDBX.

Clearly distinguish WDBX from PostgreSQL and other database projects.

---

# 30. Open Source

Prepare WDBX as a professional open-source project.

Include:

```text
LICENSE
README.md
CONTRIBUTING.md
SECURITY.md
CODE_OF_CONDUCT.md
CHANGELOG.md
ROADMAP.md
ARCHITECTURE.md
```

The license must be selected after reviewing the licenses of all dependencies and any reused source code.

Do not copy third-party code without verifying its license compatibility.

Maintain a clear NOTICE/attribution file where required.

---

# 31. Development Strategy

Do NOT attempt to build every feature immediately.

Build WDBX incrementally.

## Phase 1

Create:

* Storage engine
* WAL
* Basic transactions
* Basic SQL parser
* Basic SQL executor
* Tables
* Basic indexes
* CLI

## Phase 2

Add:

* MVCC
* Query optimizer
* Joins
* Constraints
* Views
* JSON
* Document collections

## Phase 3

Add:

* SQL + NoSQL unified queries
* Advanced indexes
* Full-text search
* Replication
* Backup/restore
* Observability

## Phase 4

Add:

* Vector engine
* Geospatial engine
* Parallel query execution
* Advanced optimizer
* Horizontal scaling

## Phase 5

Add:

* Distributed transactions
* Multi-region replication
* Automatic failover
* Advanced cluster management

---

# 32. Engineering Rules

Follow these rules throughout development:

1. Never sacrifice data integrity for benchmark performance.

2. Never claim a feature is production-ready until automated tests prove it.

3. Never implement cryptography yourself.

4. Never silently lose data.

5. Never silently corrupt data.

6. Never hide errors.

7. Never use insecure defaults.

8. Never introduce unsafe memory operations without justification.

9. Never duplicate large subsystems unnecessarily.

10. Prefer modular architecture.

11. Prefer measurable performance improvements.

12. Add regression tests for every major bug.

13. Document architectural decisions.

14. Keep public APIs stable once released.

15. Maintain backward compatibility whenever practical.

16. Make failure recovery a first-class design requirement.

17. Treat security boundaries as explicit architectural boundaries.

---

# 33. First Deliverable

Do not immediately generate millions of lines of code.

First produce:

1. WDBX architecture document
2. Component dependency graph
3. Storage-engine design
4. Transaction/MVCC design
5. SQL parser design
6. NoSQL document model design
7. Query planner design
8. Security architecture
9. Wire protocol specification
10. Repository structure
11. Development roadmap
12. Testing strategy
13. Benchmark strategy
14. License/dependency analysis
15. Minimal WDBX prototype

Then implement the system incrementally.

Every major subsystem must compile, run, and have tests before moving to the next subsystem.

---

# Final Objective

Build **WDBX — Webda Database eXchange**, a serious modern database engine combining:

**SQL + NoSQL + ACID + MVCC + JSON + Vector + Search + Geospatial + Replication + Security + Observability**

into one modular database platform.

The goal is not to make a flashy database demo.

The goal is to engineer a database foundation that can eventually power Webda Studio products, SaaS applications, AI systems, APIs, analytics platforms, and high-concurrency production workloads.

Prioritize correctness first, security second, maintainability third, and performance through measurable engineering rather than unsupported claims.



and aslo follow idea\rules.md file.