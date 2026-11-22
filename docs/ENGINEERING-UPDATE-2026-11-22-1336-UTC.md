# FREELY engineering update — 22 November 2026, 13:36 UTC

## Repository baseline

- `Schmacko/freely-core`: default branch `main`, head `710c05b84f7551d00b1316eedb6d11ca077e7f1f`.
- `Schmacko/freely-bitcoin-core.`: default branch `master`, head `498b598cf27317b7306a859ce82b0571a0f9e348`.
- Implementation baseline remains the Bitcoin Core v32.1 fork and independent UTXO SHA-256d proof-of-work chain.

## Completed engineering work in this cycle

1. Corrected FREELY development/private startup compatibility with Bitcoin Core v32.1:
   - Removed checks and test arguments for `-upnp`, which is not registered by this upstream version.
   - Retained explicit NAT-PMP rejection and documented the upstream compatibility boundary.
   - Corrected loopback functional tests to use `BitcoinTestFramework.sync_blocks()` and `sync_mempools()`.
   - Added the missing `struct` import in the independent genesis regression.
   - Removed shebangs from Python files updated through the repository Contents API where mode 0644 is preserved, and removed reported trailing whitespace.
   - Removed unsupported UPnP argument injection from the C++ chain-type tests.
2. Reconciled consensus documentation lint:
   - Replaced broken links to the unmerged retarget proposal with the stable PR #5 link.
   - Removed trailing whitespace from the affected consensus/network documents.
   - Removed shebangs from three scripts invoked explicitly with `python3`.
3. Reconciled stacked PR branch ancestry while preserving rollback branches:
   - PR #6: `c639e73e911f942a2415f32c6a93ceab82e04591`.
   - PR #8: `370d4a436b7218e77de25dc296d14e01b38de589`.
   - PR #11: `86aeb0676c3bfd81fb896177cf3baedf0a558cad`.
   - PR #17: `8a567e0f11a3405d62f52b4b3a7c89869f1d5ec3`.
   - PR #18: `caeed11ea5b3c6c1f0487d6c18ba3c8a97135d99`.
   - PR #20: `3ca424de9a731b1037a7cc277e41f68bfd987296`.
   - PR #21: `b40710667fe2ae596be606b3aa05c5923fdfe11e`.
   - For each rewritten branch, the final tree SHA was checked unchanged and the new branch is one commit ahead/zero behind its current parent. Previous heads remain on named `*-pre-*` recovery branches.

## Verified execution evidence

- PR #18 focused genesis proof-of-work verification passed on exact head `caeed11ea5b3c6c1f0487d6c18ba3c8a97135d99`, run [45027884779](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45027884779).
- The standalone miner built; SHA-256d header serialization self-test passed; malformed/out-of-range arguments were rejected; the approved candidate header was verified and uploaded as an artifact.
- Verified candidate: nonce `2238688522`, block hash `0000000000e43054a010a58bde94ce509904f40f697fb874eedd426755cc2f78`.
- The artifact is a candidate verification result only; it does not activate production parameters or launch a network.

## Current CI queue

New-head validation is still pending for:
- PR #6: CI `45027222265`, M1 `45027222292`, retarget `45027222414` (retarget build in progress at last inspection).
- PR #8: CI `45028307701`, M1 `45028307688` (queued).
- PR #11: CI `45028317116`, wallet/node `45028317103` (queued).
- PR #12: CI `45027152480`, consensus specification `45027152493` (queued).
- PR #17: CI `45028325268`, core chain plumbing `45028325235` (pending).
- PR #18: CI `45027889638` queued; focused genesis verification passed.
- PR #20: CI `45027902105`, candidate tests `45027902078` / `45027897065` (queued).
- PR #21: CI `45027909666`, candidate `45027909692`, wallet `45027909696`, security `45027909663` (queued).

Earlier full-CI failures remain recorded on their exact historical heads; they are not reclassified as passes. PR #4/#5 had runner/toolchain failures (CMake/Visual Studio and macOS unsupported warning flags); PR #8/#17 had historical ancestor-replay failures, now addressed by single-commit history consolidation and awaiting new-head CI. PR #10's earlier full CI was cancelled, not passed.

## Active PR branch estimates

| PR | Branch | Estimated completion |
|---|---|---:|
| core #2 | `m1-consensus-design` | 85% |
| #4 | `freely/pow-difficulty-audit` | 90% |
| #5 | `freely/retarget-policy` | 95% |
| #6 | `freely/retarget-test-vectors` | 90% |
| #8 | `freely/core-chain-implementation` | 75% |
| #10 | `freely/network-safety-preflight` | 75% |
| #11 | `freely/wallet-node-readiness` | 70% |
| #12 | `freely/reconciled-docs` | 96% |
| #17 | `freely/genesis-and-network-code` | 86% |
| #18 | `freely/genesis-miner-implementation` | 96% |
| #20 | `freely/chainparams-candidate-integration` | 87% |
| #21 | `freely/private-node-startup` | 91% |

Existing active-branch average: **86.3% (12 branches)**. Historical all-branch average: **91.4% (25 branches)**; the historical 25-branch set is retained for comparison and has not been fully refreshed. Recovery branches are excluded from both denominators.

## Weighted project estimate

| Phase | Estimate | Weight |
|---|---:|---:|
| Foundation | 100% | 5% |
| Consensus specification | 92% | 15% |
| Network architecture | 88% | 10% |
| Core implementation | 65% | 25% |
| Testing | 51% | 15% |
| Wallet/node readiness | 40% | 10% |
| Mining | 92% | 5% |
| Security | 70% | 10% |
| Testnet | 10% | 5% |
| Production readiness | 0% | 5% |
| **Overall estimate** | **67.6%** | **100%** |

This is an engineering estimate, not a verified build/merge or production-readiness claim. The 70% milestone remains 2.4 percentage points away.

## Safety and release gates

Production startup remains fail-closed. No production genesis activation, DNS seed deployment, public testnet/mainnet launch, mining deployment, paid infrastructure, deployment or public network exposure was performed or authorized. No inherited Bitcoin hashpower/security is assumed. Consensus identity, genesis and activation values must remain tied to explicit owner approval and deterministic validation.
