# Prodex Roadmap (Scaffold → Agent OS)

Prodex is a **file-first agent operating system scaffold**: a system you can “plug into” any person or business by pointing it at a workspace, then layering UI + tools on top.

This roadmap is written to keep the **system repo** (`prodex`) clean and reusable while enabling production-grade “instances” (private workspaces).

## North Star

Ship a production-ready agent runtime + UI that:
- Boots deterministically from a workspace **registry + state** (no “forgotten tools”).
- Uses **atomic tools** and composes them into emergent workflows.
- Enforces **human approval gates** for irreversible/identity-bearing actions (send, post, publish, pay, delete).
- Can run as:
  - **CLI** (fast dev loop)
  - **Local web UI** (cross-device, shareable on LAN/VPN)
  - **Desktop app** (offline-friendly, packaged, secure storage)

## Guiding Principles

- **System vs Instance separation:** prodex is generic; instances hold real logs/state/content.
- **Filesystem is the interface:** everything important is inspectable files.
- **Registry-first rehydration:** the agent loads a canonical registry every session.
- **Explicit state + append-only log:** state is small/mutable; events are append-only.
- **Approval is a state machine:** draft → approve → execute (typed confirm / UI confirm).
- **Ports before forks:** wrap Codex CLI first; fork only when hooks are proven necessary.

## Milestones

### 0) Workspace Spec + Bootstrap (Foundation)

Deliverables:
- A formal **workspace specification** (folders, schemas, invariants).
- A canonical **registry file** (single source of discoverability for tools/entities/workflows).
- `prodex init` (or equivalent) to create a new private workspace from templates.
- A deterministic **rehydrate** entrypoint (similar to `entities/tooling/codex_ps.sh`) that always:
  - reads policy/state/registry
  - loads pinned context paths
  - summarizes active work + next actions

Success criteria:
- Fresh sessions reliably “know” what tools/projects/workflows exist from files alone.

### 1) Tools Framework (Primitives + Safety)

Deliverables:
- Tool manifest format (id, description, input schema, output schema, risk level, approvals required).
- A standard tool runner contract (CLI callable, JSON in/out, stable exit codes).
- Built-in approval patterns:
  - **read**: no approval
  - **draft**: no approval (or optional), but produces an approval request artifact
  - **execute**: requires approval (typed token or UI click) + records result
- Reference connectors (system-level, not personal):
  - Microsoft 365 (Graph): read + draft + approval-gated send/post
  - Google (Gmail/Calendar): read + draft + approval-gated send/create

Success criteria:
- Every write-capable connector is safe by construction and produces auditable artifacts.

### 2) UI v1 (Local Web UI)

Deliverables:
- A local web UI that renders workspace state:
  - Inbox / tasks / active projects
  - Entity browser + entity detail pages
  - Approval queue (pending → approved → executed)
  - Run history (sessions) + artifacts
- A stable “UI ↔ agent” bridge contract:
  - request tool execution
  - stream output/events
  - request approval with payload preview

Success criteria:
- A non-technical user can operate the agent without touching the terminal.

### 3) Desktop App v1 (Packaged Runtime)

Deliverables:
- Desktop wrapper (Electron or Tauri) that:
  - bundles or manages the runtime (Node/Python as needed)
  - uses OS keychain for secrets
  - supports multi-workspace switching
  - runs offline-first where possible
- Clear boundary between:
  - **engine** (agent + tools)
  - **UI** (approval, context browsing, task control)

Success criteria:
- Installable app that can run the full workflow without manual environment setup.

### 4) Engine Hardening (Codex Integration → Fork Decision)

Deliverables:
- Structured event stream for UI (tool calls, file ops, approvals, errors).
- Policy enforcement hooks (deny/allow tool calls by risk classification).
- Multi-session/multi-agent coordination primitives (workspaces, locks, queues).

Fork criteria (when we fork Codex CLI):
- We need hooks that cannot be layered externally without fragile parsing (e.g., approvals, tool-event stream, workspace switching, sandbox policy).
- We can keep the fork diff small and well-tested.

### 5) Business “Packs” + Deployment Patterns

Deliverables:
- Pack format (schemas + templates + tool configs + UI views):
  - e.g., CRO RegOps pack, agency ops pack, founder ops pack
- Deployment patterns:
  - single-user local
  - team workspace with roles + shared approvals
  - hosted (optional), with strict trust boundaries

Success criteria:
- “Plug into a business” means: create workspace → select pack → connect accounts → ship value in days.

## Open Questions (to resolve early)

- Workspace storage: git-first vs file-first without git; how we handle sync/backup.
- Identity + auth: how to model “who is the agent acting as” (multiple accounts).
- Approval UX: typed tokens vs UI confirmations vs both; what is the default for CLI.
- Packaging: Electron vs Tauri; whether we bundle Node/Python (and which versions).
- Policy model: how granular and how user-editable (and how to prevent prompt-injection).
