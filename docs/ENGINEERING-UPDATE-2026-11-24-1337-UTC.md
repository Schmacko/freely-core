# FREELY engineering update — 24 November 2026, 13:37 UTC

## Repository state

- `Schmacko/freely-core`: default branch `main`, head `710c05b84f7551d00b1316eedb6d11ca077e7f1f`.
- `Schmacko/freely-bitcoin-core.`: default branch `master`, head `498b598cf27317b7306a859ce82b0571a0f9e348`.
- Pinned v32.1 integration branch `freely/upstream-v32.1`: `0f27415ebe114f3e93157a4b3c95e7670012dee1`.
- Core-repository PR #1 merged into `main` at `ab5b591979c30545d29f19e35de1ee8dabf64d94`.
- Bitcoin-fork PR #1 merged into `freely/upstream-v32.1` at `0f27415ebe114f3e93157a4b3c95e7670012dee1`; it did not merge into the fork's default `master`.
- Bitcoin-fork PRs #2, #3, #7, #9, #13–#16, #19 and #20 are closed unmerged. PR #20's candidate branch remains the parent of PR #21, which is a merge dependency blocker.

## Active work branches and estimates

| Repository / PR | Branch | Exact head | Estimate | PR state |
|---|---|---|---:|---|
| freely-core #2 | `m1-consensus-design` | `cd6350e1caf9e0a4586452f4650036d1e06ee62f` | 85% | Open draft |
| bitcoin-core #4 | `freely/pow-difficulty-audit` | `92d0c7957fd054c74a195de2ba8133cabd696a18` | 90% | Open draft |
| bitcoin-core #5 | `freely/retarget-policy` | `3d5006d411ed2781985d00506c3e1a3c36675962` | 95% | Open draft |
| bitcoin-core #6 | `freely/retarget-test-vectors` | `5cbca965a9340f85631804a5fa5c827a3b79b015` | 90% | Open draft |
| bitcoin-core #8 | `freely/core-chain-implementation` | `370d4a436b7218e77de25dc296d14e01b38de589` | 75% | Open draft |
| bitcoin-core #10 | `freely/network-safety-preflight` | `77106e215d5a04c4e6529650e3f8cbcb6a066e17` | 75% | Open draft |
| bitcoin-core #11 | `freely/wallet-node-readiness` | `86aeb0676c3bfd81fb896177cf3baedf0a558cad` | 70% | Open draft |
| bitcoin-core #12 | `freely/reconciled-docs` | `9d772339ab85fc38e2d67c591999c57aee11babd` | 95% | Open draft |
| bitcoin-core #17 | `freely/genesis-and-network-code` | `8a567e0f11a3405d62f52b4b3a7c89869f1d5ec3` | 85% | Open draft |
| bitcoin-core #18 | `freely/genesis-miner-implementation` | `8e81ea9fbf9c0b079bad1d14e8383cd36a4912b5` | 95% | Open draft |
| bitcoin-core #21 | `freely/private-node-startup` | `d63c8f957117fe205916efed6f354bab2749d43a` | 90% | Open draft |
| bitcoin-core #22 | `freely/chainparams-reconciled-20261122` | `e5e56fb28dc1342622ff516a77ca9160fcf61237` | 90% | Open, ready for review |
| bitcoin-core #23 | `freely/ci-cmake-4-5-compat` | `250d6657da43967240dacec246a45159bfc6cbb3` | 90% | Open draft |

The comparable active-PR branch average is **86.5% across 13 branches**. The historical scored all-branch average remains **91.4% across 25 branches**. The fork currently contains 40 FREELY-named refs, including preserved pre-rebase/pre-squash backups; those backups are not independent active workstreams and are excluded from the 13-branch average. No denominator change is being hidden.

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

The estimate is unchanged from the 13:09 report. Additional CI evidence and documentation corrections do not justify increasing implementation completion or production readiness.

## Exact-head CI and verified progress

- **PR #6 — retarget vectors:** focused retarget [45034083151](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45034083151) and M1 [45034083189](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45034083189) passed. Full CI [45034083216](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45034083216) passed 29/29 jobs. However, the branch is 4 commits ahead and 25 behind the current integration base; reconstruct/rebase before merge and rerun on the resulting head.
- **PR #8 — core chain integration:** focused M1 [45028307688](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028307688) passed. Full CI [45028307701](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028307701) has 28 successes and one skipped ancestor-commit job. Under the strict project rule, that is not a full pass.
- **PR #11 — wallet/node:** focused workflow [45028317103](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028317103) passed. Full CI [45028317116](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028317116) has 28 successes and one skipped ancestor-commit job; not a full pass.
- **PR #17 — genesis/network code:** focused chain-plumbing [45028325235](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028325235) passed. Full CI [45028325268](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028325268) has 28 successes and one skipped ancestor-commit job; not a full pass.
- **PR #18 — genesis miner:** focused proof-of-work verification [45204041280](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45204041280) passed. Full CI [45204040649](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45204040649) passed 29/29 jobs. It remains dependent on PR #17 and the parent chain-selector integration.
- **PR #4 — PoW audit:** full CI [44910339764](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44910339764) failed 5/29 jobs: ancestor replay, Windows native, Windows native fuzz, macOS native and macOS native fuzz. Logs show CMake 4.5's fatal `non-target-directive` diagnostic.
- **PR #5 — retarget policy:** full CI [44910342400](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44910342400) has 23 successes, 4 failures and 2 cancellations. The four failures are Windows native/fuzz and macOS native/fuzz; the logs show the same CMake 4.5 diagnostic.
- **PR #10 — network safety:** focused preflight [45206108677](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45206108677) passed. Full CI [45206108420](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45206108420) has 26 successes, two cancelled jobs (macOS native and ancestor replay) and one queued macOS-native-fuzz job. Not a full pass.
- **PR #12 — reconciled docs:** focused consensus checks [45206228587](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45206228587) passed. Full CI [45206228485](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45206228485) has 24 successes, three failures (ancestor replay and Windows native/fuzz) and two cancelled macOS jobs. The failed configure logs show the CMake 4.5 diagnostic; the isolated correction is PR #23.
- **PR #21 — private node:** candidate-parameter workflow [45401693605](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45401693605) passed all steps, including C++ build/test and independent Python genesis-header regression. Private-node security workflow [45401693636](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45401693636) passed all steps, including C++ build/test and startup/offline/loopback functional tests. Full CI [45401693650](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45401693650) has one success, 18 jobs in progress and 6 queued; offline-wallet [45401693651](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45401693651) remains queued. No full pass.
- **PR #22 — reconciled candidate:** after the documentation correction, focused chain-plumbing [45408273169](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45408273169) is building node/CLI/wallet/unit tests. Full CI [45408273228](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45408273228) has one job in progress and 24 queued. No test pass yet.
- **PR #23 — CMake 4.5 compatibility:** full CI [45204795368](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45204795368) has 27 successes, no failures, one cancelled Alpine job and one queued macOS-native-fuzz job. Completed exact-head evidence includes successful Windows native and Windows fuzz configure/build/test, macOS native CI, and ancestor-commit replay. The full matrix is still not a pass.

## Review, conflicts and dependency checks

- Open PRs were rechecked for exact heads, review threads and mergeability. No unresolved inline review threads were returned; GitHub reports the open PRs mergeable.
- PR #6 is stale by 25 commits against the current integration base despite its 29/29 CI result.
- PR #21 remains 25 commits ahead of the closed-unmerged PR #20 branch. PR #22 is a replacement candidate based on PR #17, but comparisons show the PR #20 and PR #22 lineages diverge (4 commits ahead / 36 behind from the PR #20 ref). Do not retarget PR #21 directly; transplant/reconcile its offline and loopback changes onto the PR #22 candidate tree and revalidate.
- PR #22's branch contains the candidate parameter class but its `CreateChainParams(..., FREELY)` still throws. It does not include PR #21's offline/loopback modes.
- PR #23's CMake fix is CI-only. It keeps `-Werror=dev` and downgrades only CMake 4.5's `non-target-directive` warning. The completed Windows, macOS-native and ancestor-replay jobs validate the correction on those paths, but Alpine and macOS-native-fuzz still prevent a full pass.

## Changes made this cycle

- Updated PR #22's `docs/FREELY-CHAINPARAMS-CANDIDATE-STATUS.md` in commit `e5e56fb28dc1342622ff516a77ca9160fcf61237`. The previous text incorrectly said the owner-approved PoW/network/genesis-template/script-activation decisions were still awaiting approval, and incorrectly claimed this branch included private/offline startup modes.
- The corrected document records the owner's 18 November 2026 approval of the four design proposals and their approved values, distinguishes the still-unapproved derived genesis nonce/hash from the approved template, and accurately states that ordinary chain selection still fails closed and PR #21's modes are not yet part of PR #22.
- Inspected PR #21's full network/startup diffs, PR #22's candidate parameter class and activation behavior, and PR #23's CI changes. No additional source defect was confirmed, so no speculative C++ change was made.
- Attempted to rerun cancelled CI jobs, but GitHub rejected the request while the containing workflow run still had another job queued. No rerun was performed.

## Approved design and remaining release gate

The owner explicitly approved the four design proposals on 18 November 2026: PoW/difficulty, network identity, genesis template, and script activation matrix. This includes the specified `powLimit`, genesis `nBits`, BIP94 from genesis, message magic/ports/address encodings, genesis timestamp/coinbase-Merkle commitment, and buried script activation matrix. The derived nonce `2238688522` and resulting block hash `0000000000e43054a010a58bde94ce509904f40f697fb874eedd426755cc2f78` remain candidate-only pending explicit final genesis-identity sign-off. Approval of design parameters does not authorize production activation or launch.

No PR was merged. No production genesis activation, DNS/fixed-seed deployment, public testnet/mainnet launch, mining deployment, paid service, deployment or public network exposure was performed or authorized. FREELY remains an independent UTXO SHA-256d chain and does not inherit Bitcoin hashpower or security.
