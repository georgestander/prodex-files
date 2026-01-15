# sessions/

Per-session summaries and artifacts.

These are meant to be durable and inspectable. Keep them small and text-first.

Suggested structure per session:
- `sessions/<session_id>/session.json` (machine index for UI/agent)
- `sessions/<session_id>/summary.md`
- `sessions/<session_id>/...` (drafts, exports, scratch)

This keeps `.agent/AGENT.md` small and prevents “memory bloat”.

Conventions:
- Prefer Markdown/text; avoid large binaries.
- Don’t store secrets (API keys, tokens, credentials).
- Commit session folders to git so the timeline is preserved.

Templates:
- `sessions/_template/session.json`
- `sessions/_template/summary.md`
