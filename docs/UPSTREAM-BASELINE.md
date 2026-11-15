# Upstream Baseline — Bitcoin Core

**Proposed tag:** `v32.1`  
**Upstream repository:** https://github.com/bitcoin/bitcoin  
**Status:** Release/tag identified; local cryptographic verification and build are still pending.

## Why this baseline

The official Bitcoin Core download page identifies 32.1 as the current release in the checked release information. The official GitHub release page identifies `v32.1` as an immutable release and reports a verified signature on the tag. This is evidence about the upstream release; it is not a substitute for verifying the tag in our own checkout against a maintainer key we independently trust.

## Required verification before building

1. Clone the official repository or fetch the tag into a clean checkout.
2. Obtain maintainer public keys from the Bitcoin Core project's documented sources.
3. Independently compare the key fingerprints with trusted project information.
4. Run `git verify-tag v32.1` and require a valid signature from a key you trust.
5. Record the full commit hash returned by `git rev-parse v32.1^{commit}`.
6. Record the verification date, Git version, signer fingerprint and full commit hash in this document or a build record.

A GitHub "Verified" badge is useful provenance information, but local verification against a trusted key is still required for our build process.

## v32.1 build facts

The v32.1 source tree's `doc/build-unix.md` documents a CMake build:

```bash
cmake -B build
cmake --build build
```

The same document lists these required Debian/Ubuntu build packages:

```bash
sudo apt-get install build-essential cmake python3 libboost-dev
```

The v32.1 dependency documentation specifies minimum GCC 12.1, Clang 17.0 and CMake 3.22. Optional features add dependencies. The default build options enable the wallet and IPC on supported Unix systems, so a minimal node-only build can explicitly disable them to reduce dependencies.

## First build policy

- Build the upstream source unchanged.
- Do not change consensus parameters or chain identity.
- Do not download blockchain data.
- Do not start a node or expose RPC.
- Keep build artifacts out of Git.
- Record configure output, compiler versions, build result and test result.
- If verification fails or a required trusted key is unavailable, stop; do not bypass signature verification.

## Official references

- Release page: https://bitcoincore.org/en/releases/32.1/
- GitHub release: https://github.com/bitcoin/bitcoin/releases/tag/v32.1
- Unix build notes at the tag: https://github.com/bitcoin/bitcoin/blob/v32.1/doc/build-unix.md
- Dependencies at the tag: https://github.com/bitcoin/bitcoin/blob/v32.1/doc/dependencies.md
- Release verification guidance: https://bitcoincore.org/en/download/
