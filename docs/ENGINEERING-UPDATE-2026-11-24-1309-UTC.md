# FREELY engineering update — 24 November 2026, 13:09 UTC

## Repository and branch state

- `Schmacko/freely-core`: default branch `main`, head `710c05b84f7551d00b1316eedb6d11ca077e7f1f`.
- `Schmacko/freely-bitcoin-core.`: default branch `master`, head `498b598cf27317b7306a859ce82b0571a0f9e348`.
- The pinned FREELY v32.1 integration branch `freely/upstream-v32.1` is at `0f27415ebe114f3e93157a4b3c95e7670012dee1`.
- PR #1 is now confirmed merged into `freely/upstream-v32.1` at merge commit `0f27415ebe114f3e93157a4b3c95e7670012dee1`; this is not a merge into the repository default branch.
- PRs #3, #7, #9 and #20 are closed without merge. PR #20's candidate work is being replaced by PR #22. PR #21 still targets the closed PR #20 branch and must be reconciled before merge.

## Active pull requests and estimated work completion

| PR | Branch | Exact head | Estimate | State |
|---|---|---|---:|---|
| #2 | `m1-consensus-design` | `d165d7920210c122d6931b912bd2d5697c6869d0` | 85% | Open draft |
| #4 | `freely/pow-difficulty-audit` | `92d0c7957fd054c74a195de2ba8133cabd696a18` | 90% | Open draft |
| #5 | `freely/retarget-policy` | `3d5006d411ed2781985d00506c3e1a3c36675962` | 95% | Open draft |
| #6 | `freely/retarget-test-vectors` | `5cbca965a9340f85631804a5fa5c827a3b79b015` | 90% | Open draft |
| #8 | `freely/core-chain-implementation` | `370d4a436b7218e77de25dc296d14e01b38de589` | 75% | Open draft |
| #10 | `freely/network-safety-preflight` | `77106e215d5a04c4e6529650e3f8cbcb6a066e17` | 75% | Open draft |
| #11 | `freely/wallet-node-readiness` | `86aeb0676c3bfd81fb896177cf3baedf0a558cad` | 70% | Open draft |
| #12 | `freely/reconciled-docs` | `9d772339ab85fc38e2d67c591999c57aee11babd` | 95% | Open draft |
| #17 | `freely/genesis-and-network-code` | `8a567e0f11a3405d62f52b4b3a7c89869f1d5ec3` | 85% | Open draft |
| #18 | `freely/genesis-miner-implementation` | `8e81ea9fbf9c0b079bad1d14e8383cd36a4912b5` | 95% | Open draft |
| #21 | `freely/private-node-startup` | `d63c8f957117fe205916efed6f354bab2749d43a` | 90% | Open draft |
| #22 | `freely/chainparams-reconciled-20261122` | `bf941e6438314698e045240f360da44b87694003` | 90% | Open |
| #23 | `freely/ci-cmake-4-5-compat` | `250d6657da43967240dacec246a45159bfc6cbb3` | 90% | Open draft |

The 13 active PR branches average **86.5%** estimated work completion (13 branches). The historical all-branch scored average remains **91.4% across 25 branches**; it has not been recomputed because the current repository now has 40 FREELY-named refs, including preserved pre-rebase/pre-squash backups that are not independent active workstreams. The active-PR denominator is the current comparable measure.

## Weighted project progress

| Phase | Estimate | Weight |
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

This estimate is intentionally unchanged this cycle: test fixes were committed, but their new-head CI is still running or queued. Work estimates are not build/test evidence.

## Exact-head CI evidence

- **#6**: focused retarget and M1 workflows passed; full CI run `45034083216` passed 29/29 jobs. The branch is 25 commits behind its base, and its diff includes stale CI/chain-parameter changes; it is not merge-ready.
- **#8**: focused M1 tests passed; full CI `45028307701` has 28 successes and one skipped ancestor-commit job. A skipped job is not a pass.
- **#11**: focused wallet/node readiness passed; full CI `45028317116` has 28 successes and one skipped ancestor-commit job.
- **#17**: focused core-chain plumbing passed; full CI `45028325268` has 28 successes and one skipped ancestor-commit job.
- **#18**: focused genesis proof-of-work verification passed; full CI `45204040649` passed 29/29 jobs.
- **#10**: focused network-safety preflight passed. Full CI `45206108420` has 26 successful jobs, two cancelled jobs and one queued macOS fuzz rerun; no full pass is claimed.
- **#12**: focused consensus-specification checks passed. Full CI `45206228485` has 24 successes, three failures and two cancellations. The failures include CMake 4.5 compatibility and ancestor replay.
- **#4 and #5**: full CI runs `44910339764` and `44910342400` failed on CMake 4.5 compatibility in Windows/macOS jobs and ancestor replay.
- **#21**, exact head `d63c8f957117fe205916efed6f354bab2749d43a`: full CI `45401693650` has one success, 17 jobs in progress and seven queued; security `45401693636` and candidate-parameter `45401693605` are in progress; offline-wallet `45401693651` is queued.
- **#22**, exact head `bf941e6438314698e045240f360da44b87694003`: full CI `45403772029` and focused chain-plumbing `45403771901` are queued. Its final tree is consolidated on the PR #17 base; the previous multi-commit history is preserved in `freely/chainparams-reconciled-pre-squash-final-20261124`.
- **#23**, exact head `250d6657da43967240dacec246a45159bfc6cbb3`: CI `45204795368` has 27 successes, one cancelled Alpine job and one queued macOS-native-fuzz rerun. The rerun has not completed.
- **#2**: no workflow run is attached to its current head.

Queued, pending, cancelled, skipped and infrastructure-failed jobs are not validation passes.

## Verified changes in this cycle

### PR #21 — private node and wallet tests

Commits on `freely/private-node-startup`:

- `999aa12ecfecc04fdf4f08ddcb9b7b38c3c8ff95`: the WIF unit test now supplies the explicit offline-development flags before selecting FREELY parameters, then restores the development gate.
- `9d96c71f59af9eae879c4c4b874027b63a98a47b`: updated the ArgsManager chain-merge test digest for the new `-freely` conflict diagnostic.
- `d63c8f957117fe205916efed6f354bab2749d43a`: removed orphaned undefined legacy-wallet references from the descriptor-wallet functional test.

These changes address confirmed failures in the prior exact-head wallet, unit-test and Python-lint runs. The new exact-head workflows have not yet passed.

### PR #22 — candidate chain parameters

- Removed shebang lines from two Python files stored as mode 100644, fixing the exact lint defect.
- Consolidated the final reviewed tree into one commit on top of PR #17 to remove an intermediate commit that failed ancestor replay because the declaration and definition of `FreelyCandidate` were temporarily out of sync.
- Preserved the pre-squash tree in `freely/chainparams-reconciled-pre-squash-final-20261124`.
- Added `docs/FREELY-CHAINPARAMS-CANDIDATE-STATUS.md` to document the candidate-only boundary and outstanding production decisions.

### PR #23 and PR #10 — CI reruns

- Retried the cancelled macOS-native-fuzz job on PR #23; it remains queued. Alpine remains cancelled and must be retried after the active rerun finishes.
- Retried the cancelled macOS-native-fuzz job on PR #10; it remains queued. The macOS-native and ancestor-commit jobs remain cancelled and require another retry after the active rerun finishes.

## Dependency and merge blockers

1. PR #8 is the parent of PR #11 and PR #17; PR #11 and #17 are each one commit ahead and their ancestor-commit job is skipped. These checks must be made executable/passable before merge.
2. PR #18 has 29/29 full CI successes but depends on PR #17, which is not yet fully validated.
3. PR #22 depends on PR #17. Its new two-commit history is intended to run ancestor replay, but its exact-head CI is queued.
4. PR #21 still targets the closed, unmerged PR #20 branch. It must be reconciled with the replacement PR #22 candidate tree before merge.
5. PR #6 is 25 commits behind the current integration base and includes stale changes; rebase/reconstruction is required.
6. PR #4, #5 and #12 need the CMake 4.5 compatibility work from PR #23 and fresh exact-head CI after synchronization.
7. PR #10, #23 need cancelled-job reruns to finish.
8. Production powLimit, final genesis identity/commitments, initial difficulty, BIP94/time-warp policy and activation matrix remain subject to explicit owner review. No production parameters are activated.

## Release boundary

No PR was merged in this cycle. No production genesis activation, DNS seed deployment, public testnet/mainnet launch, mining deployment, paid service, deployment or public network exposure was performed or authorized. FREELY remains an independent UTXO SHA-256d proof-of-work chain; Bitcoin's hashpower/security is not inherited.
