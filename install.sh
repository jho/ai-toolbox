#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: install.sh [--surface codex|claude|PATH] [--target PATH]

Install the toolbox skills into a Codex or Claude skills directory.

Defaults:
  --surface codex   -> $CODEX_HOME/skills or ~/.codex/skills
  --surface claude  -> $CLAUDE_HOME/skills or ~/.claude/skills
EOF
}

target_root=""
surface=""

while [ "$#" -gt 0 ]; do
  case "$1" in
    --surface)
      shift
      surface="${1:-}"
      ;;
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
  case "${surface:-codex}" in
    codex)
      target_root="${CODEX_HOME:-$HOME/.codex}/skills"
      ;;
    claude)
      target_root="${CLAUDE_HOME:-$HOME/.claude}/skills"
      ;;
    *)
      printf 'Unknown surface: %s\n' "$surface" >&2
      exit 1
      ;;
  esac
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$repo_root/scripts/sync-codex-skills.sh" "$target_root"
