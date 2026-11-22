# FREELY Engineering Update — 22 November 2026, 14:24 UTC

## Repository and baseline state

| Repository | Default branch | Exact default-branch head |
|---|---|---|
| `Schmacko/freely-core` | `main` | `710c05b84f7551d00b1316eedb6d11ca077e7f1f` |
| `Schmacko/freely-bitcoin-core.` | `master` | `498b598cf27317b7306a859ce82b0571a0f9e348` |

The Bitcoin Core integration baseline branch `freely/upstream-v32.1` is at `0f27415ebe114f3e93157a4b3c95e7670012dee1`. The foundation PR #1 is merged in both repositories (core merge commit `ab5b591979c30545d29f19e35de1ee8dabf64d94`; Bitcoin Core integration merge commit `0f27415ebe114f3e93157a4b3c95e7670012dee1`). Bitcoin Core PR #20 was closed unmerged by the repository owner. It remains a branch dependency for PR #21; PR #22 is the replacement candidate-integration PR.

## Active PR branches

All active PRs are open and GitHub currently reports them mergeable. Inline review-thread checks returned no threads for the active PR set. Branch completion below is an engineering estimate, not a build or release certification.

| PR | Branch | Exact head | Base comparison | Estimate |
|---|---|---|---|---:|
| freely-core #2 | `m1-consensus-design` | `62265735836a0c64c49ff656aee4c05a3e3eaff4` | 16 ahead, 0 behind `main` | 85% |
| Bitcoin #4 | `freely/pow-difficulty-audit` | `92d0c7957fd054c74a195de2ba8133cabd696a18` | 4 ahead, 0 behind | 90% |
| Bitcoin #5 | `freely/retarget-policy` | `3d5006d411ed2781985d00506c3e1a3c36675962` | 5 ahead, 0 behind | 95% |
| Bitcoin #6 | `freely/retarget-test-vectors` | `5cbca965a9340f85631804a5fa5c827a3b79b015` | 4 ahead, 25 behind; GitHub reports mergeable | 90% |
| Bitcoin #8 | `freely/core-chain-implementation` | `370d4a436b7218e77de25dc296d14e01b38de589` | 1 ahead, 0 behind | 75% |
| Bitcoin #10 | `freely/network-safety-preflight` | `a7278237128443020cd5d36715734317d9e81360` | 103 ahead, 0 behind | 75% |
| Bitcoin #11 | `freely/wallet-node-readiness` | `86aeb0676c3bfd81fb896177cf3baedf0a558cad` | 1 ahead, 0 behind PR #8 | 70% |
| Bitcoin #12 | `freely/reconciled-docs` | `63d698df065f8729435dc4aca455bef18f53e41f` | 65 ahead, 0 behind | 95% |
| Bitcoin #17 | `freely/genesis-and-network-code` | `8a567e0f11a3405d62f52b4b3a7c89869f1d5ec3` | 1 ahead, 0 behind PR #8 | 85% |
| Bitcoin #18 | `freely/genesis-miner-implementation` | `3dc55cb2582a130306867679fad1c2b712ad1184` | 1 ahead, 0 behind PR #17 | 95% |
| Bitcoin #21 | `freely/private-node-startup` | `2e874a467553783d12cd0f3815b4bc0b86c7cab5` | 2 ahead, 0 behind closed PR #20 base | 89% |
| Bitcoin #22 | `freely/chainparams-reconciled-20261122` | `fd3f66ebe2f482954d836ad87ea7c110bed5fed9` | 5 ahead, 0 behind PR #17 | 90% |
| Bitcoin #23 | `freely/ci-cmake-4-5-compat` | `24fbc47abe537064c88078d1a9a952f8a5fdde0b` | 2 ahead, 0 behind upstream baseline | 90% |

The Bitcoin repository currently has 38 `freely/` branches; the core repository has the active `m1-consensus-design` branch. The 13 open-PR branches above are the active implementation/design set. Remaining branches are upstream, dependency, recovery or preserved pre-rebase/pre-squash branches and are not counted as independent active workstreams.

## Exact-head CI evidence

| PR | Exact-head workflow evidence | Current status |
|---|---|---|
| #2 | No workflow returned for documentation/design-only head | No executable validation claimed |
| #4 | Full CI [44910339764](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44910339764) | Failed; Windows and macOS native configure reported CMake 4.5 `non-target-directive` errors; ancestor replay also failed |
| #5 | Full CI [44910342400](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44910342400) | Failed on the same CMake 4.5 configure issue |
| #6 | Prior-head M1 [45027222292](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45027222292) and retarget [45027222414](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45027222414) passed on `c639e73e911f942a2415f32c6a93ceab82e04591`. New-head retarget [45034083151](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45034083151) pending, M1 [45034083189](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45034083189) queued, full CI [45034083216](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45034083216) queued | New head `5cbca965a9340f85631804a5fa5c827a3b79b015` has not passed CI yet; earlier focused results do not validate it |
| #8 | M1 [45028307688](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028307688) | Focused validation build and validation suite passed. Full CI [45028307701](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028307701) queued |
| #10 | Safety preflight [44955623705](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44955623705) | Focused Python preflight, production-evidence ledger and network identity checks passed. Full CI [44955623715](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44955623715) in progress; ancestor-commit job still active and one MSan/fuzz job was cancelled |
| #11 | Wallet/node [45028317103](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028317103); full CI [45028317116](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028317116) | Both queued |
| #12 | Full CI [45027152480](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45027152480); M1 [45027152493](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45027152493) | Both queued |
| #17 | Core chain plumbing [45028325235](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028325235); full CI [45028325268](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028325268) | Both queued |
| #18 | Genesis PoW [45030918005](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45030918005); full CI [45030917985](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45030917985) | Both queued; earlier successful miner evidence belongs to a different head |
| #21 | Offline wallet [45033353451](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45033353451); security [45033353476](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45033353476); candidate parameters [45033353433](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45033353433); full CI [45033353448](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45033353448) | All queued on exact head `2e874a467553783d12cd0f3815b4bc0b86c7cab5` |
| #22 | Core chain plumbing [45032163276](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45032163276); full CI [45032163325](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45032163325) | Focused job pending/queued; full CI queued |
| #23 | Full CI [45031867992](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45031867992) | Queued; no pass claimed |

Queued, pending, cancelled and in-progress jobs are not passes. PR #4/#5's observed failure is addressed by PR #23's narrow CI-only change. CMake's official documentation says the `non-target-directive` diagnostic was added in CMake 4.5: https://cmake.org/cmake/help/latest/diagnostic/CMD_NON_TARGET_DIRECTIVE.html. PR #23 keeps `-Werror=dev` while suppressing only that diagnostic for CMake 4.5 and later.

## Code changes and review completed in this cycle

1. **PR #21 loopback test correction.** A full-file inspection found invalid C++-style `//` comments inside a Python functional test and an attempt to mine 101 blocks using FREELY's production target `0x1d00ffff`. The test would fail Python parsing and, after that, attempt an impractical amount of proof-of-work. The test now uses valid Python comments and checks only the intended same-host networking boundary: chain/genesis identity, loopback peer connection, public/hostname/mapped-IPv6 rejection, and the regtest-only `addconnection` rejection. Mining, wallet funding, transaction relay and reorganization assertions were removed from this isolation test. No consensus target was weakened or changed. New exact-head workflows are queued; no new-head pass is claimed.
2. **PR #6 validation record.** Added exact-head evidence for the successful M1 validation build/suite and the successful retarget vector, PoW, node/CLI/unit-test build and BIP94 boundary workflow. Full CI remains required.
3. **PR #10 validation record.** Added exact-head evidence for the successful safety preflight and noted the in-progress full CI status.
4. **PR #22/#23 validation records.** Recorded exact heads and pending/queued CI status. PR #22's candidate parameters remain unavailable to ordinary production chain selection; PR #23 changes CI scripts only.
5. **Candidate genesis review.** Reviewed the C++ genesis construction and the independent Python coinbase serializer. The `CScriptNum(4)` push encoding used by the serializer matches Bitcoin Core v32.1's `CScript::operator<<(const CScriptNum&)` implementation. No genesis source changes were needed.
6. **Review and merge gate.** Checked open PR metadata, exact heads, base comparisons and inline review threads. No inline review threads were returned. No PR was merged because required exact-head full CI remains pending or failing and PR #21 still depends on the closed-unmerged PR #20 branch.

## Project completion estimate

| Phase | Estimate | Weight |
|---|---:|---:|
| Foundation | 100% | 5% |
| Consensus specification | 92% | 15% |
| Network architecture | 88% | 10% |
| Core implementation | 65% | 25% |
| Testing | 51% | 15% |
| Wallet/node readiness | 40% | 10% |
| Mining | 90% | 5% |
| Security | 71% | 10% |
| Testnet | 10% | 5% |
| Production readiness | 0% | 5% |
| **Weighted total** | **67.60%** | **100%** |

The 70% milestone is 2.40 weighted percentage points away. The estimate increased from 67.35% after the exact-head focused retarget and safety-preflight passes; it remains an estimate and does not imply production readiness.

## Branch averages and denominator changes

- Previous open-PR branch average: **85.9% across 12 branches**. That inventory included PR #20.
- Continuing pre-existing open branches, excluding closed-unmerged PR #20: **85.8% across 11 branches**.
- Current open-PR branch average, including new PRs #22 and #23: **86.5% across 13 branches**.
- Historical all-branch sample: **91.4% across 25 branches**, retained as a historical baseline only. The repository now exposes 39 FREELY-prefixed branches across both repositories; backup/recovery branches have not been individually re-estimated, so the 25-branch historical average is not presented as a current 39-branch average.

## Blockers and next actions

1. Obtain exact-head CI results for PRs #6, #8, #10, #11, #12, #17, #18, #21, #22 and #23. Fix actionable failures and rerun focused checks.
2. Validate PR #23 on CMake 4.5 runners. Only after its full relevant CI passes should PR #4/#5 be rerun against the compatibility fix.
3. Reconcile PR #21 onto the replacement candidate integration in PR #22 before merge consideration. Do not merge PR #21 against the closed PR #20 dependency.
4. Resolve PR #6's 25-commit behind history through a reviewed, tree-preserving synchronization after its current full CI result is available.
5. Continue wallet/node and core chain integration; do not count queued jobs as validation.
6. Keep production genesis activation, public testnet/mainnet launch, DNS seeds, public network exposure, mining deployment and paid infrastructure locked pending separate explicit authorization and independent consensus/security review.

Approved project facts remain unchanged: Bitcoin Core v32.1 fork; independent UTXO SHA-256d PoW; 8 decimals; 50 FLY initial subsidy; 210,000-block halving; 600-second target spacing; 2,016-block difficulty interval; no premine/founder allocation/ICO; integer-only consensus money; €0 budget; scheduled subsidy total 20,999,999.9769 FLY. No inherited Bitcoin hashpower or security is assumed.
