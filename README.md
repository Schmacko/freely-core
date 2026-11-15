# FREELY Core

**Ticker:** FLY  
**Project status:** Early development / documentation foundation  
**Consensus proposal:** SHA-256d Proof of Work  
**Ledger proposal:** Bitcoin-derived UTXO model

FREELY is an intended independent blockchain with its own native currency, FLY. It is being designed from a Bitcoin Core codebase, with independent network identity and consensus parameters.

FREELY is not a token on Bitcoin or another blockchain. It does not inherit Bitcoin's mining hashrate or security.

## Proposed monetary parameters

- Maximum supply ceiling: 21,000,000 FLY.
- Initial subsidy: 50 FLY.
- Halving interval: 210,000 blocks.
- Smallest unit: 0.00000001 FLY.
- Target block interval: 10 minutes.
- Difficulty adjustment interval: 2,016 blocks.
- Premine, founder allocation and ICO: none.

Bitcoin-style integer halving results in a cumulative theoretical issuance of 20,999,999.9769 FLY. The 21-million figure is a ceiling.

## Current status

This repository contains the project's documentation foundation and read-only diagnostic/arithmetic scripts. It does **not** yet contain a FREELY daemon, wallet, genesis block, mining implementation, or running network.

No public mainnet launch is authorised.

## Documentation

- [Technical specification](docs/TECHNICAL-SPEC.md)
- [Development roadmap](docs/ROADMAP.md)
- [Security model](docs/SECURITY-MODEL.md)
- [Development environment guide](docs/BUILD-GUIDE.md)
- [Network identity plan](docs/NETWORK-IDENTITY-PLAN.md)
- [Upstream baseline](docs/UPSTREAM-BASELINE.md)
- [GitHub Actions build and cost controls](docs/GITHUB-ACTIONS.md)

## Diagnostic scripts

Run from the repository root:

```bash
bash scripts/environment-check.sh
bash scripts/check-subsidy-schedule.sh
```

Both scripts are intended to be read-only. The subsidy script checks the proposed integer-halving arithmetic; it is not yet a test of compiled consensus code.

## Upstream and licensing

The proposed upstream starting point is Bitcoin Core v32.1, subject to signed-tag verification and exact commit pinning before implementation. Preserve all upstream copyright and license notices. Review the upstream license files before distributing derivative binaries.

## Security notice

FREELY is experimental and has no established network security. Do not use hypothetical or test coins as having monetary value. A low-hashrate SHA-256d network can be vulnerable to majority-hashrate attacks and chain reorganizations.

See [SECURITY-MODEL.md](docs/SECURITY-MODEL.md) before running or contributing to the project.
