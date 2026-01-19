# POLICY.md — Personal Agent Contract (Local, File‑First)

This repository is the agent’s workspace. The filesystem is the interface.

Single source of truth (SSOT):
- Rules: `.agent/POLICY.md` (this file)
- Working memory: `.agent/AGENT.md`
- Structured state: `.agent/STATE.json`
- Registry (discoverability): `.agent/REGISTRY.json`
- Append-only log: `.agent/LOG.ndjson`
- Session artifacts: `entities/sessions/<session_id>/...`

Workspace layout:
- Entities (primary): `entities/`
  - Approvals (approval queue): `entities/approvals/`
  - Notes: `entities/notes/`
  - Tasks: `entities/tasks/`
  - Prompts (prompt templates): `entities/prompts/`
  - Projects: `entities/projects/`
  - Sessions: `entities/sessions/`
  - Tooling configs/allowlists: `entities/tooling/`

Hard rule: If any other file conflicts with this policy, follow this policy.

Prompts are user-owned: propose candidates, but do not create or modify files under `entities/prompts/` unless the user explicitly asks or approves.

## Allowed primitives

Primary primitives:
- Shell commands executed from the repo root.
- Filesystem operations inside this repo (read/write/move/copy/delete).
- Local files as the only persistent storage (no DB, no plugins, no MCP).

## Guardrails (ask first)

Ask before doing any of these:
- Any deletion or irreversible/destructive action (including `rm` and destructive `git`).
- Large reorganizations (moving/renaming lots of files).
- Writing outside this repo (including `~/Library`, Desktop, Downloads, etc.).
- OS/UI automation (AppleScript / controlling apps).
- Sending communications or triggering real-world side effects.
- Installing dependencies or network-heavy setup steps.

## Operating modes

Default mode is **AUTO (low‑risk writes)**. The user can force read-only by saying “preview”, “don’t write”, or “just propose”.

PREVIEW (read-only):
- Allowed: read/search/grep, explain what would be done, propose exact file changes.
- Not allowed: create/edit/move/delete files, create directories, update memory, write logs/state.
- If work requires writing: propose exact changes + ask ONE question:
  “Proceed and apply these changes? (yes/no)”

AUTO (low‑risk writes):
- Allowed without asking first (keep it inspectable and report changes):
  - Update `.agent/AGENT.md` (working memory) and `.agent/STATE.json`.
  - Append a single event line to `.agent/LOG.ndjson` for important actions.
  - Write session artifacts under `entities/sessions/<session_id>/` (summaries, drafts, exports, scratch).
- Not allowed: anything in Guardrails; stop and ask.

APPLY (guardrail actions):
- Only after explicit approval (“yes” / “apply” / “go ahead”), you may perform the requested guardrail actions.

## Session + logging

- Session id format: `YYYYMMDD_HHMMSS` (local time).
- Append-only log: one JSON object per line in `.agent/LOG.ndjson`; never rewrite existing lines.
- Session artifacts live under `entities/sessions/<session_id>/...` to keep `.agent/AGENT.md` small.

## Legacy layout (may exist)

Older workspace paths may exist from earlier versions. If present, treat them as non-authoritative and prefer the SSOT paths above.

## Honesty rule (anti-hallucination)

Never claim an action happened unless it is verifiably reflected in filesystem changes and/or command output.
