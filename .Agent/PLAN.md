# WDBX Development Plan

## Completed
- Initial project ideas and rule constraints defined.
- `.Agent` directory structure initialized.
- Shifted strategy: Moved PostgreSQL source to `reference/postgres/` and established `wdbx_engine/` as the working directory to modify the C codebase.

## In Progress
- Establish multi-agent workflow and tooling.
- Re-branding and initialization of the `wdbx_engine/` to detach from Postgres identity.

## Next
- Execute iterative multi-agent loop: Implement, Test, Review, Document, Repeat.
- Start integrating native NoSQL collections.
- Start integrating Vector fields into the engine parser and storage layer.

## Future
- Hybrid query architecture bridging relational tables and document collections.

---

## Milestones

### Phase 1 — Engine Foundation & Rebranding
* [x] Fork and establish `wdbx_engine/` from the PostgreSQL reference.
* [x] Rebrand core binaries (`wdbx`, etc.).
* [x] Verify the build system works for the new engine.
* [x] Update CLI commands.

### Phase 2 — Hybrid SQL + NoSQL (COMPLETED)
* [x] Introduce JSON/Document collections natively alongside SQL tables (`CREATE COLLECTION` grammar implemented).
* [x] Implement atomic document updates (JSONB subscripting verified native and atomic).
* [x] Implement document indexes (GIN and expression B-tree indexing on document fields verified).

### Phase 3 — Vector & Geo Extensions
* [x] Implement native Vector fields (`VECTOR(1536)`).
* [x] Implement Cosine similarity and ANN indexing.
* [x] Extend Geo features (GeoJSON serialization/deserialization natively via `wdbx_geo`).
* [x] Implement auto-generated UUIDv4 and ULID data types (`gen_random_uuid()` & `wdbx_ulid`).

### Phase 4 — Distributed & High-Performance Scaling
* [x] Parallel query execution improvements (Default configs optimized).
* [x] Sharding and Node cluster capabilities (Native `wdbx_cluster` via `postgres_fdw`).

### Phase 5 — Replication & Distributed Architecture
* [x] Implement logical replication and distributed state management wrappers (`wdbx_replication`).
