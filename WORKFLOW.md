# Workflow

This repo (`prodex`) is the **base system/framework** for a file-first personal agent.

A separate repo (your **instance**) holds your real SSOT and personal content.

## System vs Instance

**prodex (system/framework)**
- Conventions + templates + helper scripts.
- Should stay generic (no personal tasks, no private logs, no credentials).

**personal instance (e.g. `personal_software`)**
- Your real `.agent/*` SSOT and `entities/` content (notes/tasks/projects/prompts/sessions/tooling/approvals + other entity types).

## Updating prodex from an instance

When you improve the system while working in your instance repo:

1) Make the change in the instance repo (usually under one of these paths):
   - `entities/tooling/`
   - `entities/sessions/_template/`
   - `entities/_template/`
   - `entities/README.md`
   - `entities/sessions/README.md`
   - `entities/prompts/` (only if you want that prompt template in the framework)

2) Copy the relevant file(s) into `prodex`.

3) Commit + tag a new version in `prodex`.

## What should NOT be copied into prodex

- `.agent/LOG.ndjson` from your instance (keep prodex log empty or minimal)
- `.agent/AGENT.md` with personal identity/state
- `.agent/STATE.json` with personal pointers
- Any real personal content under `entities/` (projects/notes/tasks/etc) — templates are fine
- Any real `entities/sessions/<id>/` from your instance (templates are fine)
- Secrets/credentials

## Roadmap

See `ROADMAP.md` for the scaffold → agent OS plan.
