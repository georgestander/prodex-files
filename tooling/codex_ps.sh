#!/usr/bin/env bash
set -euo pipefail

# Personal Software repo launcher:
# Starts Codex in this repo and sends an initial REHYDRATE instruction so the
# model loads our SSOT files into context on startup.

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

rehydrate_prompt=$'REHYDRATE (READ-ONLY):\n- Do NOT edit/write/create/move/delete any files.\n- Do NOT run commands that mutate state.\n- Only read files to rebuild context.\n\nSteps:\n- Read .agent/POLICY.md first.\n- Read .agent/STATE.json next.\n- Read each path in STATE.json.active.context_paths (if present).\n- Scan .agent/LOG.ndjson for recent events relevant to STATE.json.active.project (or last_session).\n\nOutput:\n- Summarize: (1) what we are doing, (2) what is active now, (3) what to do next.\n- Then ask me what I want to do.'

exec codex -C "$repo_root" "$rehydrate_prompt"
