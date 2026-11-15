# FREELY Security Model

**Status:** Initial risk register; not a security audit.

## Core principle

FREELY is a separate blockchain. It will not inherit Bitcoin's mining hashrate, decentralization, operational maturity or security merely by using Bitcoin-derived software and SHA-256d.

A small Proof-of-Work network can be inexpensive to attack. SHA-256d is a hash function, not a guarantee of economic security.

## Initial threat register

| Threat | Consequence | Required response |
|---|---|---|
| Majority-hashrate attack | Reorganizations, double-spends, censorship | Treat low-hashrate chain as experimental; monitor hash rate; independent review |
| Consensus implementation bug | Invalid chain split or loss of funds | Minimal consensus changes; deterministic tests; external review |
| Subsidy/supply bug | Incorrect issuance | Integer-only money; boundary tests; independently verified issuance calculation |
| Difficulty/timestamp manipulation | Unstable block production or weakened work | Test retarget boundaries and timestamp rules |
| Network identity collision | Accidental connection to another chain | Unique magic, ports, prefixes and genesis; isolation tests |
| Software supply-chain compromise | Malicious binaries or source | Verify signed upstream tag; pin commits; document build provenance |
| Key loss or theft | Irrecoverable loss or unauthorized spending | Wallet security guidance; backups; never request private keys |
| Centralized infrastructure | Censorship or single points of failure | Multiple independent node and seed operators |

## Security gates

1. No real-value use during private development.
2. No claims that testnet coins have monetary value.
3. Consensus changes require tests and documented review.
4. Public testnet requires a readiness review and independent operators.
5. Mainnet requires independent security review and explicit project-owner approval.

## Incident response

Before public testnet, document how to report vulnerabilities privately, pause releases, communicate network incidents, and coordinate emergency fixes. Do not publish exploit details before affected users and operators can respond.
