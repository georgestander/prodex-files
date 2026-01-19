# entities/

Entity-scoped workspaces (agent-native convention): one folder per real-world “thing” (project, person, client, vendor, system, concept).

Why:
- Gives “a place to work” that isn’t just chat.
- Keeps memory inspectable: the folder *is* the memory surface for that entity.
- Lets spaces emerge as needed: create a new entity folder when a “thing” shows up repeatedly.

Recommended structure per entity:
- `entities/<type>/<slug>/entity.json` (machine index)
- `entities/<type>/<slug>/notes.md` (compacted meaning; human-first)
- `entities/<type>/<slug>/sources/` (reference material)
- `entities/<type>/<slug>/artifacts/` (outputs)

Examples:
- `entities/projects/personal_agent/`
- `entities/people/hano_gardener/`
- `entities/vendors/cloudflare/`

Helper:
- `entities/tooling/new_entity.sh`

Workspace convention in this repo:
- The workspace “surfaces” are also stored under `entities/`:
  - `entities/notes/`, `entities/tasks/`, `entities/prompts/`, `entities/projects/`, `entities/sessions/`, `entities/tooling/`, `entities/approvals/`.
