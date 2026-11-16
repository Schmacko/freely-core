# FREELY Development Roadmap

**Status:** Active development. A milestone is complete only when its acceptance criteria are demonstrated and recorded.  
**Last updated:** 16 November 2026  
**Upstream baseline:** Bitcoin Core v32.1, commit `f0de87f040621468b956f01f526a43a010310501`.

> **Master execution plan:** See the [comprehensive FREELY Master Project Completion Checklist](MASTER-PROJECT-COMPLETION-CHECKLIST.md) for the full ordered delivery path from governance and baseline through consensus, private network, security, release and explicit public-launch gates.

## M0 — Project foundation

- [x] Create the project repository and establish the independent SHA-256d UTXO-chain goal.
- [x] Record initial monetary policy and architecture decisions.
- [x] Add project documentation, build notes, security model and implementation roadmap.
- [x] Select and pin Bitcoin Core v32.1.
- [x] Verify the signed upstream tag in the GitHub Actions baseline workflow.

**Exit criteria:** Met for project foundation and source pinning.

## M1 — Upstream baseline

- [x] Verify the selected Bitcoin Core tag signature using the configured maintainer key fingerprint.
- [x] Pin the exact upstream commit: `f0de87f040621468b956f01f526a43a010310501`.
- [x] Configure a clean Ubuntu 24.04 GitHub Actions build environment.
- [x] Build unchanged upstream `bitcoind` and `bitcoin-cli` successfully.
- [ ] Run and record the complete relevant upstream test suite.

**Verified result:** The unchanged Bitcoin Core v32.1 baseline build passed in GitHub Actions. This is an upstream baseline build, not a FREELY runtime build.

**Exit criteria:** Baseline compilation is met; full upstream test-suite evidence remains outstanding.

## M1A — FREELY monetary-policy regression scaffolding

- [x] Add explicit-parameter C++ subsidy tests for the 50 FLY / 210,000-block halving schedule.
- [x] Check selected halving boundaries, the final one-base-unit reward and the transition to zero.
- [x] Check cumulative scheduled issuance equals 2,099,999,997,690,000 base units (20,999,999.9769 FLY).
- [x] Replace implicit test-chain classification with an explicit flag for existing Bitcoin networks.
- [x] Add regression coverage for MAIN, TESTNET, TESTNET4, SIGNET and REGTEST classification.
- [x] Build `test_bitcoin` and run the `validation_tests` CTest suite successfully.

**Verified result:** [FREELY M1 consensus test run #6 passed](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/43662943218), commit `cd00a88a3bd60ee1831e3877518390643864846b`.

**Scope limitation:** This is C++ regression-test and CI scaffolding. It does not yet implement a FREELY chain type or change runtime monetary consensus parameters.

## M2 — FREELY chain identity and selection

- [x] Document the required chain-selection integration points in the pinned source.
- [x] Prepare a provisional network-parameter sheet with clearly marked candidate values.
- [ ] Review and finalize the network identity values before activation.
- [ ] Add a dedicated `ChainType::FREELY` and string parsing/formatting.
- [ ] Add unique data-directory and RPC-port selection.
- [ ] Add a dedicated FREELY chain-parameter object.
- [ ] Add unique P2P magic and address/key prefixes.
- [ ] Generate and independently verify a genesis block.
- [ ] Add chain-identity, genesis and cross-network isolation tests.

**Current design references:**
- [Network architecture plan](https://github.com/Schmacko/freely-bitcoin-core./blob/freely/network-architecture/docs/FREELY-NETWORK-ARCHITECTURE.md)
- [Provisional network parameter sheet](https://github.com/Schmacko/freely-bitcoin-core./blob/freely/network-architecture/docs/FREELY-NETWORK-PARAMETERS-DRAFT.md)

**Exit criteria:** FREELY nodes identify only the intended FREELY network and cannot accidentally join a Bitcoin network.

## M3 — FREELY consensus implementation

- [x] Agree the monetary policy: 50 FLY initial subsidy, 210,000-block halvings, 8 decimals, 21m FLY hard ceiling.
- [x] Verify the scheduled issuance arithmetic independently and with regression assertions.
- [ ] Apply the monetary parameters to the actual FREELY chain-parameter object.
- [ ] Specify and implement the production proof-of-work limit and initial difficulty.
- [ ] Specify retarget clamping, timestamp rules and minimum-difficulty policy.
- [ ] Audit activation heights, versionbits, buried deployments, checkpoints, assume-valid and minimum-chainwork.
- [ ] Add consensus edge-case and invalid-block tests.

**Exit criteria:** The actual FREELY chain-parameter object and independent tests demonstrate the intended consensus behaviour.

## M4 — Private development network

- [ ] Run at least three independently configured local nodes.
- [ ] Mine blocks and verify propagation.
- [ ] Send and confirm transactions.
- [ ] Test restarts, synchronization, reorganizations and invalid-block rejection.
- [ ] Verify network isolation and wallet/address interoperability.

**Exit criteria:** Repeatable private-network test report. No public peers or public launch are implied.

## M5 — Public testnet decision gate

- [ ] Complete code review and testnet readiness review.
- [ ] Obtain explicit project-owner approval for a public testnet.
- [ ] Only then publish testnet binaries and operating instructions.
- [ ] Recruit independent node operators and monitor network health.

**Exit criteria:** Public testnet operates with independent participants and documented limitations, if separately approved.

## M6 — Mainnet decision gate

- [ ] Independent security audit/review.
- [ ] Reproducible release and signing process.
- [ ] Independent infrastructure and seed operators.
- [ ] Wallet/key-management and incident-response documentation.
- [ ] Legal and operational review appropriate to intended distribution and use.
- [ ] Explicit approval from the project owner.

**No public testnet, mining deployment or mainnet launch is authorised by this roadmap.**
