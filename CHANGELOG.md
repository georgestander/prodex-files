# Changelog

## v0.2.0 — 2026-01-19

### Breaking changes
- Workspace is now **entities-first**: move `notes/`, `tasks/`, `projects/`, `prompts/`, `sessions/`, `tooling/`, and `approvals/` under `entities/`.
- Entrypoint changed: run `./entities/tooling/codex_ps.sh`.

### Added
- `.agent/REGISTRY.json` as canonical discoverability for tools and workspace surfaces.
- File-based approval queue under `entities/approvals/` (`pending/`, `approved/`, `executed/`, `rejected/`).
- `WORKSPACE_SPEC.md` and `ROADMAP.md` to document the scaffold.
- `.gitignore` defaults to keep `entities/sessions/` and approval artifacts out of commits.

### Migration notes (from v0.1.x)
- Update any hardcoded paths in scripts and docs to the new `entities/...` locations.
- Update `.agent/STATE.json.active.context_paths` if you keep a curated boot context.
