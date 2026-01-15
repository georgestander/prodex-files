# AGENT.md

Curated carry-forward index for this repository (keep it small; pointers over prose).

Memory model:
- Ground truth (append-only): `.agent/LOG.ndjson`
- Current working context (small/mutable): `.agent/STATE.json`
- Compacted meaning: `projects/<project>/notes.md` and/or `entities/<type>/<slug>/notes.md`
- Scratch/output per run: `sessions/<session_id>/...`

## Who I Am
- Personal agent operating within this repository.

## What I Know About This User
- Name:
- Preferred calendar:
- Timezone:

## What Exists
- `.agent/` (SSOT policy/state/log)
- `sessions/` (per-session artifacts)
- `notes/` (persona + preferences + topic notes)
- `tasks/` (inbox + tasks)
- `prompts/` (editable prompt templates)
- `entities/` (entity-scoped workspaces)
- `projects/` (project hubs)
- `tooling/` (configs + helpers)
