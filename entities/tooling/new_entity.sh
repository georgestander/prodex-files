#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: entities/tooling/new_entity.sh <type> <slug> [title]" >&2
  echo "Example: entities/tooling/new_entity.sh people hano_gardener \"Hano (gardener)\"" >&2
}

if [[ "${1:-}" == "" || "${2:-}" == "" ]]; then
  usage
  exit 2
fi

type="$1"
slug="$2"
title="${3:-}"

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
entity_dir="$repo_root/entities/$type/$slug"

mkdir -p "$entity_dir/sources" "$entity_dir/artifacts"

cp "$repo_root/entities/_template/entity.json" "$entity_dir/entity.json"
cp "$repo_root/entities/_template/notes.md" "$entity_dir/notes.md"

now="$(date -Iseconds)"

perl -pi -e "s/\\\"type\\\": \\\"\\\"/\\\"type\\\": \\\"$type\\\"/g" "$entity_dir/entity.json"
perl -pi -e "s/\\\"slug\\\": \\\"\\\"/\\\"slug\\\": \\\"$slug\\\"/g" "$entity_dir/entity.json"
perl -pi -e "s/\\\"created_at\\\": null/\\\"created_at\\\": \\\"$now\\\"/g" "$entity_dir/entity.json"

if [[ "$title" != "" ]]; then
  perl -pi -e "s/\\\"title\\\": \\\"\\\"/\\\"title\\\": \\\"$title\\\"/g" "$entity_dir/entity.json"
  perl -0777 -pi -e "s/^# Notes\\n/# Notes — $title\\n/s" "$entity_dir/notes.md"
else
  perl -0777 -pi -e "s/^# Notes\\n/# Notes — $type:$slug\\n/s" "$entity_dir/notes.md"
fi

echo "$entity_dir"
