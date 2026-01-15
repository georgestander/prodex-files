# prodex

A file-first, primitives-only personal agent scaffold.

This repo is a **framework**: it defines conventions, templates, and a minimal filesystem-based “operating system” for an agent.

It is **not** your personal memory by itself. “Memory” is created as you use it (via logs, state, sessions, and entity notes).

## How it "remembers"

Codex (like any chat) starts fresh on restart unless you **rehydrate** context from files.

In prodex, memory is explicit and inspectable:
- **Rules**: `.agent/POLICY.md`
- **Current state (small)**: `.agent/STATE.json`
- **Event log (append-only)**: `.agent/LOG.ndjson`
- **Run artifacts**: `sessions/<session_id>/...`
- **Entity-scoped meaning**: `entities/<type>/<slug>/notes.md`

## First run (recommended)

1) Open this repo in a terminal.
2) Start Codex and send a read-only rehydrate prompt *as your first message*.

Copy/paste this as the first prompt:

REHYDRATE (READ-ONLY):
- Do NOT edit/write/create/move/delete any files.
- Do NOT run commands that mutate state.
- Only read files to rebuild context.

Steps:
- Read .agent/POLICY.md first.
- Read .agent/STATE.json next.
- Read each path in STATE.json.active.context_paths (if present).
- Scan .agent/LOG.ndjson for recent events relevant to STATE.json.active.project (or last_session).

Output:
- Summarize: (1) what we are doing, (2) what is active now, (3) what to do next.
- Then ask me what I want to do.

## What to customize

- `.agent/POLICY.md`: your guardrails and operating rules.
- `.agent/STATE.json`: what files to load first (`active.context_paths`).
- `sessions/_template/`: what each run should produce (`session.json`, `summary.md`).
- `entities/_template/`: what an entity folder looks like.

## What should stay empty/clean (framework principle)

If you publish this repo publicly, avoid committing:
- real personal logs (`.agent/LOG.ndjson` should stay empty or contain only generic examples)
- real personal sessions under `sessions/<id>/...` (templates are fine)
- secrets/credentials

## Workflow

See `WORKFLOW.md` for how to keep this framework separate from a personal “instance” repo.
