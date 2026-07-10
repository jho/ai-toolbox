#!/usr/bin/env bash
set -euo pipefail

repo_url="${AI_TOOLBOX_REPO_URL:-https://github.com/jho/ai-toolbox.git}"
repo_ref="${AI_TOOLBOX_REPO_REF:-main}"
surface="codex"
target_root=""
workdir=""

usage() {
  cat <<'EOF'
Usage: bootstrap.sh [--surface codex|claude] [--target PATH]

Clone the toolbox repo to a temporary directory, then run install.sh.

Environment overrides:
  AI_TOOLBOX_REPO_URL  Remote repo URL to clone
  AI_TOOLBOX_REPO_REF  Git ref to clone (default: main)
EOF
}

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

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT

git clone --depth 1 --branch "$repo_ref" "$repo_url" "$workdir/ai-toolbox"

if [ -n "$target_root" ]; then
  "$workdir/ai-toolbox/install.sh" --surface "$surface" --target "$target_root"
else
  "$workdir/ai-toolbox/install.sh" --surface "$surface"
fi

