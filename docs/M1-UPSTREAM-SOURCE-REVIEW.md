# Bitcoin Core v32.1 — M1 Source Review Map

**Purpose:** Record the upstream locations reviewed for the first FREELY consensus changes. This is a source-navigation and review note, not an implementation patch.

**Pinned upstream:** Bitcoin Core v32.1  
**Tag signature:** The GitHub Actions baseline workflow verifies the signed tag and the configured maintainer-key fingerprint before configuring/building.  
**Integration gate:** Do not begin source integration until that workflow completes successfully and confirms both expected binaries.

## 1. Subsidy calculation

File: \`src/validation.cpp\`  
Function: \`GetBlockSubsidy(int nHeight, const Consensus::Params& consensusParams)\`

The v32.1 implementation:
- Derives the number of halvings from \`nHeight / consensusParams.nSubsidyHalvingInterval\`.
- Returns zero for 64 or more halvings to avoid an undefined right shift.
- Starts at \`50 * COIN\`.
- Right-shifts the integer subsidy by the halving count.

FREELY should retain this established integer arithmetic and use the FREELY consensus parameter for the interval. No floating-point calculation is appropriate. Valid block heights are nonnegative; do not add consensus behaviour for negative heights without a separate reason and tests.

## 2. Halving interval configuration

File: \`src/kernel/chainparams.cpp\`  
Main chain constructor: \`CMainParams\`  
Field: \`consensus.nSubsidyHalvingInterval\`

Bitcoin mainnet assigns 210,000 here. FREELY must set its value in its own chain-parameter construction, not mutate Bitcoin parameters globally. The test and regression chain constructors need separate, intentional settings.

The type and field declaration are in \`src/consensus/params.h\`.

## 3. Monetary range

File: \`src/consensus/amount.h\`

Upstream defines:
- \`CAmount\` as signed 64-bit integer.
- \`COIN\` as 100,000,000 base units.
- \`MAX_MONEY\` as 21,000,000 times \`COIN\`.
- \`MoneyRange\` as a nonnegative upper-bound check.

FREELY's maximum range remains 21,000,000 FLY, numerically the same ceiling in base units, but the currency name and all user-facing denomination strings must be FREELY-specific. Changing this consensus-critical constant requires explicit tests and source review.

## 4. Coinbase reward validation

File: \`src/validation.cpp\`, inside block connection validation.

The upstream rule computes block reward as transaction fees plus \`GetBlockSubsidy(height, consensusParams)\`, then rejects a coinbase whose output value exceeds that amount. Preserve the rule and its accounting path; do not duplicate fee calculations or allow miners to claim more than subsidy plus valid fees.

## 5. Existing subsidy tests

File: \`src/test/validation_tests.cpp\`

Existing cases:
- \`block_subsidy_test\` tests halving behaviour using mainnet and alternative intervals.
- \`subsidy_limit_test\` checks cumulative issuance and money range.

FREELY tests should be added alongside these patterns, but should not merely copy Bitcoin's expected total. They must assert FREELY's 210,000-block interval and exact expected cumulative issuance of 2,099,999,997,690,000 base units (20,999,999.9769 FLY).

Required additional boundary assertions:
- Height 0 and 209,999: 50 FLY.
- Height 210,000 and 419,999: 25 FLY.
- Height 420,000: 12.5 FLY.
- Height 630,000: 6.25 FLY.
- Height 1,260,000: 0.78125 FLY.
- Height 6,720,000 (32 halvings): 0.00000001 FLY (one base unit).
- Height 6,930,000 (33 halvings): zero; all later eras remain zero.

## 6. Minimal implementation sequence after the build gate

1. Create a clean FREELY source branch from the pinned v32.1 commit.
2. Add FREELY-specific chain-type/chain-parameter construction without altering Bitcoin chain parameters.
3. Set FREELY's halving interval to 210,000.
4. Set/confirm the 21,000,000 FLY money range using integer base units.
5. Add dedicated subsidy boundary and cumulative-issuance tests.
6. Build and run the focused test binary; then run the broader relevant test suite.
7. Review the complete diff against v32.1 and obtain independent review.

Do not copy Bitcoin's historical activation heights, checkpoints, genesis block, network magic, address prefixes, ports, DNS seeds or fixed seeds into FREELY. Those are separate chain-specific decisions and remain unassigned.

## 7. References

- \`src/validation.cpp\`
- \`src/kernel/chainparams.cpp\`
- \`src/consensus/params.h\`
- \`src/consensus/amount.h\`
- \`src/test/validation_tests.cpp\`

All references above are pinned to the v32.1 tag. This document should be rechecked against the exact fetched source commit before implementation.

## 8. Exact upstream pin

The source baseline is pinned to the annotated Bitcoin Core v32.1 tag:

- Tag: `v32.1`
- Annotated tag object: `94f59fa45ea443882655625f4a647608274453e2`
- Peeled source commit: `f0de87f040621468b956f01f526a43a010310501`
- Tagger: fanquake, dated 2026-10-26.

GitHub's tag object reports its PGP signature as verified. The FREELY baseline workflow separately imports the maintainer key, checks its configured primary fingerprint, and successfully completed the signed-tag verification step. The full build remains a separate gate; do not treat tag verification or CMake configuration as proof that compilation succeeded.
