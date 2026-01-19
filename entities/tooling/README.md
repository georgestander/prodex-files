# entities/tooling/

Local tooling configs and allowlists for this workspace.

- `entities/tooling/new_session.sh` creates `entities/sessions/<id>/` with `session.json` + `summary.md`.
- `entities/tooling/new_entity.sh` creates `entities/<type>/<slug>/` with `entity.json` + `notes.md`.
- `entities/tooling/codex_ps.sh` starts Codex in this repo and runs a read-only rehydration prompt.
