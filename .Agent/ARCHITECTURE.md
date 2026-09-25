# WDBX Architecture

## System Overview
WDBX (Webda Database eXchange) is a production-grade, open-source, high-performance database management system supporting both relational SQL workloads and native NoSQL/document workloads. Built primarily in Rust, it aims to offer a unified hybrid architecture that combines the strengths of systems like PostgreSQL with modern document-oriented databases.

## Core Architecture
WDBX is designed with a modular architecture enabling independent testing and clear separation of concerns.

### Storage Architecture
- **Purpose:** Provide durable, efficient page-based storage for both relational and document data.
- **Responsibilities:** Page management, I/O operations, background maintenance, checksums, corruption detection.
- **Current implementation status:** Planning phase. 

### Buffer Manager
- **Purpose:** Manage in-memory pages to reduce disk I/O.
- **Responsibilities:** Buffer pool management, page eviction, pinning.
- **Current implementation status:** Planning phase.

### WAL Architecture
- **Purpose:** Ensure data durability and crash recovery (Write-Ahead Logging).
- **Responsibilities:** Logging all changes before they hit data files, atomic commits, crash recovery.
- **Current implementation status:** Planning phase.

### Transaction System & MVCC
- **Purpose:** Provide ACID guarantees and concurrent access.
- **Responsibilities:** Multi-Version Concurrency Control (MVCC), snapshot isolation, deadlock detection, lock management, atomic commits, rollback.
- **Current implementation status:** Planning phase.

### SQL Engine
- **Purpose:** Provide a powerful PostgreSQL-compatible SQL interface.
- **Components:**
  - **Query Parser & AST:** Parses SQL strings into Abstract Syntax Trees.
  - **Semantic Analyzer:** Validates the AST against the schema.
  - **Query Planner & Optimizer:** Generates cost-based optimal execution plans.
  - **Query Executor:** Executes plans against the storage layer.
- **Current implementation status:** Planning phase.

### NoSQL/Document Engine
- **Purpose:** Provide native schemaless document storage.
- **Responsibilities:** Managing JSON/BSON-style data, document indexing, atomic updates, aggregation pipelines.
- **Current implementation status:** Planning phase.

### Index Subsystem
- **Purpose:** Modular indexing for efficient data retrieval.
- **Supported types (planned):** B-Tree, Hash, Document indexes, Full-text, Vector, Geospatial.
- **Current implementation status:** Planning phase.

### Vector & Geospatial Subsystems
- **Purpose:** Native support for modern AI/ML vector search and geographic data.
- **Current implementation status:** Planning phase.

### Security
- **Purpose:** Provide first-class security features.
- **Responsibilities:** RBAC, authentication, TLS, encryption at rest.
- **Current implementation status:** Planning phase.

### Observability
- **Purpose:** Provide insights into database performance.
- **Responsibilities:** Metrics, logs, query/cache statistics.
- **Current implementation status:** Planning phase.

### API Layer & CLI
- **Purpose:** Interfaces for clients to connect.
- **Responsibilities:** Native wire protocol, PostgreSQL-compatible layer, REST/JSON API, `wdbx` CLI tool.
- **Current implementation status:** Planning phase.
