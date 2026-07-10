#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: install.sh [--target PATH]

Install the toolbox skills into a Codex skills directory.

Defaults:
  --target  $CODEX_HOME/skills or ~/.codex/skills
EOF
}

target_root=""

while [ "$#" -gt 0 ]; do
  case "$1" in
    --target)
      shift
      target_root="${1:-}"
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'Unknown argument: %s\n' "$1" >&2
      usage >&2
      exit 1
      ;;
  esac
  shift
done

if [ -z "$target_root" ]; then
  target_root="${CODEX_HOME:-$HOME/.codex}/skills"
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$repo_root/scripts/sync-codex-skills.sh" "$target_root"

