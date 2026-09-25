# WDBX Multi-Agent Operating Protocol

WDBX development operates on a **continuous looping and iterative multi-agent workflow**.

## The Autonomous Implementation Loop
When an agent is assigned a task, it must enter a continuous loop following these steps:

1. **Context Initialization**:
   - Read `.Agent/AGENT_MEM.md`, `ARCHITECTURE.md`, `PLAN.md`, `STRUCTURE.md`, and `SKILLS.md`.
   - Inspect the codebase in `wdbx_engine/` to understand existing C architecture.
2. **Implementation**:
   - Plan the change.
   - Implement the smallest correct change by modifying the `wdbx_engine/` codebase.
3. **Verification**:
   - Build the engine using the existing C build tools (e.g., `make`, `configure`, or `meson`).
   - Run tests. Ensure no regressions.
4. **Documentation Sync**:
   - Update `AGENT_MEM.md` with new insights or bugs.
   - Update `ARCHITECTURE.md` if subsystems change.
   - Update `PLAN.md` to move tasks to Completed.
5. **Iteration / Completion**:
   - Continue the loop until the assigned goal in `PLAN.md` is fully completed.
   - **Only when the planned implementation is fully completed and all required tests pass**, the autonomous implementation loop should stop and wait for further instructions from the user.

## Multi-Agent Setup
- Agents can spawn specialized sub-agents (e.g., a "Security Agent" or a "C/C++ Performance Agent") using the existing skills and multi-agent systems.
- Every agent must respect the `.Agent/` directory as the ultimate source of truth for project state and strategy.
