# FREELY Network Identity Plan

**Status:** Design procedure only — no network identifiers have been assigned.

This document defines how FREELY will obtain independent network identifiers without accidentally connecting to Bitcoin or another chain. It deliberately does not invent final values. Identifiers become consensus/network compatibility commitments once software is released, so they must be selected, checked, documented, and tested together.

## 1. Required identifiers

| Identifier | Mainnet | Test network | Regtest |
|---|---|---|---|
| P2P message-start / network magic (4 bytes) | TBD | TBD | TBD |
| Default P2P port | TBD | TBD | TBD |
| Default RPC port | TBD | TBD | TBD |
| Base58 public-key address prefix | TBD | TBD | TBD |
| Base58 script address prefix | TBD | TBD | TBD |
| Private-key import prefix | TBD | TBD | TBD |
| Bech32 human-readable prefix (HRP) | TBD | TBD | TBD |
| Default data directory | TBD | TBD | TBD |
| Configuration filename | TBD | TBD | TBD |
| Genesis block hash | TBD | TBD | TBD |
| Genesis merkle root | TBD | TBD | TBD |
| DNS seeds | None initially | None initially | None |
| Fixed seeds | None initially | None initially | None |

No TBD value should be treated as an implementation value.

## 2. Selection rules

1. Choose values only after reviewing the corresponding upstream chain-parameter definitions in the pinned Bitcoin Core source.
2. Never copy Bitcoin mainnet, testnet, signet, or regtest identifiers.
3. Select a four-byte message-start value with a documented rationale; check the repository and public source tree for collisions.
4. Check P2P and RPC ports against the IANA registry and common local services. Document the selected defaults and allow configuration overrides where upstream architecture supports them.
5. Select address prefixes and a Bech32 HRP that are distinct from Bitcoin and other relevant networks. Test encode/decode round trips and cross-network rejection.
6. Give each network a separate data directory and configuration identity so test data cannot be mistaken for mainnet data.
7. Keep DNS and fixed seed lists empty until independent, reliable node operators have agreed to operate them. Never publish placeholder or fabricated seed hosts.
8. Generate and freeze the genesis block only after the consensus parameters, timestamp, output script, nonce, time, and difficulty are reviewed. Record the complete genesis block, merkle root, and hash in source and tests.

## 3. Genesis block procedure

The genesis block is a one-time network identity commitment. Before accepting it:

- Define the genesis coinbase transaction and its output script.
- Define the timestamp text and explain its provenance.
- Select the initial time, nonce, and proof-of-work target under the proposed rules.
- Independently reproduce the genesis serialization and hash with a small verification program.
- Confirm that the computed hash satisfies the selected proof-of-work limit.
- Add tests asserting the exact genesis hash and merkle root for every network.
- Confirm that all network variants have distinct genesis identities.

Do not use a hidden premine or an unannounced spendable founder allocation in the genesis coinbase. Any genesis output must be explicitly disclosed and reconciled with the no-premine policy.

## 4. Required automated tests

- Mainnet, test network, and regtest have distinct message-start values.
- Default ports and data directories are distinct.
- Address encodings decode only under the intended network parameters.
- Each network's genesis hash and merkle root match fixed expected constants.
- A node configured for one network rejects peers and data from incompatible networks.
- No DNS or fixed seed is configured until an operator and endpoint have been verified.

## 5. Approval gate

Before these values are committed to consensus code, present the complete proposed identifier table and genesis-block construction inputs for project-owner review. Do not launch or advertise a public network merely because identifiers have been selected.
