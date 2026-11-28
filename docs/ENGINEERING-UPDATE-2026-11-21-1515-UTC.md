# FREELY engineering update — 21 November 2026, 15:15 UTC

## Scope and evidence
This update records a live GitHub inspection and one verified workflow correction. It is not a production-readiness declaration. Repository defaults, PR metadata, current heads, selected workflow jobs, review threads, commit comparisons and changed-file patches were inspected.

## Repository defaults
- `Schmacko/freely-core`: default branch `main`, current head `710c05b84f7551d00b1316eedb6d11ca077e7f1f`.
- `Schmacko/freely-bitcoin-core.`: default branch `master`, current head `498b598cf27317b7306a859ce82b0571a0f9e348`. The repository name includes a trailing period.
- Bitcoin Core v32.1 source baseline remains `freely/upstream-v32.1`; the previous coordination snapshot identifies its current integration head as `0f27415ebe114f3e93157a4b3c95e7670012dee1`.

## Pull requests and active branches

| PR | Branch | Exact head SHA | State | Estimated branch completion |
|---|---|---|---|---:|
| freely-core #2 | `m1-consensus-design` | `4b25919b7f32b0bb2816f740ddd5928cea37b66d` | Open, draft | 85% |
| bitcoin-core #4 | `freely/pow-difficulty-audit` | `92d0c7957fd054c74a195de2ba8133cabd696a18` | Open, draft | 90% |
| bitcoin-core #5 | `freely/retarget-policy` | `3d5006d411ed2781985d00506c3e1a3c36675962` | Open, draft | 95% |
| bitcoin-core #6 | `freely/retarget-test-vectors` | `eaa7e5bb92bdbac0f349fcbb4b6e88b0766e2cd4` | Open, draft | 90% |
| bitcoin-core #8 | `freely/core-chain-implementation` | `a0f92c088c130d56a9484ec05a0c4d7b7ed53c14` | Open, draft | 75% |
| bitcoin-core #10 | `freely/network-safety-preflight` | `3342d85ec401900122449100e04e3785f3b94195` | Open, draft | 75% |
| bitcoin-core #11 | `freely/wallet-node-readiness` | `0c26cf9c038b8b4e2d8aa196a2517aa270855f99` | Open, draft | 70% |
| bitcoin-core #12 | `freely/reconciled-docs` | `4ffe5b79406b26e2751b0fea865a52153b17eddf` | Open, draft | 95% |
| bitcoin-core #17 | `freely/genesis-and-network-code` | `c237f42435ce24360586228aa702f62905b14c9f` | Open, draft | 85% |
| bitcoin-core #18 | `freely/genesis-miner-implementation` | `865026e755239bf0a89e7a5b91513f896bb9858a` | Open, draft | 95% |
| bitcoin-core #20 | `freely/chainparams-candidate-integration` | `fb8f9efa5e817e5bafd635139e5386240ea05b67` | Open, draft | 87% |
| bitcoin-core #21 | `freely/private-node-startup` | `bc82815d49c45cdea9a0fd76fde9bdbce8b88e55` | Open, draft | 89% |

PR #1 (`freely/m1-consensus`, head `06d79002573506f9311abf35ae1d70c891f0a358`) is now closed with GitHub reporting `merged=false`. Do not describe the PR itself as merged. Its code is an ancestor of the current `freely/upstream-v32.1` integration branch head `0f27415ebe114f3e93157a4b3c95e7670012dee1`; that branch is one commit ahead of the PR head. The PR closure and the integration-branch history are distinct facts.

The 12 open-PR branches above have an estimated average of **85.9% (12 branches)**. The prior retained-feature inventory contains **25 branches**, with an all-feature average of **91.4% (25 branches)**. These are task-scope estimates, not build, test, review, merge or release scores. The retained-feature inventory includes closed/unmerged historical branches; it is not a claim that those branches are integrated. The denominators are retained from the prior 21 November inventory; this run did not re-fetch every historical closed branch head, so only the 12 open PR heads are individually refreshed here.

## Verified current-head CI evidence

| PR | Exact head | Focused workflow | Result | Full CI |
|---|---|---|---|---|
| #8 | `a0f92c088c130d56a9484ec05a0c4d7b7ed53c14` | [44909002120](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44909002120) | Passed; test_bitcoin compiled; validation/PoW CTest 2/2 | [44909002234](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44909002234) queued |
| #17 | `c237f42435ce24360586228aa702f62905b14c9f` | [44909033940](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44909033940) | Passed; chain-type/genesis/validation/PoW CTest 4/4; nonce helper 11/11; fail-closed startup functional test passed | [44909033959](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44909033959) queued |
| #18 | `865026e755239bf0a89e7a5b91513f896bb9858a` | [44910736974](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44910736974) | Passed; standalone miner build, SHA256d serialization, argument rejection and exact approved header verification | [44910736929](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44910736929) queued |
| #20 | `fb8f9efa5e817e5bafd635139e5386240ea05b67` | [44911934468](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44911934468) | Passed; candidate C++ suites, independent Python genesis header and fail-closed startup steps | [44911934466](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44911934466) queued |
| #6 | `eaa7e5bb92bdbac0f349fcbb4b6e88b0766e2cd4` | [44914769132](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44914769132), [44914769163](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44914769163) | Retarget queued; M1 workflow pending | [44914769198](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44914769198) queued |
| #10 | `3342d85ec401900122449100e04e3785f3b94195` | [44915292276](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44915292276) | Queued | [44915292270](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44915292270) pending |
| #11 | `0c26cf9c038b8b4e2d8aa196a2517aa270855f99` | [44914494812](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44914494812) | Wallet/node pending | [44914495083](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44914495083) pending |
| #12 | `4ffe5b79406b26e2751b0fea865a52153b17eddf` | [44914338996](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44914338996) | Queued | [44914339004](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44914339004) queued |
| #4 | `92d0c7957fd054c74a195de2ba8133cabd696a18` | No dedicated run returned | Not verified | [44910339764](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44910339764) queued |
| #5 | `3d5006d411ed2781985d00506c3e1a3c36675962` | No dedicated run returned | Not verified | [44910342400](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44910342400) queued |
| #21 | `bc82815d49c45cdea9a0fd76fde9bdbce8b88e55` | No run/status returned after the latest workflow fix | Not verified | No current-head full CI result returned |

Core coordination PR #2 has no Actions run returned for its latest documentation branch head. A previous successful run on a different SHA is not reused as current-head evidence.

For PR #8/#17/#18/#20, the focused jobs were inspected at job/step level and completed successfully. All four inherited full CI workflows remain queued. Queued/pending is not pass.

## Code changes in this run

PR #21 changed file `.github/workflows/freely-private-node-security-tests.yml`. The complete file was fetched and inspected before editing. Its final multiline shell command omitted a continuation after `feature_freely_loopback_network.py`, causing `feature_bip94.py` to be interpreted as a separate shell command rather than a test-runner argument.

Fixed the command continuation. Commit:
`bc82815d49c45cdea9a0fd76fde9bdbce8b88e55`

The PR description now records the exact commit and validation limitation. The branch compares 29 commits ahead and 0 behind its current PR #20 base `fb8f9efa5e817e5bafd635139e5386240ea05b67`. No review threads were returned. GitHub reports the PR as open, draft and currently mergeable. The latest head has no commit status or returned workflow run yet; no build/test pass is claimed.

## Weighted project estimate

Using the established weights:

| Phase | Weight | Estimated work completion |
|---|---:|---:|
| Foundation | 5% | 100% |
| Consensus specification | 15% | 92% |
| Network architecture | 10% | 88% |
| Core implementation | 25% | 65% |
| Testing | 15% | 50% |
| Wallet/node readiness | 10% | 40% |
| Mining | 5% | 90% |
| Security | 10% | 70% |
| Testnet | 5% | 10% |
| Production readiness | 5% | 0% |
| **Weighted total** | **100%** | **67.35%** |

The 67.35% is a provisional estimated work-completion score, not a verified readiness percentage. No increase is assigned for the workflow-only correction. The prior baseline remains 67.35%; no milestone delta is claimed.

## Merge and launch gates
- No PR merged during this run.
- No PR is currently authorized to merge based on this run: full CI remains queued/pending, and PR #21's latest head has no CI result.
- PR #1 is closed unmerged at the PR metadata level; the M1 code exists in the integration branch history, but this does not make the closed PR a merged PR.
- Normal FREELY startup remains fail-closed outside the explicitly constrained development modes.
- No public network, DNS seeds, production genesis activation, mining deployment, paid infrastructure, public P2P/RPC exposure or deployment was performed or authorized.
- No inherited Bitcoin hashpower/security claim is made.

## Next execution priorities
1. Verify the newly fixed PR #21 security workflow is triggered on exact head `bc82815d49c45cdea9a0fd76fde9bdbce8b88e55`; inspect all job logs and fix deterministic failures.
2. Obtain full CI results for PR #8, #17, #18 and #20 before considering dependency-order integration.
3. Resolve pending/queued PR #6, #10, #11 and #12 workflows.
4. Complete exact-head full-matrix CI and review of the wallet-enabled build and offline wallet recovery.
5. Continue consensus/retarget, testnet isolation and security evidence work without selecting any unapproved parameter.
6. Preserve the explicit production activation gate until complete consensus, genesis, network identity, release, operations and independent security evidence are reviewed and explicitly authorized.
