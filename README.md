<p align="center">
  <img src="assets/prodex.svg" alt="prodex" width="220" />
</p>

# prodex

A file-first, primitives-only personal agent scaffold.

This repo is a **framework**: it defines conventions, templates, and a minimal filesystem-based “operating system” for an agent.

It is **not** your personal memory by itself. “Memory” is created as you use it (via logs, state, sessions, and entity notes).

## Install Codex CLI

Prodex is designed to be run with **OpenAI Codex CLI**.

- Docs: https://developers.openai.com/codex
- Source: https://github.com/openai/codex
- npm package: https://www.npmjs.com/package/@openai/codex

Install via npm:
```sh
npm install -g @openai/codex
codex --version
```

## Authenticate (ChatGPT sign-in or API key)

### ChatGPT sign-in

Run:
```sh
codex login
```

Check status:
```sh
codex login status
```

If you’re on a remote machine without a browser:
```sh
codex login --device-auth
```

### API key

Pipe `OPENAI_API_KEY` into Codex:
```sh
printenv OPENAI_API_KEY | codex login --with-api-key
```

## Quick start (recommended)

From the repo root:
```sh
./entities/tooling/codex_ps.sh
```

This starts Codex in this repo and sends a **read-only rehydrate** prompt first, so the agent loads the SSOT files before doing anything else.

## How it "remembers"

Codex (like any chat) starts fresh on restart unless you **rehydrate** context from files.

In prodex, memory is explicit and inspectable:
- **Rules**: `.agent/POLICY.md`
- **Current state (small)**: `.agent/STATE.json`
- **Registry (discoverability)**: `.agent/REGISTRY.json`
- **Event log (append-only)**: `.agent/LOG.ndjson`
- **Run artifacts**: `entities/sessions/<session_id>/...`
- **Entity-scoped meaning**: `entities/<type>/<slug>/notes.md`

For identity-bearing actions (send/post/publish), use an approval queue:
- `entities/approvals/pending/` → `entities/approvals/approved/` → `entities/approvals/executed/`

Workspace contract: `WORKSPACE_SPEC.md`.

## First run (manual rehydrate prompt)

If you don’t want to use `./entities/tooling/codex_ps.sh`, start Codex and send this as your first message:

```text
REHYDRATE (READ-ONLY):
- Do NOT edit/write/create/move/delete any files.
- Do NOT run commands that mutate state.
- Only read files to rebuild context.

Steps:
- Read .agent/POLICY.md first.
- Read .agent/STATE.json next.
- Read .agent/REGISTRY.json next (canonical discoverability).
- Read each path in STATE.json.active.context_paths (if present).
- Scan .agent/LOG.ndjson for recent events relevant to STATE.json.active.project (or last_session).

Output:
- Summarize: (1) what we are doing, (2) what is active now, (3) what to do next.
- Then ask me what I want to do.
```

## What to customize

- `.agent/POLICY.md`: your guardrails and operating rules.
- `.agent/STATE.json`: what files to load first (`active.context_paths`).
- `.agent/REGISTRY.json`: canonical tool + workspace discoverability.
- `entities/sessions/_template/`: what each run should produce (`session.json`, `summary.md`).
- `entities/_template/`: what an entity folder looks like.

## What should stay empty/clean (framework principle)

If you publish this repo publicly, avoid committing:
- real personal logs (`.agent/LOG.ndjson` should stay empty or contain only generic examples)
- real personal sessions under `entities/sessions/<id>/...` (templates are fine)
- secrets/credentials

## Workflow

See `WORKFLOW.md` for how to keep this framework separate from a personal “instance” repo.

## Roadmap

See `ROADMAP.md`.
