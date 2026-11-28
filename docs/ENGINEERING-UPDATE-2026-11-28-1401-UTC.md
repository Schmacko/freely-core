# FREELY engineering update — 28 November 2026, 14:01 UTC

## Executive status

- Weighted project work estimate: **68.50%** (unchanged from the 13:51 UTC dashboard snapshot).
- Active-PR branch estimate mean: **86.1% across 14 branches**.
- All scored FREELY feature-branch mean: **91.4% across 26 branches**.
- No PR was merged during this update. PR #23 was already merged into the dedicated `freely/upstream-v32.1` integration branch at `40fda3525a323098e76b36a9f33a05a0b02f21e3` after 29/29 full-CI success.
- Production startup remains fail-closed. No production genesis activation, public testnet/mainnet launch, DNS seeds, mining deployment, paid infrastructure or public exposure occurred.

## Repository heads

| Repository/ref | Exact commit |
|---|---|
| `Schmacko/freely-core` default `main` | `710c05b84f7551d00b1316eedb6d11ca077e7f1f` |
| `freely-core:m1-consensus-design` | `1c0b0954768ec3d590b57e4fe843192da0f1130a` (before this report commit) |
| `Schmacko/freely-bitcoin-core.` default `master` | `498b598cf27317b7306a859ce82b0571a0f9e348` |
| `freely/upstream-v32.1` integration | `40fda3525a323098e76b36a9f33a05a0b02f21e3` |

## Implementation performed this run

### PR #8 — invalid chain-type enum values now fail closed

Branch `freely/core-chain-implementation`, exact head **`524c5216db98f9d495a704d980af6edae1c8d778`**.

- Replaced assertion-only terminal paths with explicit `std::invalid_argument` exceptions in `ChainTypeToString`, `CreateBaseChainParams` and `CreateChainParams`.
- Added `invalid_chain_type_enum_is_rejected` coverage for all three entry points.
- This prevents out-of-range enum values from falling through to undefined behaviour in release builds.
- The FREELY production parameter factory still explicitly throws the existing fail-closed startup error; no production identity or consensus value changed.
- Current comparison with integration base: **7 commits ahead, 0 behind**.

Commits:
- `d5fa831599e5690d38b7e642ed41c80b1cd3eda3` — invalid enum rejection in chain-name serialization.
- `16bbc84381de7c57580e2ce5b800a7af9ecf513c` — invalid enum rejection in base parameters.
- `ca780072acd28c65eb1f4f6d512813103a25a3da` — invalid enum rejection in chain parameters.
- `f5c3a8495690ec2895262222358c96b8585a192f` — regression tests.
- `524c5216db98f9d495a704d980af6edae1c8d778` — remove obsolete include after assertion removal.

Exact-head validation:
- Full CI [46152964192](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/46152964192): **25 jobs queued** at the latest poll.
- Focused M1 consensus tests [46152964218](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/46152964218): validation-tests job queued.
- No C++ compile or test pass is claimed on this new head.

### PR #26 — issuance and first-block template tests

Exact head `a3a3042b2bbe7d33ff6f67004175dbe9a75f171b`.

- Full CI [46150590448](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/46150590448): **4 successful, 18 in progress, 5 queued**, no failures at the latest poll.
- The Windows native build and ancestor replay were running; the full matrix is not complete.
- The tests bind issuance assertions to the FREELY candidate parameters, assert the approved 600-second/2,016-block retarget schedule, and test the height-1 block template without mining or changing production settings.

## Live PR and branch dashboard

Completion percentages are work-scope estimates, not test or release-readiness scores.

| PR | Branch | Exact head | Estimate | Current status |
|---:|---|---|---:|---|
| freely-core #2 | `m1-consensus-design` | `1c0b0954768ec3d590b57e4fe843192da0f1130a` | 85% | Open draft; documentation/coordination |
| #4 | `freely/pow-difficulty-audit` | `8576438636fd79749a7048c55430d485e9a192d7` | 90% | Full CI: 1 in progress, 24 queued |
| #5 | `freely/retarget-policy` | `eaa64a77dd28cf4366a057acf6753f66d0406fd1` | 95% | Full CI: 25 queued |
| #6 | `freely/retarget-test-vectors` | `00c6afec352aa1c3460432a28404391b48cce6d7` | 90% | Full CI and both focused workflows queued |
| #8 | `freely/core-chain-implementation` | `524c5216db98f9d495a704d980af6edae1c8d778` | 75% | Full and focused CI pending |
| #10 | `freely/network-safety-preflight` | `782df0ca3d861f9934bc30f5a5aca79f1e85e1d1` | 75% | Synchronized; full and focused CI queued |
| #11 | `freely/wallet-node-readiness` | `86aeb0676c3bfd81fb896177cf3baedf0a558cad` | 70% | 1 ahead/7 behind updated PR #8 base; rebase required |
| #12 | `freely/reconciled-docs` | `3a3af58b5cc2b4508913303d9904368459e37ae1` | 95% | Synchronized; full and focused CI queued |
| #17 | `freely/genesis-and-network-code` | `8a567e0f11a3405d62f52b4b3a7c89869f1d5ec3` | 85% | 1 ahead/7 behind updated PR #8 base; rebase required |
| #18 | `freely/genesis-miner-implementation` | `8e81ea9fbf9c0b079bad1d14e8383cd36a4912b5` | 95% | Full CI 29/29; depends on #17 |
| #21 | `freely/private-node-startup` | `8423e716103ca6e64373f97e4763e8c62f447d71` | 89% | Older alternative; do not merge |
| #22 | `freely/chainparams-reconciled-20261122` | `87e494b444889ae5aacd6b35fdd2313ed115115e` | 92% | Full CI 29/29 and focused pass; depends on #17 |
| #25 | `freely/private-node-integration-squashed-20261126` | `e46167bc48b2037fe8e368e7c64ce2ec5bdbb830` | 85% | 28 successes, 1 MSan/fuzz retry queued; focused security/wallet passed |
| #26 | `freely/issuance-consensus-binding-20261126` | `a3a3042b2bbe7d33ff6f67004175dbe9a75f171b` | 85% | 4 successes, 18 in progress, 5 queued |

PR #23 is merged and excluded from active-PR averages. PR #24 is superseded by #25 and excluded from active-PR averages. PR #1 remains merged into the integration branch, not default `master`.

## CI and dependency findings

- PR #23 exact head passed full CI **29/29**, including ancestor replay, and was squash-merged into `freely/upstream-v32.1` at `40fda3525a323098e76b36a9f33a05a0b02f21e3`. Post-merge push workflow [46150997814](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/46150997814) was queued at the last dashboard poll.
- PR #22 exact head `87e494b444889ae5aacd6b35fdd2313ed115115e`: full CI 29/29 and focused core-chain workflow passed. It remains stacked on PR #17.
- PR #25 exact head: 28/29 jobs successful; MSan/fuzz retry job `140996365407` remains queued. Focused private-node security and offline-wallet workflows passed.
- PR #26 exact head: 4/27 jobs successful, 18 in progress, 5 queued. No current-head C++ test pass yet.
- PR #6 has a new synchronized head and new full/focused runs queued; its earlier 29/29 result belongs to the old head.
- PRs #4 and #5 have been synchronized with the updated integration base; their new full-CI runs are not complete.
- PRs #10 and #12 are also synchronized with the current integration base. Their fresh full and focused workflows are queued; historical failures do not validate or invalidate the new heads.
- PR #11 and PR #17 are now **diverged from their updated PR #8 base**: each is 1 commit ahead and 7 behind. Their earlier focused passes and 28/29 full-CI results (ancestor replay skipped) are stale for the updated dependency.
- PR #18 and PR #22 have complete historical matrices on their own exact heads but depend on PR #17. Their downstream PR #25 and #26 remain stacked on #22/#25 respectively.
- No unresolved inline review threads or submitted reviews were found on the inspected active implementation PRs.

## Completion metrics

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
| **Weighted total** | **68.50%** | **100%** |

- Active-PR branch mean: **86.1% across 14 branches**.
- All scored FREELY feature-branch mean: **91.4% across 26 branches**.
- The 45 FREELY-named refs across both repositories include 19 retained/snapshot refs that are not scored.
- The weighted estimate and branch means are estimates only; they do not represent successful builds, tests, merges or production readiness.

## Merge and release decision

No PR was merged in this update. PR #23 had already been integrated before this run. The #8 → #17 → #22 → #25 → #26 dependency path cannot advance until PR #8's new exact-head tests pass and PR #11/#17 are reconciled with its new head. PR #6 also needs its new exact-head full and focused workflows.

Normal FREELY startup remains fail-closed. The approved subsidy schedule remains 50 FLY initial reward, 210,000-block halving, 8 decimals, with total scheduled issuance 20,999,999.9769 FLY. No inherited Bitcoin hashpower/security is implied. No production powLimit, initial difficulty, final genesis identity or public-network activation is inferred.

## Next actions

1. Complete PR #8 full CI and focused consensus tests on `524c5216db98f9d495a704d980af6edae1c8d778`; inspect any failed steps/logs.
2. Reconcile PR #17 and PR #11 against the updated PR #8 branch, preserving their source changes and the merged CMake 4.5 compatibility helper.
3. Rebuild the downstream #22 → #25 → #26 lineage on the reconciled PR #17 base and rerun full CI on each exact head.
4. Finish PR #25's MSan/fuzz retry.
5. Complete PR #4/#5/#6/#10/#12 fresh full and focused workflows.
6. Reconcile PR #18 after its PR #17 dependency is updated.
7. Do not merge any branch with pending, skipped, cancelled, failed or stale-head checks.

