# ai-toolbox

Personal repository for reusable AI workflow assets.

This repo is intended to hold:

- role definitions for generic SDLC sub-agents
- reusable skills
- Codex plugins
- MCP server definitions
- helper scripts and templates

The initial role model is intentionally compressed:

- `product-manager`
- `architect`
- `planner`
- `developer`
- `tester`
- `release-manager`

## Repo layout

```text
ai-toolbox/
  roles/
  skills/
  plugins/
  catalog/
  mcp/
  scripts/
  references/
```

See [skills/README.md](skills/README.md) for the current skill index.
See [plugins/README.md](plugins/README.md) for the current plugin source index.
See [docs/vendoring.md](docs/vendoring.md) for the subtree + dependency pattern.
See [catalog/README.md](catalog/README.md) for the AI-managed tool catalog.

## Install

Run `./install.sh` to sync the repo's skills into the current Codex or Claude skills directory.
It also installs an `ai-toolbox` helper into `~/.local/bin` by default.
`ai-toolbox update` resyncs the skills and runs any vendored dependency hooks.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jho/ai-toolbox/main/install.sh)"
```

To force a specific surface from a cloned repo:

```bash
./install.sh --surface codex
./install.sh --surface claude
```

To verify what was installed:

```bash
./install.sh --verify
```

After install, use:

```bash
ai-toolbox update
```

You can override the helper install location with `AI_TOOLBOX_COMMAND_DIR`.

The repo uses `mise` for task orchestration around sync and subtree updates.

To refresh the vendored `em` subtree from upstream:

```bash
./scripts/upgrade-em.sh
```

The first catalog examples are:

- `em` for the vendored non-marketplace path
- `toolbox-catalog-manager` for the catalog-management plugin example

## Principles

- Keep role specs short and portable.
- Keep tool-specific packaging separate from the canonical role definitions.
- Avoid secrets, private URLs, and company-specific workflow details in public content.
- Prefer generated wrappers over hand-maintained vendor-specific copies.
