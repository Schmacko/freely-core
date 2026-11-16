# FREELY — 30-Day Accelerated Engineering Sprint

**Plan version:** 1.0  
**Prepared:** 16 November 2026  
**Sprint window:** 16 November–16 December 2026  
**Status:** Active; execution is conditional on evidence, dependencies and the standing owner-approval gates.  
**Source baseline:** Bitcoin Core v32.1, commit `f0de87f040621468b956f01f526a43a010310501`.  
**Coordination repository:** `Schmacko/freely-core`  
**Implementation repository:** `Schmacko/freely-bitcoin-core.`

## 1. Sprint objective

Accelerate FREELY by running independent research, specification, test-design, CI and implementation-preparation tasks in parallel. Preserve the complete approved project scope and all consensus/security requirements. The sprint does not promise a private network in 30 days; its goal is to remove avoidable blockers and produce reviewable, tested implementation increments.

## 2. Non-negotiable controls

- Preserve the agreed independent Bitcoin-style UTXO chain, native FLY currency, SHA-256d proof of work, 50 FLY initial subsidy, 210,000-block halvings, 8 decimal places, 21,000,000 FLY hard ceiling, 600-second target spacing and 2,016-block retarget interval.
- Production retarget policy already approved: Bitcoin Core v32.1 semantics, 1,209,600-second target timespan, 1/4–4x clamp, minimum difficulty disabled and no-retargeting disabled. Runtime implementation and tests remain pending.
- Do not silently choose unresolved consensus parameters. Prepare evidence and recommendations; request owner input only when the choice is genuinely required.
- Isolate concurrent work on separate branches. Do not modify a commit while its validation is pending unless a correction is necessary and isolated.
- Integrate only through small PRs with relevant tests, current-head CI and review. Merge only when all required checks are complete and satisfactory, using the owner’s standing approval.
- No public testnet, public mining deployment, mainnet, paid infrastructure, token sale, exchange listing or custody service without separate explicit approval.
- No reduction in functionality, security testing, documentation or original scope to meet the sprint window.

## 3. Parallel workstreams

### A — CI and upstream baseline
**Objective:** finish verification of the current M1 Windows checkout correction and reduce avoidable CI failures.

Tasks:
- [ ] Confirm dedicated M1 validation run #16 on head `3c48e0fc2f3433a946ed29326c3c5233f4d826a3`.
- [ ] Follow general CI run #34 to terminal status; inspect every failed job and distinguish code failures from external service/rate-limit failures.
- [ ] Retry only isolated infrastructure failures after the original run is terminal; do not rerun successful jobs unnecessarily.
- [ ] Confirm Windows native and Windows fuzz jobs compile and test on the corrected head.
- [ ] Complete relevant Linux/macOS and sanitizer coverage; record unsupported jobs explicitly.
- [ ] Run the full relevant upstream baseline test suites and record toolchain/build provenance.
- [ ] Update the CI runbook and checklist only when evidence supports completion.

**Acceptance:** exact tested SHA, terminal run links, job-level outcomes and failure classification recorded; no claim of full verification based on partial CI.

### B — Consensus specification and implementation preparation
**Objective:** convert approved monetary and retarget policies into a precise, testable implementation contract.

Tasks:
- [ ] Re-read pinned v32.1 chainparams, consensus params, retarget and validation code before editing runtime consensus.
- [ ] Produce a FREELY-specific parameter-to-source mapping for every field required by the new chain type.
- [ ] Specify retarget test vectors: non-boundary carry-forward, first boundary, normal timespan, fast/slow clamp extremes, compact-target rounding and invalid target handling.
- [ ] Specify subsidy/coinbase vectors and the genesis accounting distinction.
- [ ] Audit timestamp/MTP rules and the BIP94/time-warp decision point; prepare an evidence-based recommendation without activating it.
- [ ] Inventory buried deployments, versionbits, script rules, checkpoints, assume-valid and minimum-chainwork; propose a conservative activation matrix.
- [ ] Prepare an implementation PR design that keeps unresolved parameters explicit and cannot accidentally inherit Bitcoin mainnet consensus settings.

**Acceptance:** a reviewed implementation map and executable test contract; unresolved owner decisions remain visibly unresolved.

### C — Chain identity and genesis preparation
**Objective:** make network isolation workstream implementation-ready without inventing final identity values.

Tasks:
- [ ] Inventory all required chain identity fields and every source-code integration point.
- [ ] Research candidate selector/config name, datadir suffix, P2P/RPC ports, message-start magic, address/WIF/extended-key prefixes and Bech32 HRP.
- [ ] Collision-check candidate values against Bitcoin networks and common local services before proposing final values.
- [ ] Specify a deterministic genesis-generation tool interface and independent recomputation procedure.
- [ ] Prepare isolation test cases for datadir, RPC, P2P magic, address encodings and peer selection.
- [ ] Keep DNS seeds absent for initial private development unless a later decision requires them.

**Acceptance:** candidate matrix with collision evidence and test plan; no genesis or network identity activated before owner approval.

### D — Wallet, RPC, node and private-network readiness
**Objective:** remove downstream design uncertainty while consensus and identity decisions are being finalized.

Tasks:
- [ ] Map wallet/RPC assumptions that are chain-specific versus reusable from upstream.
- [ ] Identify coinbase maturity, fee handling, wallet amount conversion and mining RPC test requirements.
- [ ] Design a reproducible three-node private-regtest-like FREELY test harness, clearly separated from public networks.
- [ ] Specify transaction propagation, block propagation, restart, reindex, partition, reorg and double-spend test scenarios.
- [ ] Document node configuration, RPC authentication, firewall and key-handling requirements.

**Acceptance:** implementation-ready private-network test plan and list of upstream components requiring changes.

### E — Documentation, integration and project controls
**Objective:** eliminate documentation lag and make parallel work safe.

Tasks:
- [ ] Maintain a single dependency map and branch/PR register.
- [ ] Update roadmap and master checklist only with evidence-backed changes.
- [ ] Create the beginner-friendly DOCX engineering handbook with versioned changelog when file generation is available; do not claim it exists until a verified file is produced.
- [ ] Keep each PR small, independently testable and based on the pinned v32.1 baseline.
- [ ] Publish a sprint-end report with exact SHAs, CI links, checklist arithmetic, blockers and revised forecast.

**Acceptance:** documentation matches repository reality; no stale completion claims or unverified download links.

## 4. 30-day sequence

| Window | Parallel priorities | Deliverables / exit check |
|---|---|---|
| Days 1–3 (16–18 Nov) | Finish M1 CI observation; map v32.1 source paths; open separate work branches only where isolation is clear; capture unresolved decisions. | CI evidence snapshot; source map; dependency graph; sprint baseline. |
| Days 4–7 (19–22 Nov) | Retarget test-vector design; genesis/network identity inventory; wallet/RPC dependency audit; full upstream test-suite planning. | Consensus test contract v1; network identity matrix; wallet/RPC integration map. |
| Days 8–14 (23–29 Nov) | Implement only isolated, approved scaffolding/tests; build automated parameter and test-vector checks; resolve CI infrastructure issues. | One or more small reviewable PRs, each with exact tests and CI. |
| Days 15–21 (30 Nov–6 Dec) | Integrate completed audit/spec PRs when gates pass; prepare FREELY chain-parameter implementation design; review activation matrix and time rules. | Reviewed design package; merge only eligible PRs; explicit remaining decisions. |
| Days 22–27 (7–12 Dec) | Begin first runtime implementation slice only if prerequisite consensus/network values are sufficiently frozen; otherwise continue independent test harness and parameter tooling. | Tested implementation increment or documented dependency blocker; no provisional values silently activated. |
| Days 28–30 (13–16 Dec) | Regression pass, PR review, handbook/checklist update, sprint retrospective and next sprint forecast. | Sprint-end report and evidence-backed next 30-day plan. |

Dates are planning windows, not guarantees. If a dependency or CI result is delayed, the workstream continues with independent tasks and the dependent task is not falsely marked complete.

## 5. Integration and branch discipline

- Keep the current M1 head `3c48e0fc2f3433a946ed29326c3c5233f4d826a3` stable while its current validation is pending.
- Use separate feature branches for retarget implementation preparation, network identity tooling, wallet/RPC audit and test harness work.
- Avoid concurrent writes to the same file/branch. Rebase or merge only after reviewing intervening changes.
- Each PR must state: purpose, source baseline, exact consensus assumptions, files changed, tests run, CI links, known limitations and rollback/revert strategy.
- No PR is considered complete merely because it is open, draft, or locally plausible.

## 6. Owner decisions to prepare, not guess

1. Whether the genesis coinbase is unspendable and how genesis issuance is represented in spendable-supply statements.
2. Production PoW limit and genesis initial difficulty / genesis nBits.
3. BIP94/time-warp mitigation semantics.
4. Full script and soft-fork activation matrix.
5. Final network identity and collision-checked values.
6. Genesis timestamp, message and output script.

The approved retarget policy is not reopened unless new evidence identifies a material defect. Approval of this sprint does not approve any of the unresolved items above.

## 7. Measures and reporting

Report at each requested checkpoint:
- Exact current branch and SHA for each active workstream.
- PR state, review state and current-head CI state.
- Tests passed, failed, queued and not run; classify infrastructure failures separately.
- Checklist count and phase percentages calculated from actual checked items.
- Actual elapsed time separately from estimated effort.
- Dependencies, owner decisions required and next independently executable tasks.
- Any change to the 4–7 month first private-network target or 6–12 month authorised pre-release estimate, with evidence and reasons.

The 30-day sprint does not replace the 157-task master checklist; it is an acceleration overlay. The master checklist remains authoritative for total project scope.

## 8. Explicitly out of scope for this sprint

No public testnet, public mining deployment, mainnet launch, paid infrastructure, token sale, exchange listing, third-party custody, or reduction in security/release requirements.

## 9. Initial execution baseline — 16 November 2026

- M1 dedicated validation run #16: completed successfully on `3c48e0fc2f3433a946ed29326c3c5233f4d826a3`.
- M1 general CI run #34: queued at sprint setup; must be refreshed before conclusions.
- Consensus specification PR #2 and retarget policy PR #5: checks queued at sprint setup.
- Chain-selection audit PR #3 and PoW/difficulty audit PR #4: open draft PRs; no submitted reviews found at sprint setup.
- Master checklist: 25/157 (15.9%), version 1.5.
- Runtime FREELY chain type, final genesis, production PoW parameters and private multi-node network: not yet implemented.
- DOCX handbook: not yet generated.
