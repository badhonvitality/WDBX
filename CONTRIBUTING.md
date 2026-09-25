# Contributing to WDBX

First off, thank you for considering contributing to WDBX! 

## How Can I Contribute?

### Reporting Bugs
- Use the GitHub Issue Tracker to report bugs.
- Describe the bug clearly, including steps to reproduce, what you expected to happen, and what actually happened.
- Include your OS, compiler version, and WDBX version.

### Suggesting Enhancements
- Open an issue describing the enhancement.
- Explain why this enhancement would be useful to most WDBX users.
- If you are planning to write the code yourself, outline your proposed architecture or implementation strategy.

### Code Contributions
1. Fork the repository and create your branch from `main`.
2. Ensure you can build the engine using `meson setup build` and `ninja -C build`.
3. If you've added code that should be tested, add tests to the `src/test/` directory.
4. Ensure the test suite passes (`ninja -C build test`).
5. Issue a pull request!

## Architecture
WDBX uses a continuous multi-agent implementation loop documented in `.Agent/MULTI_AGENT_WORKFLOW.md`. Review the `.Agent/` directory for our roadmap and architectural decisions.

WDBX is built on PostgreSQL natively. Extensions are developed in `wdbx_engine/contrib/`.

## Coding Style
We generally adhere to the upstream PostgreSQL C coding style. Use `pgindent` if you are modifying core engine files.
