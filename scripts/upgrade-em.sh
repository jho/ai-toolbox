#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
upstream_url="${EM_UPSTREAM_URL:-https://github.com/milehimikey/em.git}"
upstream_ref="${EM_UPSTREAM_REF:-main}"
prefix="${EM_SUBTREE_PREFIX:-vendor/em}"

printf 'Updating subtree %s from %s (%s)\n' "$prefix" "$upstream_url" "$upstream_ref"
git -C "$repo_root" subtree pull --prefix="$prefix" "$upstream_url" "$upstream_ref" --squash
