<div align="center">
  <img src="https://img.icons8.com/color/120/000000/database.png" alt="WDBX Logo" width="120" />
  
  # WDBX Engine
  
  **The Next-Generation Hybrid AI Database Engine**

  [![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
  [![Build Status](https://github.com/badhonvitality/WDBX/actions/workflows/build.yml/badge.svg)](https://github.com/badhonvitality/WDBX/actions)
  [![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux-lightgrey)](#)
  [![Language](https://img.shields.io/badge/Language-C%20%7C%20C%2B%2B%20%7C%20SQL-green)](#)
  [![Version](https://img.shields.io/badge/Version-v1.0.0-orange)](https://github.com/badhonvitality/WDBX/releases)
</div>

<br/>

WDBX is a next-generation hybrid database engine blending the raw power of robust SQL with the extreme flexibility of NoSQL and high-dimensional AI Vector search. Built natively on the robust foundation of PostgreSQL, WDBX is designed to be the ultimate converged database for modern AI and Web applications.

## 🛠️ Programming Languages
WDBX is built for raw speed and reliability using industry-standard systems languages:
- **C / C++**: Core database engine, query planner, and vector extension (`pgvector`, `wdbx_ulid`).
- **SQL**: Standard transactional querying, PL/pgSQL procedures, and extension schemas.
- **Perl & Python**: Automation, CI/CD pipeline code generation, and build tools.

## 💡 Use Cases
WDBX is highly optimized for modern application workloads:
- **AI & RAG Applications**: Store LLM embeddings and perform lightning-fast Cosine/L2 similarity searches for Retrieval-Augmented Generation.
- **Dynamic Web Apps (NoSQL)**: Store unstructured document data using `CREATE COLLECTION` without rigid schemas.
- **High-Throughput Distributed Systems**: Utilize built-in `wdbx_ulid` for monotonic ID generation across multiple shards avoiding primary-key collisions.
- **Location-Based Services**: Leverage the `wdbx_geo` engine for mapping, spatial indexing, and GeoJSON operations.

## ✨ Key Features

- **Hybrid SQL/NoSQL**: Native `CREATE COLLECTION` syntax for seamless JSON document management with transparent GIN indexing.
- **AI Vector Search**: Natively bundled `pgvector` for `<->` Cosine and L2 high-dimensional similarity search.
- **Native GeoJSON**: High-performance spatial indexing leveraging custom `wdbx_geo` mapping to native geometry types.
- **Native ULID**: High-throughput distributed monotonic ID generation via `wdbx_ulid`.
- **Declarative Auto-Sharding**: Transparent multi-node sharding via `wdbx_cluster`.
- **Logical Replication**: Instant publications and subscriptions out-of-the-box via `wdbx_replication`.

## 🚀 Getting Started

### Windows (MSYS2/UCRT64) or Pre-built Installer
The easiest way on Windows is to download our **[Latest Release](https://github.com/badhonvitality/WDBX/releases)** and run `WDBX-Windows-Installer.exe`.

To build from source:
1. Install MSYS2 and the UCRT64 toolchain.
2. Run `meson setup build` inside `wdbx_engine`.
3. Run `ninja -C build install`.

### Linux (Ubuntu/Debian)
Download the `WDBX-Linux.tar.gz` from our **[Releases](https://github.com/badhonvitality/WDBX/releases)** page or build from source:
1. Install dependencies: `sudo apt install meson ninja-build gcc flex bison libreadline-dev zlib1g-dev`
2. Run `meson setup build` inside `wdbx_engine`.
3. Run `ninja -C build install`.

## 💻 Initializing a Database
```bash
wdbx-init -D my_db
wdbx-ctl -D my_db -l logfile start
wdbx postgres -c "CREATE EXTENSION vector;"
wdbx postgres -c "CREATE EXTENSION wdbx_ulid;"
wdbx postgres -c "CREATE COLLECTION users;"
```

## 📜 Changelog (Recent Logs)
- **v1.0.0**: 
  - Fully automated CI/CD pipeline across Windows & Linux.
  - Windows MSI/EXE installer via Inno Setup.
  - Resolved `generate-lwlocknames.pl` CRLF parsing errors on Windows by enforcing `.gitattributes`.
  - Disabling readline on MSYS2 to bypass Mingw-w64 header issues.
  - Bundled `vector` and `wdbx_ulid` native extensions dynamically linked on Windows.

## 🤝 Community & Contributing
Please see our [Contributing Guidelines](CONTRIBUTING.md) and [Code of Conduct](CODE_OF_CONDUCT.md).

## ⚖️ License
WDBX is released under the [MIT License](LICENSE). 
Copyright (c) 2026 **Webda Studio** and **badhonvitality**. All Rights Reserved.
