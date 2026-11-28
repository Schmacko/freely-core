# FREELY Engineering Update — 23 November 2026, 14:07 UTC

## Repository state

| Repository | Default branch | Exact default head |
|---|---|---|
| `Schmacko/freely-core` | `main` | `710c05b84f7551d00b1316eedb6d11ca077e7f1f` |
| `Schmacko/freely-bitcoin-core.` | `master` | `498b598cf27317b7306a859ce82b0571a0f9e348` |

PR #1 is now reported by GitHub as merged into `freely/upstream-v32.1` at merge commit `0f27415ebe114f3e93157a4b3c95e7670012dee1`; that does not mean the FREELY chain is activated on the repository's default branch. PR #20 remains closed and unmerged. PR #22 is the replacement candidate-parameter PR.

The branch inventory contains 3 branches in `freely-core` and 37 in `freely-bitcoin-core.` (40 total). Thirteen branches currently have open PRs; the other 27 are retained historical/recovery branches and are not assigned fresh completion estimates in this report.

## Open PR branches and estimated completion

| PR | Branch | Exact head | Estimated completion |
|---|---|---|---:|
| freely-core #2 | `m1-consensus-design` | `574ee6ed1f46785e2134d7d465307a34c79fa98b` | 85% |
| #4 | `freely/pow-difficulty-audit` | `92d0c7957fd054c74a195de2ba8133cabd696a18` | 90% |
| #5 | `freely/retarget-policy` | `3d5006d411ed2781985d00506c3e1a3c36675962` | 95% |
| #6 | `freely/retarget-test-vectors` | `5cbca965a9340f85631804a5fa5c827a3b79b015` | 95% |
| #8 | `freely/core-chain-implementation` | `370d4a436b7218e77de25dc296d14e01b38de589` | 75% |
| #10 | `freely/network-safety-preflight` | `a7278237128443020cd5d36715734317d9e81360` | 75% |
| #11 | `freely/wallet-node-readiness` | `86aeb0676c3bfd81fb896177cf3baedf0a558cad` | 80% |
| #12 | `freely/reconciled-docs` | `63d698df065f8729435dc4aca455bef18f53e41f` | 95% |
| #17 | `freely/genesis-and-network-code` | `8a567e0f11a3405d62f52b4b3a7c89869f1d5ec3` | 85% |
| #18 | `freely/genesis-miner-implementation` | `28b76007ae757281c737e7318b5b3b33aeb1e754` | 90% |
| #21 | `freely/private-node-startup` | `b03aaf3419060c4942273519499a589294513cc9` | 90% |
| #22 | `freely/chainparams-reconciled-20261122` | `a07eaa5ab4380c4b9df9edf6efa119642538d4d3` | 90% |
| #23 | `freely/ci-cmake-4-5-compat` | `c42df184aa1d65c9e7c1fa80d6a6cd1553b0d027` | 80% |

The open-PR branch average is **86.5% (13 branches)**. The prior report was **85.9% (12 branches)**. The denominator changed because closed-unmerged PR #20 was replaced by PR #22 and new PR #23 was added.

The historical all-branch average remains **91.4% (25 branch estimates)** from the prior inventory. It has not been recomputed across the current 40-branch inventory: 27 retained branches have no refreshed estimates, so a new 40-branch mean would be misleading.

## Weighted project completion estimate

| Phase | Completion | Weight |
|---|---:|---:|
| Foundation | 100% | 5% |
| Consensus specification | 93% | 15% |
| Network architecture | 88% | 10% |
| Core implementation | 66% | 25% |
| Testing | 53% | 15% |
| Wallet/node readiness | 43% | 10% |
| Mining | 90% | 5% |
| Security | 71% | 10% |
| Testnet | 10% | 5% |
| Production readiness | 0% | 5% |
| **Weighted estimate** | **68.60%** | **100%** |

This is an engineering-work estimate, not a build/test/merge status. It is up 1.25 percentage points from the previous user-visible 67.35% dashboard. The modest increase reflects completed retarget CI, candidate-chain focused validation, and expanded wallet/node and security regression work. Production readiness remains 0%.

## Verified CI evidence and blockers

- **PR #6, head `5cbca965...`:** retarget workflow `45034083151` passed; M1 consensus workflow `45034083189` passed; full CI `45034083216` completed with all reported jobs successful, including ancestor replay, native Windows/macOS, sanitizers, fuzz and cross-platform jobs. The branch comparison reports 4 commits ahead and 25 behind its base, so ancestry must be reconciled and checks rerun before merge.
- **PR #11, head `86aeb067...`:** wallet/node readiness workflow `45028317103` passed. Full CI `45028317116` concluded success, but the ancestor-commit job was skipped; under the project policy this is not an all-required-jobs pass.
- **PR #22, head `a07eaa5...`:** focused core-chain workflow `45152309517` passed, including wallet-enabled node/CLI/unit-test build, FREELY chain/consensus/PoW/wallet suites, nonce helper and fail-closed startup checks. Full CI `45152309511` ended in failure because several jobs were cancelled and ancestor replay was skipped. This is not a full CI pass.
- **PR #21, previous head `487ae9a...`:** wallet-enabled node/CLI C++ build passed; the offline-wallet functional test failed because it attempted `createwallet(descriptors=False)`, which v32.1 rejects. The test now uses `descriptors=True` at head `b03aaf3419060c4942273519499a589294513cc9`. New offline-wallet run `45193779224`, security run `45193779608`, candidate-parameter run `45193779125`, and full CI `45193779138` were queued/pending at report time.
- **PR #18, head `28b76007...`:** previous focused run `45191422492` built the standalone miner but failed its self-test. The cause was a test mismatch: `08` was tested with the parser's default decimal base while expecting base-zero octal rejection. The parser now distinguishes invalid base digits from numeric overflow, and the self-test separately checks decimal `08` and base-zero invalid `08`. New focused run `45192089154` and full CI `45192090435` were queued.
- **PR #23, head `c42df184...`:** previous full CI `45031867992` failed in ancestor replay because its helper still used bare `-Werror=dev` under CMake 4.5. The ancestor helper now applies the narrowly scoped `-Wno-error=non-target-directive` on CMake 4.5+, retaining the fatal developer-warning policy for other warnings. New full CI `45193126171` was queued.
- **PRs #4 and #5:** previous full CI jobs failed on CMake 4.5's `non-target-directive` diagnostic in Windows builds; macOS native jobs also failed on Xcode 16.2/Clang 16.2 x86 intrinsic and warning probes on the ARM64 runner. PR #23 addresses the CMake 4.5 path; the macOS toolchain issue remains separate.
- **PR #12:** focused consensus checks `45027152493` passed. Full CI `45027152480` failed on the same macOS toolchain issue and CMake 4.5 Windows configuration.
- **PRs #8, #10 and #17:** their focused workflows passed, but their full matrices were not complete passes because ancestor replay and/or MSan/fuzz jobs were skipped or cancelled.
- **PR #2:** documentation/design only; no executable workflow is associated with its current head.

All 13 open PRs were inspected for inline review threads; none were returned. GitHub currently reports the inspected open PRs as mergeable, but that flag does not substitute for full CI, ancestry/dependency review or exact-head checks.

## Code changes in this cycle

1. PR #21: added the missing Python shebang to the executable loopback-network test after the exact-head lint log identified it; the lint job subsequently passed. Updated the offline-wallet functional test to create a descriptor wallet after v32.1 rejected legacy-wallet creation.
2. PR #18: corrected unsigned integer parsing so a digit outside the selected base raises `invalid_argument`, and adjusted the self-test to distinguish decimal leading-zero input from invalid base-zero octal input.
3. PR #23: extended the ancestor-commit CI helper with CMake 4.5 version detection and the same narrowly scoped developer-warning exception used by the normal POSIX/Windows CI paths.
4. Updated PR descriptions with exact heads, workflow IDs, evidence and unresolved dependencies/risks.

No PR was merged in this cycle. No production genesis activation, public testnet/mainnet launch, DNS seeds, mining deployment, public RPC/P2P exposure or paid infrastructure was enabled.

## Safety and release gates

The approved candidate parameter set may be implemented and independently verified, but this does not authorize network activation or launch. Keep normal production chain selection fail-closed. Do not invent or modify powLimit, genesis, initial difficulty, BIP94/time-warp policy, activation settings or network identity. No inherited Bitcoin hashpower/security is implied. The approved economic rules remain 8 decimals, integer-only consensus money, 50 FLY initial subsidy, 210,000-block halving, 600-second spacing, 2,016-block adjustment, no premine/founder allocation/ICO, and scheduled subsidy total 20,999,999.9769 FLY.

## Next actions

1. Verify the new PR #21 offline-wallet test and all three focused security/candidate/wallet workflows on exact head `b03aaf3419060c4942273519499a589294513cc9`; fix any new failure and rerun.
2. Verify the PR #18 miner self-test on exact head `28b76007ae757281c737e7318b5b3b33aeb1e754`; then inspect the complete full-CI matrix.
3. Verify the PR #23 ancestor-replay fix on exact head `c42df184aa1d65c9e7c1fa80d6a6cd1553b0d027`.
4. Reconcile PR #21's base dependency on closed-unmerged PR #20 with replacement PR #22 before considering any merge.
5. Resolve stale ancestry for PR #6 and rerun exact-head checks after synchronization.
6. Continue investigating the Xcode 16.2/Clang 16.2 macOS native build issue without weakening consensus or general compiler-warning policy.



## Addendum — 23 November 2026, 14:30 UTC

- PR #18 advanced from the previously recorded head `28b76007ae757281c737e7318b5b3b33aeb1e754` to `27dad83b05e24d2172d4be183f14542a4d45d888` after correcting two multi-character newline literals in the diagnostic code. Focused workflow `45194441784` now passes all steps, including miner build, SHA-256d serialization self-test, argument rejection and approved genesis header verification. Full CI `45194442046` remains queued.
- PR #21 remains at `b03aaf3419060c4942273519499a589294513cc9`. Its wallet-enabled build, candidate-parameter build and network-isolation build are still in progress; no new functional-test pass is claimed yet.
- PR #23 remains at `c42df184aa1d65c9e7c1fa80d6a6cd1553b0d027`. The latest CI run `45193126171` has started Windows jobs; one Windows native fuzz job has completed CMake generation successfully, while the remaining build/test matrix is still pending or in progress.
- These updates do not change the weighted 68.60% estimate or production-readiness status. No merge, activation or deployment occurred.
