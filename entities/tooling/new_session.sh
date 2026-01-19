#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
session_id="$(date +%Y%m%d_%H%M%S)"
session_dir="$repo_root/entities/sessions/$session_id"

mkdir -p "$session_dir"

cp "$repo_root/entities/sessions/_template/summary.md" "$session_dir/summary.md"
cp "$repo_root/entities/sessions/_template/session.json" "$session_dir/session.json"

perl -pi -e "s/YYYYMMDD_HHMMSS/$session_id/g" "$session_dir/session.json"

echo "$session_dir"
