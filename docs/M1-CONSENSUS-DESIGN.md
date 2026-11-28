# M1 — Consensus and Network Design

**Status:** Draft for review. This document is not an activation of FREELY consensus rules.

## 1. Scope and safety boundary

M1 establishes a reviewable design for FREELY's chain parameters before consensus code is changed. It does not create a genesis block, launch a network, start mining, or authorize a mainnet. The upstream Bitcoin Core v32.1 baseline build must complete successfully before source integration begins.

The implementation must be isolated from upstream and preserve upstream license notices. Every consensus change must have focused tests and a documented rationale.

## 2. Proposed monetary consensus rules

| Rule | Proposed value |
|---|---:|
| Currency | FLY |
| Base units per FLY | 100,000,000 |
| Initial subsidy | 5,000,000,000 base units (50 FLY) |
| Halving interval | 210,000 blocks |
| Maximum money range | 2,100,000,000,000,000 base units (21,000,000 FLY) |
| Premine / founder allocation | None |

Subsidy at height h is defined using integer arithmetic:

    if (height < 0 || height / 210000 >= 64) return 0;
    return (50 * COIN) >> (height / 210000);

The implementation must use checked money types and range validation. This formula is illustrative; it must be reconciled with the exact upstream function signature, integer types, overflow checks, and height handling before being committed.

Expected subsidy boundaries:
- Height 0: 50 FLY.
- Height 209,999: 50 FLY.
- Height 210,000: 25 FLY.
- Height 420,000: 12.5 FLY.
- Height 630,000: 6.25 FLY.
- Height 1,260,000: 0.78125 FLY.

Cumulative issuance under integer right-shift halving is 2,099,999,997,690,000 base units (20,999,999.9769 FLY). This is below the 21,000,000 FLY ceiling. Consensus validation must separately enforce the money range and coinbase reward (subsidy plus fees).

## 3. Proof of Work and difficulty

Proposed parameters:
- Hash: SHA-256d, inherited from Bitcoin's existing proof-of-work implementation unless source review identifies a required change.
- Target spacing: 600 seconds.
- Retarget interval: 2,016 blocks.
- Initial proof-of-work limit: TBD.
- Genesis nBits: TBD.
- Retarget algorithm and timestamp edge cases: exact v32.1 behaviour to be reviewed and explicitly tested before adoption.

Do not add a novel difficulty algorithm in M1. A new chain with low hashrate is vulnerable to majority hashpower attacks and rapid reorganization; document this risk prominently.

## 4. Network identity — all values remain TBD

No values are selected in this document. The following must be independently generated and checked for collision before implementation:
- Four-byte P2P message-start / network magic for main, test and regression networks.
- P2P and RPC ports.
- Base58 public-key, script and secret-key prefixes.
- Bech32 human-readable prefix.
- Default data-directory and configuration-file names.
- Genesis timestamp, output script, nonce, time, nBits and resulting block hash.
- DNS/fixed seed policy (must remain empty until independently operated nodes exist).

Bitcoin mainnet, testnet and signet identities must not be copied. Do not publish addresses or connectable seed endpoints before the network parameters and genesis block are finalized.

## 5. Genesis block procedure

Genesis construction is a deterministic engineering task, not a branding exercise. The process must:
1. Select and approve a timestamp message and coinbase output script.
2. Fix the genesis time and proof-of-work limit.
3. Search nonce / extra-nonce values until the double-SHA256 block hash meets the selected target.
4. Independently recompute the merkle root and block hash.
5. Add hard-coded expected values to tests.
6. Verify FREELY genesis and message magic are distinct from every Bitcoin network and from each other.
7. Record the exact generation procedure and output in version-controlled documentation.

No genesis values are proposed or mined by this planning document.

## 6. Required automated tests

Before consensus code is accepted:
- Subsidy at height 0, negative-height handling, every halving boundary and the final nonzero era.
- Exact cumulative issuance and money-range limits.
- Coinbase reward equals subsidy plus valid fees; overclaiming is rejected.
- Coinbase maturity and spend validation.
- Proof-of-work target limits, invalid target encodings and SHA-256d block-hash checks.
- Retarget boundary calculations, timestamp constraints and difficulty edge cases.
- Genesis hash, merkle root and network magic constants.
- Cross-network message/address separation.
- Block/transaction rejection, chain selection and reorganization cases.

Tests must include both expected-valid and expected-invalid cases. Consensus tests must run in CI and be reproducible.

## 7. Integration sequence

1. Complete and retain evidence of the signed upstream v32.1 baseline build.
2. Review exact upstream source locations and types for subsidy, chain parameters, genesis construction, and proof-of-work.
3. Add the smallest possible FREELY-specific parameter layer on a dedicated branch.
4. Implement subsidy and money-range changes first, with unit tests.
5. Implement independent chain/network parameters and genesis, with deterministic tests.
6. Run focused tests, then the full relevant test suite and build.
7. Obtain independent review of every consensus change before considering a test network.

## 8. Explicitly not authorized

This draft does not authorize:
- A public mainnet or public testnet launch.
- Mining, premine, founder rewards, token sale or exchange listing.
- DNS seeds, public peer endpoints, wallets holding real value, or user deposits.
- Changes to Bitcoin mainnet or Bitcoin consensus.
- Merging this design or unreviewed consensus code into main.

## 9. Open decisions requiring project-owner review

- Final network magic and port assignments.
- Address prefixes and Bech32 HRP.
- Genesis timestamp text and output script.
- Initial proof-of-work limit and genesis difficulty.
- Whether testnet and signet-like environments are required before mainnet.
- Whether the initial release includes wallet support or daemon/CLI only.

Until these are reviewed, all network identity fields remain unassigned.
