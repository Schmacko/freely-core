# FREELY engineering update — 25 November 2026, 13:10 UTC

## Repository state

- `Schmacko/freely-core`: default branch `main`, head `710c05b84f7551d00b1316eedb6d11ca077e7f1f`.
- `Schmacko/freely-bitcoin-core.`: default branch `master`, head `498b598cf27317b7306a859ce82b0571a0f9e348`.
- Bitcoin Core v32.1 integration branch `freely/upstream-v32.1`: head `0f27415ebe114f3e93157a4b3c95e7670012dee1`.
- PR #1 is confirmed merged into `freely/upstream-v32.1` at `0f27415ebe114f3e93157a4b3c95e7670012dee1`; this is not a merge into repository `master`.
- The fork currently exposes 43 FREELY-named branches. Fourteen branches have open PRs across the two repositories; the remainder include retained pre-rebase/pre-squash snapshots and closed work branches.

## Active PR branches and estimates

These are engineering-completion estimates, not CI pass rates or merge readiness.

| Repository / PR | Branch | Exact head | Estimate |
|---|---|---|---:|
| freely-core #2 | `m1-consensus-design` | `dba095fa9014282187f24fa15d023dc23e033c90` | 85% |
| bitcoin-core #4 | `freely/pow-difficulty-audit` | `92d0c7957fd054c74a195de2ba8133cabd696a18` | 90% |
| bitcoin-core #5 | `freely/retarget-policy` | `3d5006d411ed2781985d00506c3e1a3c36675962` | 95% |
| bitcoin-core #6 | `freely/retarget-test-vectors` | `5cbca965a9340f85631804a5fa5c827a3b79b015` | 90% |
| bitcoin-core #8 | `freely/core-chain-implementation` | `370d4a436b7218e77de25dc296d14e01b38de589` | 75% |
| bitcoin-core #10 | `freely/network-safety-preflight` | `77106e215d5a04c4e6529650e3f8cbcb6a066e17` | 75% |
| bitcoin-core #11 | `freely/wallet-node-readiness` | `86aeb0676c3bfd81fb896177cf3baedf0a558cad` | 70% |
| bitcoin-core #12 | `freely/reconciled-docs` | `9d772339ab85fc38e2d67c591999c57aee11babd` | 95% |
| bitcoin-core #17 | `freely/genesis-and-network-code` | `8a567e0f11a3405d62f52b4b3a7c89869f1d5ec3` | 85% |
| bitcoin-core #18 | `freely/genesis-miner-implementation` | `8e81ea9fbf9c0b079bad1d14e8383cd36a4912b5` | 95% |
| bitcoin-core #21 | `freely/private-node-startup` | `8423e716103ca6e64373f97e4763e8c62f447d71` | 89% |
| bitcoin-core #22 | `freely/chainparams-reconciled-20261122` | `87e494b444889ae5aacd6b35fdd2313ed115115e` | 92% |
| bitcoin-core #23 | `freely/ci-cmake-4-5-compat` | `250d6657da43967240dacec246a45159bfc6cbb3` | 95% |
| bitcoin-core #24 | `freely/private-node-integration-20261124` | `226a536b60b9b92a0b3cb39e9fe3484556597dd4` | 85% |

- Open-PR branch average: **86.9% (14 branches)**. The previous 12-branch baseline was 85.9%; the denominator now includes replacement PR #22 and new CI/private-node PRs #23–#24, while closed PR #20 is no longer counted.
- Historical all-branch scored average: **91.4% (25 scored branches)**. This is the prior scored baseline, not a newly recomputed average across all 43 named branches; 18 retained/snapshot branches are not currently assigned estimates.

## Weighted project estimate

| Phase | Estimate | Weight |
|---|---:|---:|
| Foundation | 100% | 5% |
| Consensus specification | 92% | 15% |
| Network architecture | 88% | 10% |
| Core implementation | 65% | 25% |
| Testing | 50% | 15% |
| Wallet/node readiness | 45% | 10% |
| Mining | 90% | 5% |
| Security | 75% | 10% |
| Testnet | 10% | 5% |
| Production readiness | 0% | 5% |
| **Weighted total** | **68.35%** | **100%** |

The estimate increased from the 67.35% baseline by one percentage point because PR #24 now carries the wallet-recovery and loopback-private implementation/test work into the reconciled candidate lineage. This is still unmerged work in progress; CI status is reported separately below.

## Exact-head CI and PR state

- **PR #1:** merged, integration merge commit `0f27415ebe114f3e93157a4b3c95e7670012dee1`.
- **PR #2 (freely-core):** open draft, documentation/design only; no workflow run was associated with its current documentation head.
- **PR #4:** full CI run `44910339764` failed (24/29 jobs succeeded). Logs show CMake 4.5's `non-target-directive` diagnostic promoted to an error by `-Werror=dev` in ancestor/Windows configuration; macOS CI also failed during configure.
- **PR #5:** full CI run `44910342400` failed (23/29 succeeded); same CMake 4.5 compatibility issue, with additional cancelled matrix jobs.
- **PR #6:** focused retarget and M1 workflows `45034083151` and `45034083189` passed; full CI `45034083216` passed **29/29 jobs**. However, its branch comparison is **4 commits ahead and 25 behind** `freely/upstream-v32.1`; its CI/workflow diff overlaps the cleaner PR #23 compatibility work. Do not merge until reconciled and rerun on a current base.
- **PR #8:** focused M1 workflow `45028307688` passed; full CI `45028307701` completed with 28/29 jobs, with `test ancestor commits` skipped. Under the strict policy this is not a complete full-CI pass.
- **PR #10:** focused safety workflow `45206108677` passed. Full CI `45206108420` is queued after retry; the preceding attempt had 26/29 jobs successful and three cancelled.
- **PR #11:** focused wallet/node workflow `45028317103` passed; full CI `45028317116` completed 28/29 with the ancestor job skipped.
- **PR #12:** focused consensus specification workflow `45206228587` passed; full CI `45206228485` failed (24/29 succeeded), including CMake 4.5 configuration failures and cancelled macOS jobs.
- **PR #17:** focused core-chain workflow `45028325235` passed; full CI `45028325268` completed 28/29 with the ancestor job skipped.
- **PR #18:** focused genesis PoW workflow `45204041280` passed; full CI `45204040649` passed **29/29 jobs**. It remains stacked on PR #17.
- **PR #21:** candidate-chain, offline-wallet and private-node security workflows `45428003942`, `45428004095` and `45428003902` passed. Full CI `45428003881` is queued after retry; its preceding attempt had 26/29 successful, two cancelled and the ancestor job skipped. This branch still targets the closed/unmerged PR #20 lineage and is superseded for integration purposes by PR #24.
- **PR #22:** focused core-chain workflow `45413263918` passed. Full CI `45413263894` is queued after retry; the preceding attempt had 27/29 successful and two cancelled.
- **PR #23:** CMake 4.5 compatibility CI fix. Full CI `45204795368` is queued after retry; the latest job list shows 27 successful jobs, macOS-native-fuzz queued (job `139230195248`) and Alpine (musl) cancelled (job `139230201029`). No full pass is claimed yet.
- **PR #24:** offline-wallet workflow `45482775752` and private-node security workflow `45482776341` passed. Full CI `45482775921` is queued after retry; the preceding attempt had 26/29 successful and three cancelled jobs.

## Review, ancestry and merge gates

- No inline review threads or submitted reviews were returned for the active PRs inspected.
- GitHub reports the open PRs as mergeable, but that is not a substitute for exact-head full CI, complete diff review or dependency readiness.
- Dependency chain: PR #8 → PR #17 → PR #22 → PR #24. PR #18 also depends on PR #17; PR #11 depends on PR #8. PR #21 is a stale alternative based on closed PR #20.
- PR #23 is an independent CI compatibility change based on `freely/upstream-v32.1`. Its four-file diff keeps `-Werror=dev` while suppressing only CMake 4.5's new `non-target-directive` diagnostic, and updates ancestor replay to use the PR-head helper. It is the likely prerequisite to cleanly rerun PRs #4, #5 and #12, but cannot merge until all 29 jobs pass on its exact head.
- PR #22 exposes a deterministic genesis candidate for tests/private development only; `CreateChainParams(..., ChainType::FREELY)` remains fail-closed in that branch. Candidate nonce `2238688522` and hash `0000000000e43054a010a58bde94ce509904f40f697fb874eedd426755cc2f78` remain unapproved as final production identity.
- PR #24 adds explicit offline-development and loopback-private modes, guards runtime peer additions, and adds wallet address/signing/backup/restore tests. It does not authorize public exposure or production activation.

## Work performed in this cycle

- Refreshed both repository defaults, current integration branch head, all open PR heads, branch ancestry, review threads, and exact-head Actions runs.
- Inspected job-level CI results and failure logs for PRs #4, #5 and #12. Confirmed the common CMake 4.5 warning-policy failure rather than guessing at a source-code defect.
- Reviewed the complete PR #23 diff across `.github/ci-test-each-commit-exec.py`, `.github/ci-windows.py`, `.github/workflows/ci.yml` and `ci/test/03_test_script.sh`.
- Triggered retries for cancelled jobs on PRs #10, #21, #22, #23 and #24. Those retries are still queued or awaiting the remaining cancelled jobs; no pass is inferred.
- No source code was changed and no PR was merged in this cycle. The PR #23 compatibility fix was already present on its feature branch; its exact-head matrix remains incomplete.

## Safety and next actions

- Preserve fail-closed normal FREELY startup.
- Do not activate the candidate genesis nonce/hash, deploy DNS seeds, launch a public testnet/mainnet, deploy mining, pay for infrastructure, or expose a public network.
- First complete PR #23's 29-job CI; if it passes, merge that independent CI-only fix and rerun PRs #4, #5, #12 and dependent branches on current bases.
- Reconcile PR #6's 25-commit divergence and overlapping CI changes before any merge.
- Re-run PR #8's ancestor job with the corrected CI workflow; then proceed in dependency order through PR #17, PR #22 and PR #24 only after exact-head full CI and review gates are satisfied.
- Continue to treat all queued, pending, skipped, cancelled or infrastructure-failed jobs as non-passes.


## Security review addendum — 25 November 2026

A deeper review of PR #24's network-isolation guards found a default-value mismatch: Bitcoin Core v32.1 defines `DEFAULT_NATPMP = true` in `src/mapport.h`, while the FREELY startup guard queried `-natpmp` with a false fallback. The loopback-private mode could therefore miss the default-on PCP/NAT-PMP port-mapping setting when the operator omitted the option. The offline mode is now equally explicit and requires `-natpmp=0` rather than relying on later argument interactions.

- Corrected both startup guards on PR #24 branch `freely/private-node-integration-20261124` using `DEFAULT_NATPMP` directly and including `mapport.h`.
- Source commit: `ebc45da690c463f1b1253eba055782d23ffbc334`.
- Added a unit regression test proving both offline and loopback-private startup reject the default-on setting; updated the other FREELY unit-test fixtures to explicitly disable NAT-PMP so they continue to exercise their intended guard conditions.
- Test commit and new PR #24 exact head: `c7c2196c2924a7f074d81bcbf22b08bad99a3bfd`.
- New exact-head focused security workflow `45623537420` and offline-wallet workflow `45623537473` are in progress; full CI `45623537314` is pending. No compile/test pass is claimed for this new head.
- PR #21's older branch still contains the pre-fix fallback and is explicitly marked superseded; PR #24 is the corrected replacement. No merge was performed.

The weighted project estimate remains 68.35% until the new exact-head validation evidence is available. All production activation, public network exposure and deployment restrictions remain unchanged.
