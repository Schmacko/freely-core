# FREELY — Master Project Completion Checklist

**Version:** 1.5  
**Created:** 16 November 2026  
**Status:** Active engineering plan  
**Pinned source baseline:** Bitcoin Core v32.1, commit `f0de87f040621468b956f01f526a43a010310501`  
**Repositories:** [Project coordination](https://github.com/Schmacko/freely-core) · [Bitcoin Core fork](https://github.com/Schmacko/freely-bitcoin-core.)

## Completion dashboard — 16 November 2026

**Planning schedule:** per-task active-effort estimates and phase/calendar ranges added in v1.5; see “Time estimates and realistic project schedule.”

**Checklist item completion: 25 / 157 = 15.9%.** This is the proportion of individually checked tasks in this document, not a claim that a working blockchain is 14.1% built. Completed planning, source-baseline and documentation tasks count; functional FREELY chain implementation has not yet begun.

| Phase | Checked / total | Checklist completion |
|---|---:|---:|
| 0. Governance and scope | 6 / 10 | 60% |
| 1. Upstream baseline and engineering environment | 3 / 11 | 27% |
| 2. Monetary policy and consensus specification | 14 / 24 | 58.3% |
| 3. Chain identity and network isolation | 2 / 17 | 12% |
| 4. Genesis and chain parameters | 0 / 12 | 0% |
| 5. Consensus implementation and validation | 0 / 13 | 0% |
| 6. Wallet, RPC, mining and operations | 0 / 10 | 0% |
| 7. Private multi-node network | 0 / 11 | 0% |
| 8. Security, economics, legal and operations readiness | 0 / 10 | 0% |
| 9. Release engineering and documentation | 0 / 10 | 0% |
| 10. Public testnet gate | 0 / 10 | 0% — intentionally not authorised |
| 11. Mainnet gate | 0 / 11 | 0% — intentionally not authorised |
| 12. Post-launch maintenance | 0 / 8 | 0% — future phase |
| **Total** | **25 / 157** | **15.9%** |

**Interpretation and controls**
- Percentages are calculated mechanically from the checked boxes in the phase lists below.
- An item is checked only when evidence exists. Draft documentation, queued CI or unmerged PRs do not count as completed runtime implementation.
- Phases 10 and 11 are approval-gated and must remain at 0% until the owner explicitly authorises those activities.
- This is a task-progress metric, not a security, quality, network-readiness or launch-readiness score.
- Phase percentages can change when tasks are added, split, removed or reclassified; preserve this counting method in future reports.

## Time estimates and realistic project schedule (version 1.5)

**Estimate basis:** Planning estimates for one experienced Bitcoin Core engineer using AI assistance, with timely owner decisions. These are not measured durations. Each checkbox below has its own estimated active effort. Estimates include ordinary engineering, documentation and local validation, but exclude extended CI queues, independent external reviews, legal advice, funding delays and prolonged network observation.

- **Active effort** is focused engineering/review time.
- **Calendar time** includes dependencies, CI turnaround, review cycles and waiting. Some phases can overlap; consensus and identity work cannot safely be rushed.
- Estimates on already checked tasks are indicative planning estimates, not claims about actual historical time.
- Public testnet and mainnet are approval-gated and excluded from the authorised base schedule.
- With €0 budget, paid audits, legal advice, infrastructure and guaranteed external review cannot be assumed; these can extend the calendar materially.

### Phase-level planning ranges

| Phase | Active effort | Calendar allowance | Notes |
|---|---:|---:|---|
| 0. Governance and scope | 9–18 h | 2–5 working days | Remaining decisions and governance |
| 1. Upstream baseline and engineering environment | 37–74 h | 1–3 weeks | Full suites, CI repairs and reproducible builds |
| 2. Monetary policy and consensus specification | 96–192 h | 4–8 weeks | Open consensus decisions and independent review |
| 3. Chain identity and network isolation | 35.5–71 h | 2–5 weeks | Requires collision checks and finalized parameters |
| 4. Genesis and chain parameters | 40–80 h | 2–5 weeks | Depends on frozen PoW, genesis and identity choices |
| 5. Consensus implementation and validation | 62–124 h | 4–9 weeks | Highest-risk code and test phase |
| 6. Wallet, RPC, mining and operations | 30–60 h | 2–5 weeks | Private-environment validation |
| 7. Private multi-node network | 54–108 h | 3–7 weeks | Adversarial scenarios and remediation |
| 8. Security, economics, legal and operations readiness | 60–120 h | 4–12+ weeks | External audit/legal review can dominate |
| 9. Release engineering and documentation | 50–100 h | 3–7 weeks | Reproducible builds and complete handbook |
| **Authorised scope, Phases 0–9** | **Approximately 474–947 h** | **Approximately 6–12 months** | Sustained part-time progress, no major redesign; includes work that can overlap but excludes long external-review delays |
| 10. Public testnet (not authorised) | 31–62 h setup, plus 2–4 h/week | **At least 8–12 weeks operation** | Only after explicit approval; repeat cycles may be needed |
| 11. Mainnet launch preparation (not authorised) | 69–138 h | **2–4+ months after testnet sign-off** | Depends on audit, legal readiness and independent operators |
| 12. Maintenance | Recurring | Ongoing | Not a finite phase |

**Realistic project outlook:** the first usable engineering milestone—a reproducible private FREELY network with at least three isolated nodes, verified genesis, block production, wallet-to-wallet transaction transfer, reorganisation/invalid-block tests and documented build steps—is a **16–28 week (4–7 month)** target from this plan. Completing all authorised pre-public-release work (Phases 0–9) is more realistically **6–12 months**. A public testnet would add at least **2–4 months** after separate approval. A mainnet, if ever approved, is more plausibly **12–24+ months from now**, not a promised date. Independent security review, legal review, external operators and funding can extend it or make it infeasible under a €0 budget.

### Critical-path assumptions
1. Current M1 CI/checkout work finishes without a major build-system redesign.
2. Owner decisions on genesis accounting, PoW limit/genesis difficulty, BIP94 and script activations are made when evidence is ready.
3. Consensus rules are not introduced without test vectors and independent review.
4. CI and external review normally return within days, not weeks.
5. Planning assumes roughly 15–25 productive hours/week. At 5–10 hours/week, expect about 12–24+ months for Phases 0–9; at 30–40 hours/week, engineering time may compress to roughly 4–8 months, but external review and test observation still impose minimum waits.
6. Public testnet/mainnet work remains gated and is not included in the authorised completion estimate.

## How to use this checklist

- A box is checked only when evidence exists (commit, test result, review or release record).
- "Prepared" means documented or coded but not yet validated.
- "Verified" means the stated acceptance test passed on the exact commit being discussed.
- A draft PR is not a completed milestone; it must pass review and be merged with owner approval.
- Consensus parameters must be frozen together. Never activate provisional values just to make the software compile.
- This plan does not authorize a public testnet, public mining, mainnet launch, paid infrastructure, token sale, exchange listing or third-party custody.

## Phase 0 — Project governance, repository and scope

- [x] Define FREELY as an independent Bitcoin-derived UTXO blockchain with native FLY coin.  `Est. effort: 0.5–1 h`
- [x] Set project budget to €0 for initial engineering.  `Est. effort: 0.5–1 h`
- [x] Establish coordination repository and Bitcoin Core fork.  `Est. effort: 0.5–1 h`
- [x] Pin Bitcoin Core v32.1 source commit.  `Est. effort: 0.5–1 h`
- [x] Record no-premine, no-founder-allocation and no-ICO policy.  `Est. effort: 0.5–1 h`
- [x] Define owner approval gates: no PR merge, public testnet or mainnet without explicit approval.  `Est. effort: 1–2 h`
- [ ] Confirm canonical project name, ticker, repository naming and public communication policy.  `Est. effort: 1–2 h`
- [ ] Add maintainers, branch protection and required-review policy appropriate to project size.  `Est. effort: 2–4 h`
- [ ] Record threat model, supported platforms, target users and initial non-goals.  `Est. effort: 2–4 h`
- [ ] Maintain a decision log for every consensus and network-identity choice.  `Est. effort: 0.5–1 h`

**Exit:** project scope, governance, source baseline and approval boundaries are recorded.

## Phase 1 — Upstream baseline and engineering environment

- [x] Verify signed upstream v32.1 tag in GitHub Actions.  `Est. effort: 4–8 h`
- [x] Pin exact upstream commit `f0de87f040621468b956f01f526a43a010310501`.  `Est. effort: 1–2 h`
- [x] Build unchanged upstream `bitcoind` and `bitcoin-cli` on Ubuntu 24.04 in CI.  `Est. effort: 2–4 h`
- [ ] Run the complete relevant upstream unit and functional test suites on the pinned baseline.  `Est. effort: 2–4 h`
- [ ] Verify the Windows checkout correction on the current M1 PR head (new CI run is pending).  `Est. effort: 2–4 h`
- [ ] Reproduce the baseline build from a clean environment and record compiler/toolchain versions.  `Est. effort: 4–8 h`
- [ ] Resolve the fork's Windows CI checkout-path issue and verify native Windows build/test jobs on the corrected head.  `Est. effort: 4–8 h`
- [ ] Verify macOS and Linux CI on the exact implementation head.  `Est. effort: 4–8 h`
- [ ] Verify sanitizers (ASan, UBSan, integer, TSan and MSan where supported) and fuzz targets.  `Est. effort: 8–16 h`
- [ ] Document build dependencies and clean-build commands for Linux, Windows and macOS.  `Est. effort: 2–4 h`
- [ ] Establish reproducible release-build and artifact-provenance procedures.  `Est. effort: 4–8 h`

**Exit:** the unmodified upstream base is reproducibly buildable and its relevant tests are green; platform CI is reliable.

## Phase 2 — FREELY monetary policy and consensus specification

- [x] Agree FLY ticker and 8 decimal places (100,000,000 base units per FLY).  `Est. effort: 0.5–1 h`
- [x] Agree initial subsidy 50 FLY.  `Est. effort: 0.5–1 h`
- [x] Agree halving interval 210,000 blocks.  `Est. effort: 0.5–1 h`
- [x] Agree 600-second target spacing and 2,016-block difficulty interval.  `Est. effort: 0.5–1 h`
- [x] Agree 21,000,000 FLY hard maximum, integer base-unit accounting, no premine.  `Est. effort: 1–2 h`
- [x] Independently calculate scheduled issuance: 20,999,999.9769 FLY.  `Est. effort: 1–2 h`
- [x] Add C++ monetary boundary regression test scaffolding using explicit consensus params.  `Est. effort: 4–8 h`
- [x] Add draft detailed consensus specification and independent arithmetic checker.  `Est. effort: 8–16 h`
- [x] Add a consensus decision register with provisional recommendations and owner-approval gates.  `Est. effort: 2–4 h`
- [x] Add a read-only GitHub Actions workflow to syntax-check and execute the independent checker.  `Est. effort: 2–4 h`
- [x] Correct the final subsidy-era boundary vector in the independent checker (height 6,719,999 pays 2 base units; height 6,720,000 pays 1).  `Est. effort: 2–4 h`
- [x] Audit the pinned upstream proof-of-work and retarget implementation; document exact algorithm behaviour and FREELY test requirements in draft PR #4.  `Est. effort: 2–4 h`
- [ ] Decide and document whether the genesis coinbase is unspendable and how its 50 FLY is reflected in spendable-supply statements.  `Est. effort: 4–8 h`
- [ ] Freeze proof-of-work limit and initial difficulty / genesis nBits.  `Est. effort: 4–8 h`
- [x] Approve and document exact production retarget policy: v32.1 semantics, 2,016-block period, 14-day timespan, ¼×–4× clamp and previous-period timestamp selection (owner approval 16 Nov 2026; implementation/tests pending).  `Est. effort: 4–8 h`
- [x] Approve minimum-difficulty disabled and no-retargeting disabled for production FREELY (owner approval 16 Nov 2026; implementation/tests pending).  `Est. effort: 4–8 h`
- [ ] Decide whether BIP94/time-warp mitigation is used and define exact semantics.  `Est. effort: 4–8 h`
- [ ] Freeze median-time-past and timestamp constraints.  `Est. effort: 8–16 h`
- [ ] Audit all consensus monetary range checks, fee paths, RPC conversion and wallet amount handling.  `Est. effort: 8–16 h`
- [ ] Define every buried deployment and script rule active at genesis or later.  `Est. effort: 8–16 h`
- [ ] Define version-bits deployments, thresholds, periods, start/timeout and activation heights.  `Est. effort: 4–8 h`
- [ ] Decide checkpoints, minimum chainwork, assume-valid and AssumeUTXO policy (initially safest to omit unsupported shortcuts).  `Est. effort: 8–16 h`
- [ ] Obtain independent review of the full consensus parameter sheet.  `Est. effort: 8–16 h`
- [ ] Add independent test vectors for every consensus boundary and invalid condition.  `Est. effort: 8–16 h`

**Exit:** one internally consistent, reviewed consensus specification exists; no unresolved consensus-critical field is silently defaulted.

## Phase 3 — Chain identity and network isolation

- [x] Audit all upstream chain-selector and parameter-factory integration points; document the safe implementation sequence.  `Est. effort: 1–2 h`
- [x] Publish the chain-selection audit as draft PR #3.  `Est. effort: 0.5–1 h`
- [ ] Finalize chain selector (candidate: `freely`) and config-section name.  `Est. effort: 2–4 h`
- [ ] Finalize unique data-directory suffix.  `Est. effort: 1–2 h`
- [ ] Collision-check and finalize 4-byte P2P message-start magic.  `Est. effort: 1–2 h`
- [ ] Allocate and verify unique P2P and RPC ports.  `Est. effort: 1–2 h`
- [ ] Finalize Base58 P2PKH, P2SH and WIF prefixes.  `Est. effort: 1–2 h`
- [ ] Finalize extended public/private key version bytes.  `Est. effort: 1–2 h`
- [ ] Finalize Bech32/Bech32m HRP.  `Est. effort: 1–2 h`
- [ ] Decide DNS seeds and fixed-seed policy (initial private development may use none).  `Est. effort: 2–4 h`
- [ ] Decide Tor port and network-specific listening defaults.  `Est. effort: 2–4 h`
- [ ] Confirm network configuration does not overlap Bitcoin mainnet/testnet/signet/regtest or common local services.  `Est. effort: 2–4 h`
- [ ] Add explicit FREELY production-chain classification; ensure test-only overrides are rejected.  `Est. effort: 4–8 h`
- [ ] Add chain selector parsing/formatting and configuration tests.  `Est. effort: 4–8 h`
- [ ] Add unique data-dir/RPC selection tests.  `Est. effort: 4–8 h`
- [ ] Add P2P magic and peer-isolation tests.  `Est. effort: 4–8 h`
- [ ] Add address, WIF, extended-key and Bech32 encode/decode tests.  `Est. effort: 4–8 h`

**Exit:** a FREELY node selects only FREELY data, addresses and peers and cannot silently join a Bitcoin network.

## Phase 4 — Genesis block construction and chain parameters

- [ ] Agree genesis timestamp and coinbase message.  `Est. effort: 2–4 h`
- [ ] Agree genesis coinbase output script and spendability treatment.  `Est. effort: 2–4 h`
- [ ] Freeze genesis version, timestamp, nBits, nonce search method and PoW limit.  `Est. effort: 4–8 h`
- [ ] Generate genesis transaction, txid, Merkle root, header hash and nonce reproducibly.  `Est. effort: 4–8 h`
- [ ] Independently recompute all genesis values using a second implementation or independent script.  `Est. effort: 2–4 h`
- [ ] Verify genesis proof of work against the frozen target.  `Est. effort: 2–4 h`
- [ ] Add exact genesis assertions and serialization regression tests.  `Est. effort: 4–8 h`
- [ ] Implement FREELY `CChainParams` object using only approved parameters.  `Est. effort: 8–16 h`
- [ ] Implement chain-type factory and base chain parameters.  `Est. effort: 4–8 h`
- [ ] Set production/test classification correctly.  `Est. effort: 2–4 h`
- [ ] Ensure no Bitcoin mainnet genesis, checkpoint, chainwork or assume-valid value is reused.  `Est. effort: 2–4 h`
- [ ] Run startup, RPC, address and datadir smoke tests.  `Est. effort: 4–8 h`

**Exit:** node starts with `-chain=freely`, creates the correct isolated data directory, and reports the independently verified FREELY genesis hash.

## Phase 5 — Consensus implementation and validation

- [ ] Wire FLY monetary rules into actual FREELY chain parameters.  `Est. effort: 4–8 h`
- [ ] Verify subsidy halving and integer issuance through the actual C++ consensus path.  `Est. effort: 4–8 h`
- [ ] Verify coinbase reward cannot exceed subsidy plus fees.  `Est. effort: 2–4 h`
- [ ] Implement approved PoW limit and difficulty adjustment parameters.  `Est. effort: 4–8 h`
- [ ] Test target decoding, negative/overflow targets and invalid proof of work.  `Est. effort: 4–8 h`
- [ ] Test every retarget boundary and clamp.  `Est. effort: 4–8 h`
- [ ] Test timestamp/median-time-past and time-warp protections.  `Est. effort: 4–8 h`
- [ ] Test minimum-difficulty policy.  `Est. effort: 4–8 h`
- [ ] Implement approved script deployment/activation schedule.  `Est. effort: 8–16 h`
- [ ] Test activation boundaries and rejection of blocks violating active rules.  `Est. effort: 4–8 h`
- [ ] Verify existing Bitcoin network behaviour remains unchanged.  `Est. effort: 4–8 h`
- [ ] Run complete C++ unit tests, functional tests, fuzzers and sanitizers.  `Est. effort: 8–16 h`
- [ ] Obtain independent consensus-code review.  `Est. effort: 8–16 h`

**Exit:** independently tested FREELY blocks and transactions are accepted/rejected according to the frozen specification, while other Bitcoin chain types remain unaffected.

## Phase 6 — Wallet, RPC, mining and node operations

- [ ] Confirm wallet creation, backup, restore and descriptor handling on FREELY.  `Est. effort: 4–8 h`
- [ ] Verify address generation, validation, signing and transaction decoding.  `Est. effort: 2–4 h`
- [ ] Verify send, receive, fee estimation and transaction broadcast.  `Est. effort: 2–4 h`
- [ ] Verify block-template RPC and mining RPC behaviour.  `Est. effort: 4–8 h`
- [ ] Decide initial miner software and supported CPU/GPU/ASIC strategy; do not assume Bitcoin hashpower.  `Est. effort: 4–8 h`
- [ ] Test coinbase construction and maturity.  `Est. effort: 2–4 h`
- [ ] Test pruning, reindex, import/export and database recovery.  `Est. effort: 4–8 h`
- [ ] Test clean shutdown, restart and crash recovery.  `Est. effort: 2–4 h`
- [ ] Document node configuration, RPC authentication, firewall and key security.  `Est. effort: 2–4 h`
- [ ] Add operational metrics, logs, alerts and backup/restore runbooks.  `Est. effort: 4–8 h`

**Exit:** an operator can safely run a node, wallet and miner in a private environment and perform normal transactions.

## Phase 7 — Private multi-node development network

- [ ] Build release-like binaries from the reviewed implementation commit.  `Est. effort: 4–8 h`
- [ ] Start at least three independent local nodes with separate data directories.  `Est. effort: 2–4 h`
- [ ] Confirm peer discovery/connection and network isolation.  `Est. effort: 4–8 h`
- [ ] Mine blocks and verify propagation and chainwork selection.  `Est. effort: 4–8 h`
- [ ] Send transactions between wallets and confirm them.  `Est. effort: 4–8 h`
- [ ] Test competing blocks, reorganizations and double-spend rejection.  `Est. effort: 8–16 h`
- [ ] Test invalid headers, invalid proof of work, invalid transactions and overpaying coinbases.  `Est. effort: 8–16 h`
- [ ] Test node restarts, sync from genesis, reindex and database recovery.  `Est. effort: 4–8 h`
- [ ] Test partitions, stale peers and reconnection.  `Est. effort: 4–8 h`
- [ ] Record block timing, difficulty behaviour and observed hashrate.  `Est. effort: 4–8 h`
- [ ] Produce a reproducible private-network test report and fix all critical/high issues.  `Est. effort: 8–16 h`

**Exit:** repeatable private-network evidence demonstrates normal operation and correct consensus under adversarial test cases.

## Phase 8 — Security, economics, legal and operational readiness

- [ ] Independent security review of consensus, P2P, wallet, RPC and build/release pipeline.  `Est. effort: 16–32 h`
- [ ] Review 51% attack, hash-rate rental, reorg, eclipse, Sybil, DoS and mining-centralisation risks.  `Est. effort: 8–16 h`
- [ ] Define safe initial difficulty and hashrate assumptions; quantify attack cost without overstating security.  `Est. effort: 4–8 h`
- [ ] Review supply, subsidy, fee and miner incentive behaviour.  `Est. effort: 4–8 h`
- [ ] Review key management, recovery and incident response.  `Est. effort: 4–8 h`
- [ ] Review privacy, logging and network metadata leakage.  `Est. effort: 4–8 h`
- [ ] Review licensing and third-party notices.  `Est. effort: 4–8 h`
- [ ] Review applicable legal/regulatory obligations in intended jurisdictions.  `Est. effort: 8–16 h`
- [ ] Prepare vulnerability disclosure and security response process.  `Est. effort: 4–8 h`
- [ ] Close or explicitly accept all audit findings.  `Est. effort: 4–8 h`

**Exit:** no unresolved critical/high security issue; residual risks and economic limitations are publicly documented.

## Phase 9 — Release engineering and documentation

- [ ] Establish versioning and release branch strategy.  `Est. effort: 2–4 h`
- [ ] Create deterministic/reproducible build process where feasible.  `Est. effort: 4–8 h`
- [ ] Define signed tags, binary hashes, signing keys and key-rotation procedure.  `Est. effort: 4–8 h`
- [ ] Produce Linux, Windows and macOS build artifacts.  `Est. effort: 8–16 h`
- [ ] Verify clean installation, upgrade and rollback.  `Est. effort: 4–8 h`
- [ ] Publish beginner-friendly node, wallet, miner and developer guides.  `Est. effort: 8–16 h`
- [ ] Publish consensus parameters, genesis details and source provenance.  `Est. effort: 4–8 h`
- [ ] Publish privacy, threat model, security policy and known limitations.  `Est. effort: 4–8 h`
- [ ] Produce a release checklist and rollback/incident plan.  `Est. effort: 4–8 h`
- [ ] Update the living DOCX implementation handbook and versioned changelog.  `Est. effort: 8–16 h`

**Exit:** a third party can independently build, verify, install and operate the exact release.

## Phase 10 — Public testnet approval gate (not authorised yet)

- [ ] Complete Phases 0–9 to the agreed testnet readiness standard.  `Est. effort: 4–8 h`
- [ ] Obtain explicit owner approval to launch a public testnet.  `Est. effort: 1–2 h`
- [ ] Provision only approved infrastructure and document its cost.  `Est. effort: 4–8 h`
- [ ] Set up independent seed/node operators and monitoring.  `Est. effort: 2–4 h`
- [ ] Publish testnet genesis, parameters, binaries and operator guide.  `Est. effort: 4–8 h`
- [ ] Recruit independent testers and miners.  `Est. effort: 2–4 h`
- [ ] Monitor chain splits, reorgs, attacks, uptime and wallet interoperability.  `Est. effort: ongoing: 2–4 h/week`
- [ ] Run a public bug-bounty or disclosure process if feasible.  `Est. effort: 8–16 h`
- [ ] Publish testnet findings and remediate issues.  `Est. effort: 4–8 h`
- [ ] Decide whether another testnet cycle is required.  `Est. effort: 2–4 h`

**Exit:** public testnet is stable enough for its stated testing purpose; this does not imply mainnet approval.

## Phase 11 — Mainnet approval and launch gate (not authorised yet)

- [ ] Complete independent security and consensus audit.  `Est. effort: 16–32 h`
- [ ] Resolve all critical/high findings.  `Est. effort: 8–16 h`
- [ ] Freeze and independently verify mainnet genesis and parameters.  `Est. effort: 8–16 h`
- [ ] Finalise signed release binaries and source tag.  `Est. effort: 4–8 h`
- [ ] Confirm independent infrastructure, seeds and node operators.  `Est. effort: 4–8 h`
- [ ] Publish full launch, mining, wallet, security and recovery documentation.  `Est. effort: 8–16 h`
- [ ] Confirm legal/operational readiness and incident-response ownership.  `Est. effort: 8–16 h`
- [ ] Obtain explicit owner approval for mainnet launch.  `Est. effort: 1–2 h`
- [ ] Launch only with a documented, monitored procedure.  `Est. effort: 4–8 h`
- [ ] Verify independent nodes agree on genesis, height, chainwork and transactions.  `Est. effort: 4–8 h`
- [ ] Publish post-launch monitoring and emergency coordination procedures.  `Est. effort: 4–8 h`

**Exit:** a functioning independent FREELY mainnet is operating under a documented governance and security process.

## Phase 12 — Post-launch maintenance and ecosystem (optional)

- [ ] Maintain security updates and upstream backports.  `Est. effort: ongoing: 2–4 h/week`
- [ ] Maintain reproducible releases and signing keys.  `Est. effort: ongoing: 1–2 h/week`
- [ ] Monitor network health, hash rate, reorgs, peer diversity and software versions.  `Est. effort: ongoing: 1–2 h/week`
- [ ] Maintain wallet compatibility and user support.  `Est. effort: ongoing: 1–2 h/week`
- [ ] Establish a transparent consensus-change proposal process.  `Est. effort: 4–8 h`
- [ ] Require review, testnet activation and explicit release process for every consensus change.  `Est. effort: 4–8 h`
- [ ] Consider explorers, payment integrations, merchants and exchanges only after separate legal, security and owner review.  `Est. effort: 4–8 h`
- [ ] Never promise price, liquidity, investment returns or security equivalent to Bitcoin.  `Est. effort: ongoing`

**Exit:** sustainable maintenance process with transparent change control.

---

## Current verified position (16 November 2026)

The production retarget/minimum-difficulty policy was explicitly approved by the owner on 16 November 2026 and documented in draft PR #5. This approval closes the policy-decision checklist items only; it does not mean FREELY retarget runtime code or tests have been implemented.

| Item | Status |
|---|---|
| Bitcoin Core v32.1 signed baseline | Verified |
| Unchanged upstream Linux build | Passed |
| M1 monetary/classification C++ regression suite | Passed on earlier commit |
| Windows checkout correction | Checkout now succeeds in both Windows jobs on current head; native build/tests still in progress |
| Dedicated M1 tests on correction commit | Pending |
| Formal consensus specification | Draft prepared |
| Network identity | Candidate values only |
| Chain-selection audit | [Draft PR #3](https://github.com/Schmacko/freely-bitcoin-core./pull/3) |
| Proof-of-work / difficulty source audit | [Draft PR #4](https://github.com/Schmacko/freely-bitcoin-core./pull/4) |
| Production retarget policy | Owner-approved 16 Nov 2026; [draft PR #5](https://github.com/Schmacko/freely-bitcoin-core./pull/5); runtime implementation/tests pending |
| Consensus specification / decision register | [Draft PR #2](https://github.com/Schmacko/freely-bitcoin-core./pull/2), head `73220edf6ad5d83dafb0998ec8cfb7fb9cbd44b2` |
| Arithmetic checker CI | [Run #4 pending](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/43787319274) |
| M1 Windows correction head | `3c48e0fc2f3433a946ed29326c3c5233f4d826a3`; [general CI #34 running](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/43782087333), [M1 tests #16 queued](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/43782087351); one unrelated no-wallet job failed due Docker Hub mirror HTTP 429 rate limiting |
| FREELY chain type / parameter object | Not implemented |
| Chain-selection source audit | Prepared; [draft PR #3](https://github.com/Schmacko/freely-bitcoin-core./pull/3) |
| FREELY genesis | Not generated |
| Full FREELY consensus runtime | Not implemented |
| Private multi-node network | Not started |
| Independent security audit | Not started |
| Public testnet/mainnet | Not authorised |

## Owner approvals required later

1. Genesis coinbase spendability and supply-accounting statement.
2. Proof-of-work limit, initial difficulty and retarget policy.
3. Script activation matrix and other consensus-critical parameters.
4. Final network identity and genesis message/output.
5. Merge of implementation PRs.
6. Public testnet launch.
7. Mainnet launch.

No approval is implied by this checklist. All reversible preparation and testing may proceed within the stated safety boundaries.


## 14. Proof-of-work and difficulty source audit

A separate documentation-only audit now maps the v32.1 PoW implementation: target derivation, 2,016-block retarget boundary, factor-of-four timespan clamp, minimum-difficulty exception, BIP94 period-start target handling, compact-target validation and PoW checks. See [FREELY PoW and difficulty audit](https://github.com/Schmacko/freely-bitcoin-core./blob/freely/pow-difficulty-audit/docs/FREELY-POW-DIFFICULTY-AUDIT.md) and [draft PR #4](https://github.com/Schmacko/freely-bitcoin-core./pull/4). This work does not choose the open FREELY PoW parameters or change runtime code.


## 15. Estimate maintenance rule

At each progress report, revise estimates only when evidence materially changes scope, complexity, dependencies or observed throughput. Record actual elapsed time separately from estimated effort. Do not treat a passing CI run as completion of a broader phase. When a critical-path delay occurs, update the calendar forecast and explain the cause rather than silently shifting dates.
