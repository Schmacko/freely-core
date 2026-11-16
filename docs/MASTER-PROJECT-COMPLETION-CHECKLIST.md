# FREELY — Master Project Completion Checklist

**Version:** 1.4  
**Created:** 16 November 2026  
**Status:** Active engineering plan  
**Pinned source baseline:** Bitcoin Core v32.1, commit `f0de87f040621468b956f01f526a43a010310501`  
**Repositories:** [Project coordination](https://github.com/Schmacko/freely-core) · [Bitcoin Core fork](https://github.com/Schmacko/freely-bitcoin-core.)

## Completion dashboard — 16 November 2026

**Checklist item completion: 23 / 157 = 14.6%.** This is the proportion of individually checked tasks in this document, not a claim that a working blockchain is 14.1% built. Completed planning, source-baseline and documentation tasks count; functional FREELY chain implementation has not yet begun.

| Phase | Checked / total | Checklist completion |
|---|---:|---:|
| 0. Governance and scope | 6 / 10 | 60% |
| 1. Upstream baseline and engineering environment | 3 / 11 | 27% |
| 2. Monetary policy and consensus specification | 12 / 24 | 50% |
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
| **Total** | **23 / 157** | **14.6%** |

**Interpretation and controls**
- Percentages are calculated mechanically from the checked boxes in the phase lists below.
- An item is checked only when evidence exists. Draft documentation, queued CI or unmerged PRs do not count as completed runtime implementation.
- Phases 10 and 11 are approval-gated and must remain at 0% until the owner explicitly authorises those activities.
- This is a task-progress metric, not a security, quality, network-readiness or launch-readiness score.
- Phase percentages can change when tasks are added, split, removed or reclassified; preserve this counting method in future reports.

## How to use this checklist

- A box is checked only when evidence exists (commit, test result, review or release record).
- "Prepared" means documented or coded but not yet validated.
- "Verified" means the stated acceptance test passed on the exact commit being discussed.
- A draft PR is not a completed milestone; it must pass review and be merged with owner approval.
- Consensus parameters must be frozen together. Never activate provisional values just to make the software compile.
- This plan does not authorize a public testnet, public mining, mainnet launch, paid infrastructure, token sale, exchange listing or third-party custody.

## Phase 0 — Project governance, repository and scope

- [x] Define FREELY as an independent Bitcoin-derived UTXO blockchain with native FLY coin.
- [x] Set project budget to €0 for initial engineering.
- [x] Establish coordination repository and Bitcoin Core fork.
- [x] Pin Bitcoin Core v32.1 source commit.
- [x] Record no-premine, no-founder-allocation and no-ICO policy.
- [x] Define owner approval gates: no PR merge, public testnet or mainnet without explicit approval.
- [ ] Confirm canonical project name, ticker, repository naming and public communication policy.
- [ ] Add maintainers, branch protection and required-review policy appropriate to project size.
- [ ] Record threat model, supported platforms, target users and initial non-goals.
- [ ] Maintain a decision log for every consensus and network-identity choice.

**Exit:** project scope, governance, source baseline and approval boundaries are recorded.

## Phase 1 — Upstream baseline and engineering environment

- [x] Verify signed upstream v32.1 tag in GitHub Actions.
- [x] Pin exact upstream commit `f0de87f040621468b956f01f526a43a010310501`.
- [x] Build unchanged upstream `bitcoind` and `bitcoin-cli` on Ubuntu 24.04 in CI.
- [ ] Run the complete relevant upstream unit and functional test suites on the pinned baseline.
- [ ] Verify the Windows checkout correction on the current M1 PR head (new CI run is pending).
- [ ] Reproduce the baseline build from a clean environment and record compiler/toolchain versions.
- [ ] Resolve the fork's Windows CI checkout-path issue and verify native Windows build/test jobs on the corrected head.
- [ ] Verify macOS and Linux CI on the exact implementation head.
- [ ] Verify sanitizers (ASan, UBSan, integer, TSan and MSan where supported) and fuzz targets.
- [ ] Document build dependencies and clean-build commands for Linux, Windows and macOS.
- [ ] Establish reproducible release-build and artifact-provenance procedures.

**Exit:** the unmodified upstream base is reproducibly buildable and its relevant tests are green; platform CI is reliable.

## Phase 2 — FREELY monetary policy and consensus specification

- [x] Agree FLY ticker and 8 decimal places (100,000,000 base units per FLY).
- [x] Agree initial subsidy 50 FLY.
- [x] Agree halving interval 210,000 blocks.
- [x] Agree 600-second target spacing and 2,016-block difficulty interval.
- [x] Agree 21,000,000 FLY hard maximum, integer base-unit accounting, no premine.
- [x] Independently calculate scheduled issuance: 20,999,999.9769 FLY.
- [x] Add C++ monetary boundary regression test scaffolding using explicit consensus params.
- [x] Add draft detailed consensus specification and independent arithmetic checker.
- [x] Add a consensus decision register with provisional recommendations and owner-approval gates.
- [x] Add a read-only GitHub Actions workflow to syntax-check and execute the independent checker.
- [x] Correct the final subsidy-era boundary vector in the independent checker (height 6,719,999 pays 2 base units; height 6,720,000 pays 1).
- [x] Audit the pinned upstream proof-of-work and retarget implementation; document exact algorithm behaviour and FREELY test requirements in draft PR #4.
- [ ] Decide and document whether the genesis coinbase is unspendable and how its 50 FLY is reflected in spendable-supply statements.
- [ ] Freeze proof-of-work limit and initial difficulty / genesis nBits.
- [ ] Freeze exact retarget algorithm, clamp bounds, integer rounding and timestamp selection.
- [ ] Decide minimum-difficulty policy (production default should be explicitly chosen, not inherited accidentally).
- [ ] Decide whether BIP94/time-warp mitigation is used and define exact semantics.
- [ ] Freeze median-time-past and timestamp constraints.
- [ ] Audit all consensus monetary range checks, fee paths, RPC conversion and wallet amount handling.
- [ ] Define every buried deployment and script rule active at genesis or later.
- [ ] Define version-bits deployments, thresholds, periods, start/timeout and activation heights.
- [ ] Decide checkpoints, minimum chainwork, assume-valid and AssumeUTXO policy (initially safest to omit unsupported shortcuts).
- [ ] Obtain independent review of the full consensus parameter sheet.
- [ ] Add independent test vectors for every consensus boundary and invalid condition.

**Exit:** one internally consistent, reviewed consensus specification exists; no unresolved consensus-critical field is silently defaulted.

## Phase 3 — Chain identity and network isolation

- [x] Audit all upstream chain-selector and parameter-factory integration points; document the safe implementation sequence.
- [x] Publish the chain-selection audit as draft PR #3.
- [ ] Finalize chain selector (candidate: `freely`) and config-section name.
- [ ] Finalize unique data-directory suffix.
- [ ] Collision-check and finalize 4-byte P2P message-start magic.
- [ ] Allocate and verify unique P2P and RPC ports.
- [ ] Finalize Base58 P2PKH, P2SH and WIF prefixes.
- [ ] Finalize extended public/private key version bytes.
- [ ] Finalize Bech32/Bech32m HRP.
- [ ] Decide DNS seeds and fixed-seed policy (initial private development may use none).
- [ ] Decide Tor port and network-specific listening defaults.
- [ ] Confirm network configuration does not overlap Bitcoin mainnet/testnet/signet/regtest or common local services.
- [ ] Add explicit FREELY production-chain classification; ensure test-only overrides are rejected.
- [ ] Add chain selector parsing/formatting and configuration tests.
- [ ] Add unique data-dir/RPC selection tests.
- [ ] Add P2P magic and peer-isolation tests.
- [ ] Add address, WIF, extended-key and Bech32 encode/decode tests.

**Exit:** a FREELY node selects only FREELY data, addresses and peers and cannot silently join a Bitcoin network.

## Phase 4 — Genesis block construction and chain parameters

- [ ] Agree genesis timestamp and coinbase message.
- [ ] Agree genesis coinbase output script and spendability treatment.
- [ ] Freeze genesis version, timestamp, nBits, nonce search method and PoW limit.
- [ ] Generate genesis transaction, txid, Merkle root, header hash and nonce reproducibly.
- [ ] Independently recompute all genesis values using a second implementation or independent script.
- [ ] Verify genesis proof of work against the frozen target.
- [ ] Add exact genesis assertions and serialization regression tests.
- [ ] Implement FREELY `CChainParams` object using only approved parameters.
- [ ] Implement chain-type factory and base chain parameters.
- [ ] Set production/test classification correctly.
- [ ] Ensure no Bitcoin mainnet genesis, checkpoint, chainwork or assume-valid value is reused.
- [ ] Run startup, RPC, address and datadir smoke tests.

**Exit:** node starts with `-chain=freely`, creates the correct isolated data directory, and reports the independently verified FREELY genesis hash.

## Phase 5 — Consensus implementation and validation

- [ ] Wire FLY monetary rules into actual FREELY chain parameters.
- [ ] Verify subsidy halving and integer issuance through the actual C++ consensus path.
- [ ] Verify coinbase reward cannot exceed subsidy plus fees.
- [ ] Implement approved PoW limit and difficulty adjustment parameters.
- [ ] Test target decoding, negative/overflow targets and invalid proof of work.
- [ ] Test every retarget boundary and clamp.
- [ ] Test timestamp/median-time-past and time-warp protections.
- [ ] Test minimum-difficulty policy.
- [ ] Implement approved script deployment/activation schedule.
- [ ] Test activation boundaries and rejection of blocks violating active rules.
- [ ] Verify existing Bitcoin network behaviour remains unchanged.
- [ ] Run complete C++ unit tests, functional tests, fuzzers and sanitizers.
- [ ] Obtain independent consensus-code review.

**Exit:** independently tested FREELY blocks and transactions are accepted/rejected according to the frozen specification, while other Bitcoin chain types remain unaffected.

## Phase 6 — Wallet, RPC, mining and node operations

- [ ] Confirm wallet creation, backup, restore and descriptor handling on FREELY.
- [ ] Verify address generation, validation, signing and transaction decoding.
- [ ] Verify send, receive, fee estimation and transaction broadcast.
- [ ] Verify block-template RPC and mining RPC behaviour.
- [ ] Decide initial miner software and supported CPU/GPU/ASIC strategy; do not assume Bitcoin hashpower.
- [ ] Test coinbase construction and maturity.
- [ ] Test pruning, reindex, import/export and database recovery.
- [ ] Test clean shutdown, restart and crash recovery.
- [ ] Document node configuration, RPC authentication, firewall and key security.
- [ ] Add operational metrics, logs, alerts and backup/restore runbooks.

**Exit:** an operator can safely run a node, wallet and miner in a private environment and perform normal transactions.

## Phase 7 — Private multi-node development network

- [ ] Build release-like binaries from the reviewed implementation commit.
- [ ] Start at least three independent local nodes with separate data directories.
- [ ] Confirm peer discovery/connection and network isolation.
- [ ] Mine blocks and verify propagation and chainwork selection.
- [ ] Send transactions between wallets and confirm them.
- [ ] Test competing blocks, reorganizations and double-spend rejection.
- [ ] Test invalid headers, invalid proof of work, invalid transactions and overpaying coinbases.
- [ ] Test node restarts, sync from genesis, reindex and database recovery.
- [ ] Test partitions, stale peers and reconnection.
- [ ] Record block timing, difficulty behaviour and observed hashrate.
- [ ] Produce a reproducible private-network test report and fix all critical/high issues.

**Exit:** repeatable private-network evidence demonstrates normal operation and correct consensus under adversarial test cases.

## Phase 8 — Security, economics, legal and operational readiness

- [ ] Independent security review of consensus, P2P, wallet, RPC and build/release pipeline.
- [ ] Review 51% attack, hash-rate rental, reorg, eclipse, Sybil, DoS and mining-centralisation risks.
- [ ] Define safe initial difficulty and hashrate assumptions; quantify attack cost without overstating security.
- [ ] Review supply, subsidy, fee and miner incentive behaviour.
- [ ] Review key management, recovery and incident response.
- [ ] Review privacy, logging and network metadata leakage.
- [ ] Review licensing and third-party notices.
- [ ] Review applicable legal/regulatory obligations in intended jurisdictions.
- [ ] Prepare vulnerability disclosure and security response process.
- [ ] Close or explicitly accept all audit findings.

**Exit:** no unresolved critical/high security issue; residual risks and economic limitations are publicly documented.

## Phase 9 — Release engineering and documentation

- [ ] Establish versioning and release branch strategy.
- [ ] Create deterministic/reproducible build process where feasible.
- [ ] Define signed tags, binary hashes, signing keys and key-rotation procedure.
- [ ] Produce Linux, Windows and macOS build artifacts.
- [ ] Verify clean installation, upgrade and rollback.
- [ ] Publish beginner-friendly node, wallet, miner and developer guides.
- [ ] Publish consensus parameters, genesis details and source provenance.
- [ ] Publish privacy, threat model, security policy and known limitations.
- [ ] Produce a release checklist and rollback/incident plan.
- [ ] Update the living DOCX implementation handbook and versioned changelog.

**Exit:** a third party can independently build, verify, install and operate the exact release.

## Phase 10 — Public testnet approval gate (not authorised yet)

- [ ] Complete Phases 0–9 to the agreed testnet readiness standard.
- [ ] Obtain explicit owner approval to launch a public testnet.
- [ ] Provision only approved infrastructure and document its cost.
- [ ] Set up independent seed/node operators and monitoring.
- [ ] Publish testnet genesis, parameters, binaries and operator guide.
- [ ] Recruit independent testers and miners.
- [ ] Monitor chain splits, reorgs, attacks, uptime and wallet interoperability.
- [ ] Run a public bug-bounty or disclosure process if feasible.
- [ ] Publish testnet findings and remediate issues.
- [ ] Decide whether another testnet cycle is required.

**Exit:** public testnet is stable enough for its stated testing purpose; this does not imply mainnet approval.

## Phase 11 — Mainnet approval and launch gate (not authorised yet)

- [ ] Complete independent security and consensus audit.
- [ ] Resolve all critical/high findings.
- [ ] Freeze and independently verify mainnet genesis and parameters.
- [ ] Finalise signed release binaries and source tag.
- [ ] Confirm independent infrastructure, seeds and node operators.
- [ ] Publish full launch, mining, wallet, security and recovery documentation.
- [ ] Confirm legal/operational readiness and incident-response ownership.
- [ ] Obtain explicit owner approval for mainnet launch.
- [ ] Launch only with a documented, monitored procedure.
- [ ] Verify independent nodes agree on genesis, height, chainwork and transactions.
- [ ] Publish post-launch monitoring and emergency coordination procedures.

**Exit:** a functioning independent FREELY mainnet is operating under a documented governance and security process.

## Phase 12 — Post-launch maintenance and ecosystem (optional)

- [ ] Maintain security updates and upstream backports.
- [ ] Maintain reproducible releases and signing keys.
- [ ] Monitor network health, hash rate, reorgs, peer diversity and software versions.
- [ ] Maintain wallet compatibility and user support.
- [ ] Establish a transparent consensus-change proposal process.
- [ ] Require review, testnet activation and explicit release process for every consensus change.
- [ ] Consider explorers, payment integrations, merchants and exchanges only after separate legal, security and owner review.
- [ ] Never promise price, liquidity, investment returns or security equivalent to Bitcoin.

**Exit:** sustainable maintenance process with transparent change control.

---

## Current verified position (16 November 2026)

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
