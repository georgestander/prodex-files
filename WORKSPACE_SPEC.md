# Workspace Specification (Prodex)

This document describes the **recommended filesystem contract** for a Prodex workspace (an “instance” repo).

Goal: a fresh Codex session can deterministically understand what exists by reading **policy + state + registry**, and can safely request approvals for identity-bearing actions.

## Required SSOT files

- `.agent/POLICY.md` — rules + guardrails
- `.agent/STATE.json` — small mutable “what to load” + active work pointers
- `.agent/AGENT.md` — curated carry-forward (keep small)
- `.agent/LOG.ndjson` — append-only event log
- `.agent/REGISTRY.json` — canonical discoverability (tools, key paths, approval model)

## Recommended top-level folders

- `entities/` — primary workspace surface (everything lives here)
  - `entities/tooling/` — scripts + allowlists (how the agent “does things”)
  - `entities/sessions/` — run artifacts + summaries (inspectable)
  - `entities/tasks/` — task inbox + daily plan views
  - `entities/projects/` — project hubs (open + archived)
  - `entities/notes/` — durable notes + streams
  - `entities/prompts/` — user-owned prompt templates
  - `entities/approvals/` — approval queue (pending → approved → executed)

## Approval gating (default)

Approval is a state machine:

1) **draft** (safe): generate a proposed action + preview
2) **approve** (human): explicit user approval
3) **execute** (unsafe): send/post/publish/create/delete, then record the outcome

Recommended folder model:
- `entities/approvals/pending/` — new requests
- `entities/approvals/approved/` — approved but not executed
- `entities/approvals/executed/` — executed + result captured
- `entities/approvals/rejected/` — explicitly rejected

Recommended approval artifact (JSON) fields:
- `id`, `created_at`, `state`
- `actor` (which account identity is being used)
- `tool_id`, `action`
- `preview` (human-readable summary)
- `execute` (stable CLI command or tool invocation)
- `confirm` (typed token or UI confirm requirement)

## Runtime state directory (recommended)

To keep workspaces git-safe, store secrets and token caches **outside** the repo:

- Default: `~/.prodex/`
- Override: `PRODEX_STATE_DIR`

Workspaces should not commit credentials, OAuth token caches, or API keys.
