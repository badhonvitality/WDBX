# WDBX Agent Skills

This document describes the engineering capabilities expected from the autonomous agent working on WDBX.

## Rust Systems Programming
- **Required knowledge:** Memory safety, lifetimes, concurrency, `unsafe` Rust (only with strong justification), profiling, testing.
- **Tools:** Cargo, Clippy, rustfmt.
- **Safety considerations:** Use safe abstractions. Unsafe blocks must include documented safety rationales.

## Database Architecture
- **Required knowledge:** Relational and document models, query lifecycles, storage engine architecture, distributed systems.

## Storage Engine Development
- **Required knowledge:** Page-based layout, buffer management, eviction policies, file I/O operations, checksum verification.

## WAL Design & Recovery
- **Required knowledge:** Write-Ahead Logging mechanisms, crash consistency, checkpoints, physiological logging.

## Transaction Processing & MVCC
- **Required knowledge:** Multi-Version Concurrency Control, ACID properties, isolation levels, lock management, deadlock detection.

## Query Engine
- **Required knowledge:** SQL parser development, Abstract Syntax Trees (AST), semantic analysis, cost-based query optimization, query execution pipelines (Volcano model, vectorized execution).

## NoSQL / Document Storage
- **Required knowledge:** Schemaless data structures, JSON/BSON, document indexing, schema migration strategies.

## Advanced Indexing
- **Required knowledge:** B-Trees, Hash indexes, GIN-style indexes, spatial indexing, Vector similarity search (Cosine, Euclidean).

## Security Engineering
- **Required knowledge:** Role-Based Access Control (RBAC), authentication (SCRAM, TLS), secure password hashing, cryptography safety.

## Performance & Concurrency
- **Required knowledge:** Fine-grained locking, lock-free structures, thread pools, memory profiling, latency optimization.

## Testing & Observability
- **Required knowledge:** Unit testing, fuzzing, property-based testing, benchmarking (Criterion), metrics extraction (Prometheus).
