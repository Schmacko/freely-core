# FREELY Development Environment Guide

This guide prepares a development environment. It does not launch a FREELY network.

## Phone-based workflow

1. Open the repository: https://github.com/Schmacko/freely-core
2. Open the existing GitHub Codespace from https://github.com/codespaces
3. Use the Codespaces browser editor and open **Terminal → New Terminal**.
4. Confirm the repository and branch before running setup commands.

Run these read-only checks first:

```bash
pwd
git status --short --branch
git remote -v
ls -la
uname -a
```

Do not paste passwords, access tokens, private keys, or wallet seed phrases into chat.

## Cost control

- Check the displayed payer and included usage before starting or resizing a Codespace.
- Do not approve paid usage or upgrade a plan for this project.
- Stop the Codespace when not in use.
- Use the smallest suitable machine.
- Check current GitHub billing/usage information; quotas and policies can change.

## Upstream verification

The proposed upstream is Bitcoin Core v32.1. Before building:

1. Confirm the tag exists in the official Bitcoin Core repository.
2. Verify its signed tag using trusted maintainer keys obtained independently.
3. Record the resolved commit hash.
4. Review the official build instructions for that exact release.
5. Build upstream unchanged before applying FREELY modifications.

Do not treat a successful download as proof of authenticity.

## Build policy

Bitcoin Core's build system and dependencies vary by release. Follow the pinned release's official CMake build instructions. Do not run unreviewed bootstrap scripts or install unnecessary dependencies.

## Current project status

At this stage there is no FREELY daemon, wallet, genesis block, mining network, or mainnet. The first executable target is an unchanged, verified upstream build.
