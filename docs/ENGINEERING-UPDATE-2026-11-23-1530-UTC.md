# FREELY engineering update — 23 November 2026, 15:30 UTC

## Executive status

- Weighted engineering estimate: **67.35%** (unchanged from the last comparable baseline; 2.65 percentage points to the 70% milestone).
- Production readiness: **0% / BLOCKED**. No production genesis activation, public network launch, DNS seed deployment, mining deployment, paid infrastructure or public RPC/P2P exposure is authorized.
- No PR was merged in this cycle. No merge met every exact-head CI, dependency and integration condition.
- The project remains an independent Bitcoin Core v32.1 UTXO SHA-256d fork. No inherited Bitcoin hashpower/security is implied.

## Repository and branch state

| Repository | Default branch | Default head |
|---|---|---|
| Schmacko/freely-core | main | 710c05b84f7551d00b1316eedb6d11ca077e7f1f |
| Schmacko/freely-bitcoin-core. | master | 498b598cf27317b7306a859ce82b0571a0f9e348 |

The pinned integration baseline branch freely/upstream-v32.1 is at 0f27415ebe114f3e93157a4b3c95e7670012dee1.

There are 42 Git refs across both repositories: 13 active open-PR branches and 29 other refs (closed PR branches, pre-rebase/recovery snapshots, upstream and default branches). Recovery snapshots are not counted as independent workstreams.

## Active PR branches and estimated completion

| Repository / PR | Branch | Exact head | Estimate |
|---|---|---|---:|
| freely-core #2 | m1-consensus-design | f68001103689c8a6873bda9b4509cfbcb30c3a64 | 85% |
| bitcoin-core #4 | freely/pow-difficulty-audit | 92d0c7957fd054c74a195de2ba8133cabd696a18 | 90% |
| bitcoin-core #5 | freely/retarget-policy | 3d5006d411ed2781985d00506c3e1a3c36675962 | 95% |
| bitcoin-core #6 | freely/retarget-test-vectors | 5cbca965a9340f85631804a5fa5c827a3b79b015 | 90% |
| bitcoin-core #8 | freely/core-chain-implementation | 370d4a436b7218e77de25dc296d14e01b38de589 | 75% |
| bitcoin-core #10 | freely/network-safety-preflight | 24c4ebfe873bf30043fdb5b329b10143962b4fb0 | 75% |
| bitcoin-core #11 | freely/wallet-node-readiness | 86aeb0676c3bfd81fb896177cf3baedf0a558cad | 70% |
| bitcoin-core #12 | freely/reconciled-docs | 038114e1df5e7d2a0f66fee27276d70edcc81685 | 95% |
| bitcoin-core #17 | freely/genesis-and-network-code | 8a567e0f11a3405d62f52b4b3a7c89869f1d5ec3 | 85% |
| bitcoin-core #18 | freely/genesis-miner-implementation | 8e81ea9fbf9c0b079bad1d14e8383cd36a4912b5 | 95% |
| bitcoin-core #21 | freely/private-node-startup | 52c4f84326b126dd1f8b5015c98a82f24a9b94e8 | 89% |
| bitcoin-core #22 | freely/chainparams-reconciled-20261122 | 92239197131c5d0dbbf6f77fbb30760facb18460 | 87% |
| bitcoin-core #23 | freely/ci-cmake-4-5-compat | 250d6657da43967240dacec246a45159bfc6cbb3 | 90% |

- Active open-PR branch average: **86.2% (13 branches)**. Previous comparable average: 85.9% (12 branches); PR #20 closed unmerged, while PR #22 and #23 are now active.
- Historical all-branch workstream average: **91.4% (25 branches)**, retained as the prior baseline. It has not been recalculated because the current 42 refs include duplicate recovery snapshots and upstream/default branches; counting those as independent work would distort the average.

## Weighted project completion

| Phase | Completion | Weight |
|---|---:|---:|
| Foundation | 100% | 5% |
| Consensus specification | 92% | 15% |
| Network architecture | 88% | 10% |
| Core implementation | 65% | 25% |
| Testing | 50% | 15% |
| Wallet/node readiness | 40% | 10% |
| Mining | 90% | 5% |
| Security | 70% | 10% |
| Testnet | 10% | 5% |
| Production readiness | 0% | 5% |
| **Weighted total** | **67.35%** | **100%** |

These are engineering estimates, not build, test, merge or release evidence.

## Exact-head CI and verification

| PR | Latest exact-head evidence |
|---|---|
| #4 | Full CI [44910339764](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44910339764) failed on CMake 4.5 non-target-directive diagnostics. |
| #5 | Full CI [44910342400](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44910342400) failed in the same CMake 4.5 compatibility path. |
| #6 | Focused retarget [45034083151](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45034083151), M1 [45034083189](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45034083189), and full Bitcoin Core CI [45034083216](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45034083216) passed. Branch is 25 commits behind its base; integration/revalidation is still required. |
| #8 | Focused M1 [45028307688](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028307688) passed. Full CI [45028307701](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028307701) remains incomplete. |
| #10 | Network preflight [45204530104](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45204530104) and full CI [45204530112](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45204530112) are queued/in progress on the current head. |
| #11 | Focused wallet/node readiness [45028317103](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028317103) and full CI [45028317116](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028317116) passed on the exact head. This PR is stacked on #8. |
| #12 | Consensus-specification checks [45205296895](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45205296895) and full CI [45205296898](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45205296898) are queued. |
| #17 | Focused core-chain plumbing [45028325235](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028325235) passed; full CI [45028325268](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028325268) remains in progress. |
| #18 | Push-triggered candidate-miner verification [45204029247](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45204029247) passed on the current head. PR-triggered verification [45204041280](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45204041280) and full CI [45204040649](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45204040649) remain queued/in progress. |
| #21 | New-head offline-wallet [45202770106](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45202770106) and private-node security [45202770188](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45202770188) are in progress; candidate tests [45202770263](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45202770263) queued; full CI [45202770335](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45202770335) in progress. |
| #22 | Focused core-chain tests [45203933162](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45203933162) pending; full CI [45203932853](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45203932853) in progress. |
| #23 | Prior full CI [45193126171](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45193126171) exposed ancestor-job use of the old helper; new-head full CI [45204795368](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45204795368) is queued. |

PR #2 is documentation/design-only and has no CI workflow associated with its current head. PR #1 is merged in both repositories. PR #20 is closed unmerged. No open PR has unresolved inline review threads in the current inspection.

## Changes made in this cycle

1. **PR #21 startup/wallet regressions:** corrected the fail-closed startup error expectation; changed the loopback negative case to explicitly enable discovery (-discover=1); removed the legacy dumpprivkey call from the v32.1 descriptor-wallet test. The C++ chain-parameter regression still checks the approved WIF version prefix.
2. **PR #22 genesis wording:** changed C++ comments and test names so the derived nonce/hash are explicitly candidate-only, not final approved production identity.
3. **PR #18 miner workflow:** changed CI job/step labels and PR text from “approved nonce/header” to “candidate nonce/header”.
4. **PR #10 preflight manifest:** added genesis.commitment_status=candidate_pending_owner_approval; the validator now requires this state and rejects “final approved” or “production” status. Added regression tests and reconciled the preflight/production-readiness documentation.
5. **PR #12 documentation:** reconciled the approved baseline, decision register, consensus specification, historical parameter draft, PoW model and chain-selection audit with the current candidate-only nonce/hash status.
6. **PR #23 CI:** copied the PR-head ancestor-test helper into the runner temp directory so every replayed commit uses the current CMake 4.5 compatibility logic, rather than failing before the helper fix is replayed.

No consensus numeric values, genesis candidate bytes, production chain activation or network identity were changed in this cycle.

## Owner approval boundary and release blockers

The owner-approved baseline includes SHA-256d, the approved PoW limit and genesis compact target, 600-second spacing, 2,016-block retarget, BIP94 policy, network magic/ports/address prefixes, genesis timestamp and coinbase/Merkle template, and the initial activation matrix.

The derived nonce 2238688522 and block hash 0000000000e43054a010a58bde94ce509904f40f697fb874eedd426755cc2f78 have been independently reproduced as a candidate, but remain pending explicit owner sign-off as final production identity. The manifest now marks them candidate_pending_owner_approval. Do not freeze or activate them as final production identity without that sign-off.

PR #21 still targets the preserved base branch from closed-unmerged PR #20. Comparison against replacement candidate PR #22 reports 48 commits ahead and 3 behind; do not simply retarget it. A deliberate rebase/transplant and complete revalidation are required. PR #11 and #17 remain stacked on PR #8; PR #18 and #22 are stacked on PR #17.

No paid infrastructure, production genesis activation, DNS seeds, public testnet/mainnet launch, mining deployment, deployment or public network exposure is authorized. Keep production startup fail-closed.
