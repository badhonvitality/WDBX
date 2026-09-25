# WDBX Repository Structure

This file describes the actual current structure of the repository.

```text
wdbx/
├── .Agent/               # Autonomous agent memory and architectural context
│   ├── ARCHITECTURE.md
│   ├── PLAN.md
│   ├── STRUCTURE.md
│   ├── AGENT_MEM.md
│   ├── MULTI_AGENT_WORKFLOW.md
│   └── SKILLS.md
│
├── idea/                 # Project genesis and core ideas
│
├── reference/            # Intact original PostgreSQL source for deep reference
│   └── postgres/
│
└── wdbx_engine/          # The actual working C codebase (forked from Postgres)
    ├── src/              # Core database engine code
    ├── config/           # Configuration files
    ├── contrib/          # Extensions and contributions
    ├── doc/              # Documentation
    └── ...               # (Makefiles, Meson build scripts, etc.)
```

*Note: WDBX is built by modifying the `wdbx_engine/` codebase, which was initialized from PostgreSQL. The `reference/postgres/` directory is kept un-modified for baseline reference.*
