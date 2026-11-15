# FREELY Technical Specification

**Project:** FREELY  
**Ticker:** FLY  
**Specification:** 0.1 — draft  
**Status:** Planning; no FREELY network has been launched.

## 1. Purpose

FREELY is intended to be an independent Proof-of-Work blockchain with a native currency, FLY. The initial implementation will be derived from Bitcoin Core and retain its UTXO transaction model and established validation architecture.

FREELY is not an ERC-20 token, a Bitcoin sidechain, or a network that shares Bitcoin's consensus or mining security.

## 2. Monetary policy

| Parameter | Proposed value |
|---|---:|
| Maximum supply ceiling | 21,000,000 FLY |
| Initial block subsidy | 50 FLY |
| Halving interval | 210,000 blocks |
| Smallest unit | 0.00000001 FLY |
| Premine | None |
| Founder allocation | None |
| ICO / initial sale | None |

All consensus monetary calculations must use integer base units. Floating-point arithmetic must never be used for consensus money.

The subsidy follows Bitcoin-style integer right-shift halving. With 100,000,000 base units per FLY, the sum of all nonzero subsidy eras is 2,099,999,997,690,000 base units, or **20,999,999.9769 FLY**. Therefore 21 million FLY is a hard ceiling, not a promise that exactly 21 million will be issued.

Block subsidy is distinct from transaction fees. Fees are paid by transaction inputs and may be claimed by the block's coinbase transaction subject to consensus validation.

## 3. Proof of Work and timing

- Proof-of-Work hash: SHA-256d.
- Target block interval: 600 seconds.
- Difficulty adjustment interval: 2,016 blocks.
- Difficulty rules: Bitcoin-derived rules, subject to exact source review and dedicated FREELY tests.
- Initial proof-of-work limit and genesis difficulty: to be selected specifically for FREELY.

A low-hashrate FREELY network does not inherit Bitcoin's hashrate or security. SHA-256d alone does not make the network secure.

## 4. Ledger and node model

- UTXO ledger.
- Bitcoin-derived transaction and script validation.
- Independent chain history and genesis block.
- Independent P2P network identity and parameters.
- Full nodes independently validate blocks and transactions.
- Miners propose blocks; mining does not override node validation.

## 5. Network identity — unresolved

Before a usable network is created, the project must define and test the genesis block, P2P/RPC ports, message-start bytes, address prefixes, Bech32 HRP, data directories, configuration names, and separate testnet/regtest identities. DNS and fixed seeds must remain empty until independently operated nodes exist.

No Bitcoin network identity values or peer endpoints may be reused for FREELY. The detailed selection and approval procedure is in [NETWORK-IDENTITY-PLAN.md](NETWORK-IDENTITY-PLAN.md). All identifiers remain TBD; none are approved or implemented.

## 6. Upstream source policy

The proposed upstream starting point is the signed Bitcoin Core v32.1 tag. Before implementation, verify the tag signature against trusted maintainer keys and review the release/build instructions. Record the exact commit hash in the repository.

- Preserve upstream copyright notices and MIT license.
- Keep FREELY changes clearly identifiable.
- Document every consensus-relevant modification.
- Prefer the smallest possible upstream diff.
- Do not claim reproducible or verified builds until independently demonstrated.

## 7. Consensus test requirements

Tests must cover at least:

- Subsidy at height 0 and immediately before/at/after every halving boundary.
- Cumulative issuance and maximum money range.
- Coinbase maturity and coinbase reward plus fees.
- Difficulty retarget boundaries and timestamp edge cases.
- Genesis block identity and network separation.
- Rejection of invalid blocks and transactions.
- Reorganization and chain-selection behaviour.

## 8. Launch policy

This specification does not authorise a public mainnet launch.

A mainnet proposal requires passing automated tests, independent security review, reproducible release builds, multiple independent node operators, published operating/security documentation, and explicit project-owner approval.
