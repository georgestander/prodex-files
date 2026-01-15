# AGENTS.md — Prodex (Root)

SOURCE OF TRUTH:
- Policy: `.agent/POLICY.md`
- Working memory: `.agent/AGENT.md`
- State: `.agent/STATE.json`
- Append-only log: `.agent/LOG.ndjson`

Hard rule: Treat `.agent/*` as authoritative.

On every run:
1) Read `.agent/POLICY.md` first.
2) Load `.agent/STATE.json` to rehydrate context.
3) Append events to `.agent/LOG.ndjson` (never rewrite history).
4) Write session artifacts to `sessions/<session_id>/...`.
