# WDBX Engine

WDBX is a next-generation hybrid database engine blending the raw power of robust SQL with the extreme flexibility of NoSQL and high-dimensional AI Vector search. Built natively on the robust foundation of PostgreSQL, WDBX is designed to be the ultimate converged database for modern AI and Web applications.

## Key Features

- **Hybrid SQL/NoSQL**: Native `CREATE COLLECTION` syntax for seamless JSON document management with transparent GIN indexing.
- **AI Vector Search**: Natively bundled `pgvector` for `<->` Cosine and L2 high-dimensional similarity search.
- **Native GeoJSON**: High-performance spatial indexing leveraging custom `wdbx_geo` mapping to native geometry types.
- **Native ULID**: High-throughput distributed monotonic ID generation via `wdbx_ulid`.
- **Declarative Auto-Sharding**: Transparent multi-node sharding via `wdbx_cluster`.
- **Logical Replication**: Instant publications and subscriptions out-of-the-box via `wdbx_replication`.

## Getting Started

### Windows (MSYS2/UCRT64)
1. Install MSYS2 and the UCRT64 toolchain.
2. Run `meson setup build` inside `wdbx_engine`.
3. Run `ninja -C build install`.

### Linux (Ubuntu/Debian)
1. Install dependencies: `sudo apt install meson ninja-build gcc flex bison libreadline-dev zlib1g-dev`
2. Run `meson setup build` inside `wdbx_engine`.
3. Run `ninja -C build install`.

## Initializing a Database
```bash
wdbx-init -D my_db
wdbx-ctl -D my_db -l logfile start
wdbx postgres -c "CREATE EXTENSION vector;"
wdbx postgres -c "CREATE EXTENSION wdbx_ulid;"
wdbx postgres -c "CREATE COLLECTION users;"
```

## Community & Contributing
Please see our [Contributing Guidelines](CONTRIBUTING.md) and [Code of Conduct](CODE_OF_CONDUCT.md).

## License
WDBX is released under the [MIT License](LICENSE). 
Copyright (c) 2026 Webda Studio and badhonvitality. All Rights Reserved.
