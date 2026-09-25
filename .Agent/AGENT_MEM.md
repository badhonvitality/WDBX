# WDBX Agent Memory

## Project Identity
- **Name:** WDBX (Webda Database eXchange)
- **Owner:** Webda Studio
- **Goal:** Production-grade hybrid database (SQL + NoSQL/document + Vector + Geo).
- **Core Architecture Base:** Modifying the PostgreSQL C source code.

## Current Architecture Decisions
- WDBX is built by modifying the existing PostgreSQL implementation and its C architecture rather than rewriting from scratch in Rust.
- WDBX will inherit PostgreSQL's robust storage engine, transaction management (MVCC), and replication mechanisms, extending them natively with new features like hybrid NoSQL collections, Vector search, and Geospatial processing.
- The original PostgreSQL source is kept intact in `reference/postgres/` for baseline reference, while the working implementation for WDBX is inside the `wdbx_engine/` directory.
- The `.Agent/` directory serves as the persistent brain. It must be strictly separated from the implementation files.

## Multi-Agent Looping Workflow
- We have adopted an iterative multi-agent workflow. Agents will iteratively:
  1. Inspect the plan (`PLAN.md`).
  2. Implement features in `wdbx_engine/`.
  3. Test and review the changes.
  4. Update `.Agent/` memory and documentation.
  5. Repeat until the current milestone is complete.

## Important Technical Decisions
- Use and modify the PostgreSQL source code, programming language (C), and tooling.
- Add new features such as document collections and vectors natively into the engine.

## Decisions We Must Not Reverse Without Reason
- Do not build WDBX as a mere wrapper or extension over Postgres; WDBX is an independently branded and modified engine.
- The agent loop must NOT be broken or marked complete until full test passes are achieved.

## Important TODOs
- **Phase 1 Complete**: Rebranded PostgreSQL binaries to WDBX. Build system fixed.
- **Phase 2 Complete**: Introduced `CREATE COLLECTION <name>` syntax. Verified native JSONB subscripting updates and GIN/Expression indexes.
- **Phase 3 Complete**: Integrated native Vector capabilities via `pgvector`, created native GeoJSON extensions (`wdbx_geo`), and added ULID support (`wdbx_ulid`) alongside native UUIDv4.
- **Phase 4 Complete**: Optimized default configs for parallel execution and created `wdbx_cluster` extension for native declarative sharding.
- **Phase 5 Complete**: Implemented `wdbx_replication` extension wrapping native logical replication (Publications & Subscriptions).
- **Roadmap Complete**: All 5 Initial Phases are complete! The WDBX database engine is built natively from PG20devel with Vector, Geo, ULID, NoSQL (JSON), Cluster, and Replication extensions seamlessly bundled and tested.

## Security Notes
- Maintain PostgreSQL's security standards. Secrets must never be stored in plaintext.
