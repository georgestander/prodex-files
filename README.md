# prodex

A file-first, primitives-only personal agent scaffold (the "system" repo).

This repo is meant to be used as a base/framework that a personal workspace can adopt.

Key ideas:
- Filesystem is the UI.
- Memory is reconstructed from `.agent/STATE.json` + `.agent/LOG.ndjson`.
- Sessions are durable artifacts under `sessions/`.
- Entity-scoped workspaces live under `entities/`.

Start Codex with a read-only rehydrate prompt:
- `tooling/codex_ps.sh`

See `WORKFLOW.md` for how this stays separate from your personal instance repo.
