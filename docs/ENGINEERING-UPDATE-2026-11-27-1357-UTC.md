# FREELY engineering update — 27 November 2026, 13:57 UTC

## Executive status

- Weighted estimated project completion: **68.50%** (previous baseline 68.35%; +0.15 points from additional issuance/first-block-template test work).
- No merge performed in this cycle.
- Production chain selection remains fail-closed. No production genesis activation, public testnet/mainnet launch, DNS seeds, mining deployment, paid infrastructure, deployment or public network exposure occurred.
- The implementation remains a Bitcoin Core v32.1 fork. FREELY uses an independent SHA-256d UTXO proof-of-work chain; Bitcoin hashpower/security is not inherited.

## Repository heads

| Repository | Default branch | Exact default head |
|---|---|---|
| `Schmacko/freely-core` | `main` | `710c05b84f7551d00b1316eedb6d11ca077e7f1f` |
| `Schmacko/freely-bitcoin-core.` | `master` | `498b598cf27317b7306a859ce82b0571a0f9e348` |

Pinned integration baseline `freely/upstream-v32.1`: `0f27415ebe114f3e93157a4b3c95e7670012dee1`.
PR #1 is merged into that integration branch, not into default `master`.

The implementation repository exposes 45 `freely/*` refs: 44 feature refs plus the pinned `freely/upstream-v32.1` baseline. Eighteen retained/snapshot feature refs are not scored in the current branch averages.

## Active open-PR branches

Estimates are work-scope completion, not CI or merge status. The older PR #21 alternative is retained in the active-PR mean for continuity; PR #24 is superseded and excluded.

| PR | Branch | Exact head | Estimate | Current validation |
|---:|---|---|---:|---|
| freely-core #2 | `m1-consensus-design` | `c941e58efbc85577e97482abdbbb2e71d4c5eeed` | 85% | Documentation/design PR; no Actions run for this documentation head |
| #4 | `freely/pow-difficulty-audit` | `92d0c7957fd054c74a195de2ba8133cabd696a18` | 90% | Full CI failed; CMake 4.5 `non-target-directive` diagnostic |
| #5 | `freely/retarget-policy` | `3d5006d411ed2781985d00506c3e1a3c36675962` | 95% | Full CI failed; same CMake 4.5 compatibility blocker |
| #6 | `freely/retarget-test-vectors` | `5cbca965a9340f85631804a5fa5c827a3b79b015` | 90% | Full CI 29/29 passed; branch is 4 ahead / 25 behind upstream, so history must be reconciled |
| #8 | `freely/core-chain-implementation` | `370d4a436b7218e77de25dc296d14e01b38de589` | 75% | Full CI conclusion success, but ancestor-replay job skipped; not a strict complete pass |
| #10 | `freely/network-safety-preflight` | `77106e215d5a04c4e6529650e3f8cbcb6a066e17` | 75% | Focused preflight passed; full CI has 3 cancelled jobs |
| #11 | `freely/wallet-node-readiness` | `86aeb0676c3bfd81fb896177cf3baedf0a558cad` | 70% | Focused wallet/node passed; full CI conclusion success, ancestor replay skipped |
| #12 | `freely/reconciled-docs` | `9d772339ab85fc38e2d67c591999c57aee11babd` | 95% | Focused spec checks passed; full CI failed |
| #17 | `freely/genesis-and-network-code` | `8a567e0f11a3405d62f52b4b3a7c89869f1d5ec3` | 85% | Focused core-chain passed; full CI conclusion success, ancestor replay skipped |
| #18 | `freely/genesis-miner-implementation` | `8e81ea9fbf9c0b079bad1d14e8383cd36a4912b5` | 95% | Full CI 29/29 passed; depends on PR #17 |
| #21 | `freely/private-node-startup` | `8423e716103ca6e64373f97e4763e8c62f447d71` | 89% | Older alternative; focused candidate/wallet/security passed, full CI incomplete |
| #22 | `freely/chainparams-reconciled-20261122` | `87e494b444889ae5aacd6b35fdd2313ed115115e` | 92% | Focused chain plumbing passed; full CI 27 success, 1 queued, 1 cancelled |
| #23 | `freely/ci-cmake-4-5-compat` | `250d6657da43967240dacec246a45159bfc6cbb3` | 95% | Full CI 27 success, 1 queued, 1 cancelled |
| #25 | `freely/private-node-integration-squashed-20261126` | `e46167bc48b2037fe8e368e7c64ce2ec5bdbb830` | 85% | Focused security and offline-wallet passed; full CI 27 success, 1 queued, 1 cancelled |
| #26 | `freely/issuance-consensus-binding-20261126` | `4b97c8aa607d30ca3cd4cb6ea10b23050753ea87` | 85% | Fresh full CI in progress: 1 success, 18 in progress, 8 queued |

Superseded PR #24 remains open for audit traceability at `56a0012480c5014c9cd77f764bb6f53c80bcccef`; do not merge it. PR #25 is the replacement integration branch. PR #21 is an older alternative to the PR #22 → #25 lineage.

## This cycle's engineering work

### PR #26: issuance and block-template integration tests

The test-only branch binds the FREELY subsidy regression to `CChainParams::FreelyCandidate()`, checks the approved 210,000-block halving interval and subsidy boundaries, and verifies scheduled issuance of 20,999,999.9769 FLY plus maximum spendable issuance of 20,999,949.9769 FLY after excluding the unspendable genesis coinbase.

The functional loopback test now requests a real height-1 block template and checks:
- height 1 and previous-hash linkage to the candidate genesis;
- candidate `nBits` value;
- 50 FLY coinbase value;
- empty transaction list.

The first full-CI run on the prior head `b706908edeb83b04d578c52cbeefee5a08202b81` failed because the fixed candidate genesis timestamp (2026-11-18) was older than the CI runner's default maximum tip age. `getblocktemplate` correctly returned `RPC_CLIENT_IN_INITIAL_DOWNLOAD (-10)`. The test incorrectly assumed the node had left IBD.

I added test-only `-maxtipage=3153600000` to the isolated loopback fixture. This removes calendar dependence for the template test and does not change consensus parameters, production defaults or startup policy.

- Fix commit: `4b97c8aa607d30ca3cd4cb6ea10b23050753ea87`.
- Fresh full CI: [46012031290](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/46012031290).
- Latest observation: 1 successful job, 18 in progress, 8 queued. No full C++ build/test pass is claimed yet.

### PR #25: private-node integration validation

On exact head `e46167bc48b2037fe8e368e7c64ce2ec5bdbb830`:
- [Private-node security workflow 45832040167](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45832040167) passed.
- [Offline-wallet workflow 45832039994](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45832039994) passed.
- [Full CI 45832040012](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45832040012) currently has 27 successes, one macOS-native job queued, and one MSan/fuzz job cancelled. The cancelled job must be rerun and pass.

### PR #22 and #23 retries

- PR #22 [full CI 45413263894](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45413263894): 27 successes, one macOS-native job queued, one macOS-native-fuzz job cancelled. Focused chain-plumbing workflow 45413263918 passed.
- PR #23 [full CI 45204795368](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45204795368): 27 successes, one macOS-native-fuzz job queued, one Alpine/musl job cancelled. The narrow CMake 4.5 fix is not considered fully validated until both remaining jobs succeed.

Retry attempts were rejected with HTTP 403 while the containing workflow runs were active; GitHub subsequently showed the remaining jobs as queued/cancelled. Retry the cancelled jobs only after the queued job reaches a terminal state.

## Strict validation evidence

- PR #6 full CI [45034083216](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45034083216): 29/29 successful.
- PR #18 full CI [45204040649](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45204040649): 29/29 successful; focused genesis verification passed.
- PR #8 full CI [45028307701](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028307701): workflow conclusion success, but ancestor replay skipped.
- PR #11 full CI [45028317116](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028317116): workflow conclusion success, but ancestor replay skipped.
- PR #17 full CI [45028325268](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028325268): workflow conclusion success, but ancestor replay skipped.
- PR #10 full CI [45206108420](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45206108420): 26 successes and 3 cancelled jobs.
- PR #12 full CI [45206228485](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45206228485): failed; focused specification checks passed.
- PR #4 full CI [44910339764](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44910339764) and #5 [44910342400](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44910342400): failed on the CMake 4.5 vendored secp256k1 `non-target-directive` diagnostic promoted by `-Werror=dev`.

Queued, pending, cancelled, skipped and failed jobs are not passes. Only PRs #6 and #18 currently have full 29/29 matrices including ancestor replay.

## Review, ancestry and merge status

- GitHub reports the open PRs as mergeable; no unresolved inline review threads were returned for PRs #2, #4–#26 in the current inventory.
- PR #25 is 2 commits ahead / 0 behind its PR #22 base.
- PR #26 is 3 commits ahead / 0 behind PR #25.
- PR #6 remains 4 ahead / 25 behind `freely/upstream-v32.1`.
- PR #18 depends on #17; #17 depends on #8. PR #11 also depends on #8.
- No PR was merged this cycle. Green CI on #6 and #18 is not enough to merge because dependencies and history are unresolved.

## Completion metrics

Established phase weights:

| Phase | Estimate | Weight |
|---|---:|---:|
| Foundation | 100% | 5% |
| Consensus specification | 92% | 15% |
| Network architecture | 88% | 10% |
| Core implementation | 65% | 25% |
| Testing | 51% | 15% |
| Wallet/node readiness | 45% | 10% |
| Mining | 90% | 5% |
| Security | 75% | 10% |
| Testnet | 10% | 5% |
| Production readiness | 0% | 5% |
| **Weighted overall estimate** | **68.50%** | **100%** |

- Active open-PR branch mean: **86.7% across 15 branches** (including coordination PR #2 and the older PR #21 alternative; excluding superseded PR #24).
- Previous baseline: **86.9% across 14 branches**. The denominator increased by one because PR #26 adds a scored test branch.
- All scored feature-branch mean: **91.2% across 26 branches**, derived from the prior 91.4% across 25 plus PR #26's 85% estimate. This excludes the pinned upstream baseline and 18 unscored retained/snapshot feature refs.
- The overall weighted estimate is not a CI, merge, security-certification or production-readiness score.

## Blockers and next actions

1. Inspect PR #26 full CI and ancestor-replay logs on exact head `4b97c8aa607d30ca3cd4cb6ea10b23050753ea87`; fix any deterministic failure and rerun.
2. Finish PR #25 macOS native and MSan/fuzz jobs; the latter is currently cancelled.
3. Finish PR #23 macOS fuzz and Alpine/musl jobs before integrating its CMake 4.5 fix.
4. Finish PR #22's macOS native and macOS native-fuzz jobs.
5. Revalidate #4, #5 and #12 after the CMake compatibility fix reaches the integration base.
6. Reconcile PR #6's 25-commit divergence and validate dependent PRs in order (#8 → #11/#17 → #18; #22 → #25 → #26).
7. Preserve fail-closed startup. Do not infer or activate production genesis, powLimit, initial difficulty, network identity or activation choices. No public network, DNS seed, mining deployment, paid infrastructure or deployment is authorized.
