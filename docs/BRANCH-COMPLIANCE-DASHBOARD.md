# FREELY branch compliance dashboard

**Snapshot:** 16 November 2026, 06:14 UTC  
**Purpose:** track completion of each branch's defined scope, not overall blockchain readiness.  
**Rule:** draft documentation, queued CI and uncompiled code do not count as passed tests. No percentage is a security or launch-readiness score.

## Scoring method

Scores are provisional scope-completion estimates, based on the evidence linked below. Each branch is assessed against its own deliverables. A task is complete only when its evidence exists; queued or in-progress checks remain incomplete. The score must be recalculated when the branch changes or a CI/review result becomes terminal.

## Five core branches

| Core branch | Scope compliance | Evidence / outstanding gate |
|---|---:|---|
| `main` — coordination | **80%** | Project scope, pinned baseline, sprint plan and master checklist exist. Handbook is v1.0 and needs a milestone update. |
| `m1-consensus-design` — coordination design | **75%** | Monetary policy, source review and design/check scripts exist. Network identity and final consensus decisions remain open. [PR #2](https://github.com/Schmacko/freely-core/pull/2) |
| `freely/upstream-v32.1` — source baseline | **100%** | Exact v32.1 commit pinned; signed-tag verification and unchanged upstream baseline build succeeded. This is a baseline branch, not FREELY implementation. |
| `freely/m1-consensus` — M1 code/tests | **65%** | Monetary-policy and chain-classification tests plus dedicated workflow are committed. Current-head C++ build/test is queued; dedicated FREELY chain type is not implemented. [PR #1](https://github.com/Schmacko/freely-bitcoin-core./pull/1) |
| `freely/network-architecture` — network design | **80%** | Chain-selection audit, architecture and provisional parameter inventory exist. No production identity, genesis or runtime chain integration is activated. |

**Simple mean of the five core branch scores: 80%.** This is a project-management indicator only. The separate master checklist reports **25/157 (15.9%)** checked tasks for the broader project; it is the more conservative whole-project task measure.

## Additional engineering branches

These are supporting workstreams and do not replace the five core branches.

| Branch | Current deliverable | Status |
|---|---|---|
| `freely/consensus-specification` | Detailed consensus specification and issuance checks | Draft PR #2; review/validation pending |
| `freely/chain-selection-audit` | Chain-selection integration audit | Draft PR #3; review pending |
| `freely/pow-difficulty-audit` | PoW/difficulty source audit | Draft PR #4; review pending |
| `freely/retarget-policy` | Owner-approved retarget policy recorded | Draft PR #5; runtime implementation/tests pending |
| `freely/retarget-test-vectors` | Deterministic synthetic retarget vectors and C++ clamp-vector test | Draft PR #6; C++ test and focused workflow committed; current-head CI queued |

## Current CI evidence

- [FREELY M1 consensus tests, run 43814221505](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/43814221505): queued; no test result yet.
- [Inherited Bitcoin Core CI, run 43814222027](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/43814222027): queued; 25 jobs.
- [Focused FREELY retarget tests, run 43815278249](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/43815278249): queued.
- [Inherited CI, run 43815278235](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/43815278235): queued.
- [Inherited CI, run 43815273557](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/43815273557): queued.
- [Retarget test-vectors CI, run 43815146391](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/43815146391): queued.

The current queue is an external execution bottleneck. Do not describe it as a code failure or as a successful test. Avoid unnecessary commits that create duplicate CI matrices.

## Immediate acceleration priorities

1. Obtain terminal results for current-head dedicated M1 and inherited CI.
2. Fix genuine compile/test defects; classify runner, dependency and service failures separately.
3. Run the new retarget clamp vectors in `pow_tests`; add boundary-selection and minimum-difficulty tests before runtime integration.
4. Complete chain-selection and production/test classification audit, including test-only startup overrides.
5. Keep candidate network identity provisional until collision checks and owner approval.
6. Update this dashboard and the DOCX handbook after verified milestones.

## Approval and safety gates

- No PR merge without explicit owner approval.
- Do not activate candidate network identifiers or generate a production genesis block without the required review and owner decision.
- No public testnet, public mining, mainnet, paid infrastructure or irreversible deployment is authorised by this dashboard.
- Preserve the €0 budget and the original consensus/security scope.
