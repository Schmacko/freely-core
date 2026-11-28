# FREELY engineering update — 28 November 2026

**Run window:** 13:33–13:49 UTC  
**Repositories:** `Schmacko/freely-core` and `Schmacko/freely-bitcoin-core.`

## Executive result

- **Weighted estimated project completion:** 68.50% (unchanged; no unverified test completion was converted into progress).
- **Verified integration:** PR #23's CMake 4.5 compatibility correction merged into the dedicated `freely/upstream-v32.1` integration branch at `40fda3525a323098e76b36a9f33a05a0b02f21e3`.
- **Implementation:** PR #26 received a second focused test commit binding FREELY's candidate parameters to the approved 600-second / 1,209,600-second / 2,016-block retarget schedule and production min-difficulty/retarget flags.
- **Validation:** PR #23 passed 29/29 full CI jobs on its exact head before merge. The merged-base push workflow is queued. PR #26's new-head CI is running, including ancestor replay; no new-head pass is claimed.
- **No public or production network activation, deployment, mining or DNS seed configuration occurred.**

## Repository baselines

| Repository | Default branch | Exact head |
|---|---|---|
| `Schmacko/freely-core` | `main` | `710c05b84f7551d00b1316eedb6d11ca077e7f1f` |
| `Schmacko/freely-bitcoin-core.` | `master` | `498b598cf27317b7306a859ce82b0571a0f9e348` |
| Integration branch | `freely/upstream-v32.1` | `40fda3525a323098e76b36a9f33a05a0b02f21e3` |

The implementation repository has 46 branches: 45 FREELY-prefixed refs plus `master`. Nineteen retained/snapshot feature refs are not scored. The active PR list below contains the 14 current scored PR branches; superseded PR #24 and merged PR #23 are excluded from that active denominator.

## Completed engineering work

### PR #23 — CMake 4.5 compatibility fix merged

PR #23 was reviewed as a four-file CI-only change:
- `.github/ci-test-each-commit-exec.py`
- `.github/ci-windows.py`
- `.github/workflows/ci.yml`
- `ci/test/03_test_script.sh`

The change detects CMake 4.5 or later and adds only `-Wno-error=non-target-directive` after the existing `-Werror=dev`; all other developer diagnostics remain fatal. The ancestor-replay workflow now copies the PR-head helper to `RUNNER_TEMP` so replayed commits use the corrected helper even before the helper's own commit is replayed.

Exact-head evidence:
- PR head: `250d6657da43967240dacec246a45159bfc6cbb3`
- Full CI run [45204795368](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45204795368): 29/29 jobs successful.
- Windows native log confirmed CMake 4.5.0 and the exact flags `-Werror=dev -Wno-error=non-target-directive`.
- Ancestor replay compiled the source and passed 378/378 CTest tests; the functional-test runner also completed successfully.
- No review threads or submitted reviews were present; compare against the base was 4 commits ahead, 0 behind.

The draft was marked ready and squash-merged into `freely/upstream-v32.1`. **Merge commit:** `40fda3525a323098e76b36a9f33a05a0b02f21e3`.

The push-triggered CI for the merged base is [46150997814](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/46150997814), currently queued. The PR's 29/29 pass is not being misrepresented as a pass on the new merge commit.

### PR #26 — bind issuance and retarget tests to candidate parameters

New commit:
- `a3a3042b2bbe7d33ff6f67004175dbe9a75f171b`
- Message: `test: assert FREELY approved retarget schedule`

The existing monetary-policy unit test now also asserts against `CChainParams::FreelyCandidate()`:
- target spacing = 600 seconds;
- target timespan = 1,209,600 seconds;
- derived difficulty interval = 2,016;
- minimum-difficulty blocks disabled;
- no-retargeting disabled.

This is test coverage only. It does not choose or change `powLimit`, genesis, initial difficulty, BIP94, activation heights, network identity or production startup policy.

The branch is 2 commits ahead and 0 behind PR #25's base. Full CI [46150590448](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/46150590448) has started; the ancestor-replay job is running. At 13:51 UTC, 20 jobs were in progress, 5 queued and 2 successful; no failures had been reported. The successful jobs were lint and frozen-commit metadata only, not C++ compilation or tests. No new-head C++ test pass is claimed.

The previous one-commit head `cd86bc6144afb651e37fb36affe1524f040840a0` had 26 successful jobs, two cancelled jobs (MSan/fuzz and Alpine/musl), and ancestor replay skipped by the upstream one-commit condition. The second commit makes ancestor replay eligible on the new head.

### PR #25 — private-node integration retry

- Exact head: `e46167bc48b2037fe8e368e7c64ce2ec5bdbb830`.
- Focused private-node security run [45832040167](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45832040167): success.
- Focused offline-wallet run [45832039994](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45832039994): success.
- Full CI's ancestor replay and other jobs passed; MSan/fuzz was cancelled.
- The cancelled MSan/fuzz job was successfully re-queued as attempt 4; job `140996365407` is queued. It is not yet a pass.

### PR #22 — reconciled chain parameters

Full CI [45413263894](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45413263894) now has all 29 jobs successful on exact head `87e494b444889ae5aacd6b35fdd2313ed115115e`. Focused core-chain plumbing [45413263918](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45413263918) also passed. PR #22 remains stacked on PR #17 and is not independently mergeable before its dependency is integrated and revalidated.

## Reconciled PRs #4 and #5

After PR #23 merged, PR #4 and #5 were synchronized onto the new integration base without changing their one-file documentation payloads. Each branch now has the new base as first parent and preserves the original branch as second parent.

| PR | New head | Sync merge commit | Current diff vs base | CI |
|---|---|---|---|---|
| #4 | `8576438636fd79749a7048c55430d485e9a192d7` | `8576438636fd79749a7048c55430d485e9a192d7` | 5 ahead, 0 behind; PoW audit doc only | [46151185805](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/46151185805) queued |
| #5 | `eaa64a77dd28cf4366a057acf6753f66d0406fd1` | `eaa64a77dd28cf4366a057acf6753f66d0406fd1` | 6 ahead, 0 behind; retarget policy doc only | [46151193651](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/46151193651) queued |

The previous failed CMake 4.5 runs are historical. Neither new head is considered validated until its own full matrix completes.

## Other PR state and exact-head CI evidence

| PR | Branch | Exact head | Estimate | Current assessment |
|---:|---|---|---:|---|
| #2 | `m1-consensus-design` | `ef71a0c716c01be112cb8d1cbb7abec052815d49` | 85% | Open draft, coordination/docs |
| #4 | `freely/pow-difficulty-audit` | `8576438636fd79749a7048c55430d485e9a192d7` | 90% | Fresh full CI queued |
| #5 | `freely/retarget-policy` | `eaa64a77dd28cf4366a057acf6753f66d0406fd1` | 95% | Fresh full CI queued |
| #6 | `freely/retarget-test-vectors` | `5cbca965a9340f85631804a5fa5c827a3b79b015` | 90% | Historical 29/29 pass; now 26 commits behind updated base; CI/helper overlap |
| #8 | `freely/core-chain-implementation` | `370d4a436b7218e77de25dc296d14e01b38de589` | 75% | Historical overall CI success with ancestor replay skipped; now 1 behind updated base |
| #10 | `freely/network-safety-preflight` | `77106e215d5a04c4e6529650e3f8cbcb6a066e17` | 75% | Focused pass; full CI had 3 cancelled jobs; now 1 behind updated base |
| #11 | `freely/wallet-node-readiness` | `86aeb0676c3bfd81fb896177cf3baedf0a558cad` | 70% | Focused pass; full CI success with ancestor replay skipped |
| #12 | `freely/reconciled-docs` | `9d772339ab85fc38e2d67c591999c57aee11babd` | 95% | Previous full CI failed; now 1 behind updated base and needs reconciliation |
| #17 | `freely/genesis-and-network-code` | `8a567e0f11a3405d62f52b4b3a7c89869f1d5ec3` | 85% | Focused pass; full CI success with ancestor replay skipped |
| #18 | `freely/genesis-miner-implementation` | `8e81ea9fbf9c0b079bad1d14e8383cd36a4912b5` | 95% | Full CI 29/29 pass; depends on #17 |
| #21 | `freely/private-node-startup` | `8423e716103ca6e64373f97e4763e8c62f447d71` | 89% | Older alternative; full CI incomplete |
| #22 | `freely/chainparams-reconciled-20261122` | `87e494b444889ae5aacd6b35fdd2313ed115115e` | 92% | Full CI 29/29 pass; depends on #17 |
| #25 | `freely/private-node-integration-squashed-20261126` | `e46167bc48b2037fe8e368e7c64ce2ec5bdbb830` | 85% | Focused security/wallet passes; MSan/fuzz retry queued |
| #26 | `freely/issuance-consensus-binding-20261126` | `a3a3042b2bbe7d33ff6f67004175dbe9a75f171b` | 85% | Full CI and ancestor replay running |

PR #23 is merged and is no longer an active PR branch. PR #24 remains open only for audit traceability and is superseded by PR #25.

## Dependency and integration blockers

- Main integration path remains #8 → #17 → #22 → #25 → #26; PR #11 depends on #8 and PR #18 depends on #17.
- PRs #6, #8, #10 and #12 require explicit rebase/reconciliation against the updated integration base. Their prior CI does not validate the new base.
- PR #4 and #5 are now synchronized and have fresh CI queued.
- PR #25's MSan/fuzz retry and PR #26's new full CI remain pending.
- No unresolved inline review threads were returned for PRs #2, #4, #5, #6, #23, #25 or #26. No merge is attempted for the remaining PRs while checks, conflicts or dependencies remain unresolved.

## Completion metrics

The phase estimates are unchanged because the new PR #26 assertions have not yet passed and PR #23's merge is CI infrastructure rather than a new production feature.

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
| **Weighted overall** | **68.50%** | **100%** |

- Active PR branch mean: **86.1% across 14 branches**. The previous baseline was 86.7% across 15; denominator decreased by one because PR #23 merged (and its 95% active-branch estimate is no longer included).
- All scored feature-branch mean: **91.4% across 26 branches**. The previous baseline was 91.2% across 26; the merged PR #23 branch remains in the historical scored set and its score was advanced from 95% to 100%. Nineteen of 45 FREELY refs remain unscored.
- The weighted project estimate is separate from build/test pass status, merge state and production readiness.

## Safety and merge decision

Only PR #23 was merged, into the dedicated integration branch `freely/upstream-v32.1`, with merge commit `40fda3525a323098e76b36a9f33a05a0b02f21e3`. No PR was merged into default `master` or `main`.

FREELY's normal chain selection remains fail-closed. Candidate parameters remain offline-validation-only. No production genesis activation, public testnet/mainnet launch, DNS seeds, public mining, paid infrastructure, deployment or public network exposure occurred.
