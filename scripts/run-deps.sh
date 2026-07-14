#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

run_dep_script() {
  local dep_script="$1"
  if [ ! -x "$dep_script" ]; then
    printf 'Skipping non-executable dependency hook: %s\n' "$dep_script"
    return
  fi

  printf 'Running dependency hook: %s\n' "$dep_script"
  "$dep_script"
}

for hook_dir in "$repo_root"/skills "$repo_root"/plugins; do
  [ -d "$hook_dir" ] || continue
  while IFS= read -r dep_script; do
    run_dep_script "$dep_script"
  done < <(find "$hook_dir" -mindepth 2 -maxdepth 2 -type f -name deps.sh | sort)
done
