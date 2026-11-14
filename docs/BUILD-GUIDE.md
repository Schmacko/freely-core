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

## Upstream source

The proposed upstream baseline is Bitcoin Core `v32.1`. See [UPSTREAM-BASELINE.md](UPSTREAM-BASELINE.md) for provenance and references.

The official release information identifies v32.1 and its signed tag. Before building, however, verify the signature locally using a maintainer key whose full fingerprint has been independently checked. Do not bypass a failed or unavailable signature check.

## Minimal Ubuntu build dependencies

The v32.1 Unix build notes list these required Debian/Ubuntu packages:

```bash
sudo apt-get update
sudo apt-get install -y build-essential cmake python3 libboost-dev
```

The v32.1 dependency documentation requires GCC 12.1 or newer, Clang 17.0 or newer, and CMake 3.22 or newer.

For the first node-only baseline, disable optional wallet, IPC and GUI features to avoid their additional dependencies. This is a development build, not a proposed final FREELY feature configuration.

## First upstream build — only after signature verification

Clone the official source into a separate directory, not over this repository:

```bash
git clone https://github.com/bitcoin/bitcoin.git bitcoin-upstream
cd bitcoin-upstream
git fetch --tags
git checkout --detach v32.1
git verify-tag v32.1
git rev-parse v32.1^{commit}
```

Stop if `git verify-tag` fails. A valid signature must also be from a maintainer key whose fingerprint you trust.

Configure and build the unchanged upstream source:

```bash
cmake -B build -DENABLE_WALLET=OFF -DENABLE_IPC=OFF -DBUILD_GUI=OFF
cmake --build build -j2
```

The build may take time and consume Codespaces compute quota. Check the billing/usage information before starting. Do not run the node or download blockchain data as part of this milestone.

## Current project status

The repository contains project documentation and diagnostic scripts. No FREELY daemon, wallet, genesis block, mining network, or mainnet exists yet. M1 is complete only after local tag verification, an unchanged upstream build, and recorded test results.
