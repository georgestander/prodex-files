# entities/approvals/

This folder is the **approval queue** for identity-bearing or irreversible actions (send/post/publish/pay/delete).

Default lifecycle:
- `entities/approvals/pending/` → waiting for user approval
- `entities/approvals/approved/` → approved but not yet executed
- `entities/approvals/executed/` → executed (with captured result)
- `entities/approvals/rejected/` → rejected

Guideline: tools can freely create *drafts* and *approval requests*, but **must not execute** without an explicit approval step.
