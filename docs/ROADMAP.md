# FREELY Development Roadmap

**Status:** Draft. A milestone is complete only when its acceptance criteria are demonstrated and recorded.

## M0 — Project foundation

- [x] Create repository.
- [x] Establish initial monetary and architecture proposal.
- [ ] Add project documentation and environment checks.
- [ ] Record upstream source tag, verified signature and exact commit.

**Exit criteria:** Documentation is committed; repository status and development environment are understood.

## M1 — Upstream baseline

- [ ] Verify the selected Bitcoin Core tag signature using trusted keys.
- [ ] Pin the exact upstream commit.
- [ ] Configure a clean build environment.
- [ ] Build upstream unchanged.
- [ ] Run the upstream test suite and record results.

**Exit criteria:** A clean, documented upstream build and test run.

## M2 — FREELY chain identity

- [ ] Define unique network magic, ports and address prefixes.
- [ ] Define independent genesis block and verify its hash.
- [ ] Separate mainnet, testnet and regtest parameters.
- [ ] Add identity and cross-network isolation tests.

**Exit criteria:** FREELY nodes identify only the intended FREELY network.

## M3 — Monetary and consensus implementation

- [ ] Implement the agreed FLY subsidy schedule.
- [ ] Verify all halving boundaries and cumulative issuance.
- [ ] Verify proof-of-work limit and difficulty rules.
- [ ] Add regression tests for consensus edge cases.

**Exit criteria:** Independent tests demonstrate the intended consensus behaviour.

## M4 — Private development network

- [ ] Run at least three independently configured nodes.
- [ ] Mine blocks and verify propagation.
- [ ] Send and confirm transactions.
- [ ] Test restarts, synchronization, reorganization and invalid-block rejection.

**Exit criteria:** Repeatable private-network test report.

## M5 — Public testnet

- [ ] Complete code review and testnet readiness review.
- [ ] Publish testnet binaries and operating instructions.
- [ ] Recruit independent node operators.
- [ ] Monitor block production, hash rate, forks and network health.

**Exit criteria:** Public testnet operates with independent participants and documented limitations.

## M6 — Mainnet decision gate

- [ ] Independent security audit/review.
- [ ] Reproducible release process.
- [ ] Independent infrastructure and seed operators.
- [ ] Wallet/key-management and incident-response documentation.
- [ ] Explicit approval from the project owner.

**No mainnet launch is authorised by this roadmap.**
