# FREELY branch compliance dashboard

**Snapshot:** 18 November 2026, 00:44 UTC  
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


## Live engineering refresh — 18 November 2026, 00:44 UTC

**Repository checked:** `Schmacko/freely-bitcoin-core.`  
**Result:** 11 open draft PRs; 0 merged. GitHub currently reports each PR as mergeable, but this is not a substitute for passing CI, code review or explicit merge conditions.

| PR | Workstream | Current head | Current validation |
|---:|---|---|---|
| [#1](https://github.com/Schmacko/freely-bitcoin-core./pull/1) | M1 monetary policy | `e3f8f4df7fd2` | Current head CI not freshly revalidated |
| [#2](https://github.com/Schmacko/freely-bitcoin-core./pull/2) | Consensus specification / genesis candidate | `1c839b9b8773` | Focused workflow queued |
| [#3](https://github.com/Schmacko/freely-bitcoin-core./pull/3) | Chain-selection audit | `6b1443774a7b` | No new terminal result inspected |
| [#4](https://github.com/Schmacko/freely-bitcoin-core./pull/4) | PoW/difficulty audit | `442ebbe77434` | No new terminal result inspected |
| [#5](https://github.com/Schmacko/freely-bitcoin-core./pull/5) | Retarget policy | `226a5f83fe83` | No new terminal result inspected |
| [#6](https://github.com/Schmacko/freely-bitcoin-core./pull/6) | Retarget/BIP94 tests | `fb4cb26b635e` | Focused workflow pending; no pass claimed |
| [#7](https://github.com/Schmacko/freely-bitcoin-core./pull/7) | Network architecture | `7157d5ce9654` | No new terminal result inspected |
| [#8](https://github.com/Schmacko/freely-bitcoin-core./pull/8) | Core chain integration | `8a10e4b88757` | Focused workflow queued |
| [#9](https://github.com/Schmacko/freely-bitcoin-core./pull/9) | CI Windows portability | `66a92038f423` | No new terminal result inspected |
| [#10](https://github.com/Schmacko/freely-bitcoin-core./pull/10) | Network safety preflight | `b367050355d5` | New focused workflow queued |
| [#11](https://github.com/Schmacko/freely-bitcoin-core./pull/11) | Wallet/node readiness | `408495e33fb2` | Focused workflow queued |

### Current focused workflow runs

- [PR #10 network safety preflight, run 44210117086](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44210117086): queued on head `b367050355d5`.
- [PR #2 consensus/genesis checks, run 44210212065](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44210212065): queued on head `1c839b9b8773`.
- [PR #6 retarget/BIP94 tests, run 44200994415](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44200994415): pending on head `fb4cb26b635e`.
- [PR #8 core-chain tests, run 44202151233](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44202151233): queued on head `8a10e4b88757`.
- [PR #11 wallet/node tests, run 44202242728](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44202242728): queued on head `408495e33fb2`.

The focused PR #10 and #2 workflows were triggered by the latest commits in this execution batch. Earlier runs that were cancelled after subsequent commits are not counted as failures or passes. CI is still an external execution bottleneck; inspect the final attempt and job logs before claiming validation.

### New work committed in this refresh

- PR #10: cross-platform safe single-component data-directory validation; adversarial Windows/POSIX path tests; corrected resolved-decision documentation.
- PR #2: strict hexadecimal validation for genesis header inputs; negative fixtures for malformed hex, invalid compact targets and targets above the supplied `powLimit`.
- No production parameters were selected, no production network was activated, and no PR was merged.

### Metrics discipline

The previously reported 41.7% overall and 79.7% branch-average figures are historical planning estimates, not newly verified metrics. They are not recalculated in this snapshot because no current-head C++ or functional workflow has reached a verified successful conclusion. Keep code written, compiled, tests passed, reviewed and merged as separate measures.

### Updated next priorities

1. Obtain terminal results for PR #10 and PR #2 current-head workflows; diagnose failures from logs.
2. Obtain current-head PR #8 and #11 build/test results.
3. Verify PR #6 BIP94 and retarget tests; check the exact expected rejection reason against pinned v32.1.
4. Continue the complete chain-type and production/test guard audit.
5. Add runtime network-identity collision tests only after a dedicated FREELY parameter object can be tested without activating production settings.
6. Keep the final PoW limit, initial difficulty, genesis timestamp/message and identity under the existing owner approval gates.


## Live engineering refresh — 18 November 2026 (latest verified GitHub state)

**Implementation repository:** `Schmacko/freely-bitcoin-core.`  
**Coordination repository:** `Schmacko/freely-core`  
**PR state:** 11 open, 11 draft, 0 merged. GitHub reports the PRs mergeable; this is not CI success or technical approval.

### Current PR heads

| PR | Workstream | Current head | State |
|---:|---|---|---|
| [#1](https://github.com/Schmacko/freely-bitcoin-core./pull/1) | M1 monetary policy | `e3f8f4df7fd2` | Draft |
| [#2](https://github.com/Schmacko/freely-bitcoin-core./pull/2) | Consensus specification / genesis candidate | `1c839b9b8773` | Draft |
| [#3](https://github.com/Schmacko/freely-bitcoin-core./pull/3) | Chain-selection audit | `6b1443774a7b` | Draft |
| [#4](https://github.com/Schmacko/freely-bitcoin-core./pull/4) | PoW/difficulty audit | `442ebbe77434` | Draft |
| [#5](https://github.com/Schmacko/freely-bitcoin-core./pull/5) | Retarget policy | `226a5f83fe83` | Draft |
| [#6](https://github.com/Schmacko/freely-bitcoin-core./pull/6) | Retarget/BIP94 tests | `fb4cb26b635e` | Draft |
| [#7](https://github.com/Schmacko/freely-bitcoin-core./pull/7) | Network architecture | `7157d5ce9654` | Draft |
| [#8](https://github.com/Schmacko/freely-bitcoin-core./pull/8) | Core chain integration | `e3fddb9e5a56` | Draft |
| [#9](https://github.com/Schmacko/freely-bitcoin-core./pull/9) | CI Windows portability | `66a92038f423` | Draft |
| [#10](https://github.com/Schmacko/freely-bitcoin-core./pull/10) | Network safety preflight | `b367050355d5` | Draft |
| [#11](https://github.com/Schmacko/freely-bitcoin-core./pull/11) | Wallet/node readiness | `eab50e4ccb0d` | Draft |

### Latest focused CI evidence

| PR | Workflow run | Latest observed status |
|---:|---|---|
| #2 | [44210212065](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44210212065) | Queued |
| #6 | [44200994415](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44200994415) | Pending; job queued |
| #8 | [44211275120](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44211275120) | Queued (latest head) |
| #10 | [44210117086](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44210117086) | Queued |
| #11 | [44211327838](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44211327838) | Queued (latest head) |

Jobs were inspected directly: all five focused jobs were still queued at the latest check. No current-head test pass is claimed. The queue is an external CI execution bottleneck; no evidence currently distinguishes a code failure because no job has run to completion.

### Newly completed engineering work

- **PR #8:** strengthened the binary-level startup regression test. It now starts with only `-chain=freely` and deliberately does not disable listening. This tests that FREELY fails closed even though upstream's default P2P listening setting is enabled. Commit: `a20399d39086c75dc895442e78130fb95993c747`.
- **PR #11:** documented the source-level wallet address/key network-separation audit. Base58 P2PKH/P2SH, WIF, extended keys, and Bech32 HRP all derive from active chain parameters; mismatched Bech32 HRPs are rejected. No FREELY prefixes/HRP were assigned. Commit: `eab50e4ccb0d5ad836ca5a3aab3777cd8bf14c6d`.
- **PR #6:** source-checked the BIP94 functional test against v32.1. The regtest-only `-test=bip94` option sets `enforce_BIP94`; the 601-second rejection reason `time-timewarp-attack` matches the validation path. This is source review, not a passing test.
- **PR #8:** source audit confirms `GetNetworkForMagic()` intentionally recognises only the five built-in Bitcoin networks while FREELY has no approved magic. `SetupServerArgs()` constructs built-in parameter objects for static help/default descriptions; those MAIN references are not runtime selection of the active chain. FREELY factories still throw before node networking.
- Existing PR #2 and #10 commits remain unchanged in this batch; their strict genesis-header validation and portable data-directory checks await CI execution.

### Completion metrics and gates

Do not raise project or branch percentages based on documentation or commits alone. Current evidence supports **code committed: yes** for the two changes above; **compiled: not verified**; **focused tests passed: 0 verified in this refresh**; **merged: 0 PRs**. Previous overall/branch percentage estimates remain historical and are not refreshed until current-head build/test evidence is terminal.

Numeric `powLimit`, initial difficulty, final genesis timestamp/message/commitment, production network identity, and any public network activation remain unapproved. No public listener, DNS seed, testnet/mainnet launch, mining deployment, or paid infrastructure is authorised.


### PR #8 documentation follow-up

The PR #8 safety-audit document was synchronised after the code/test commit. Latest PR head is now `e3fddb9e5a569047d5112482c19497732a80ac15`; the focused workflow [44211275120](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44211275120) was triggered by the preceding code/test commit `a20399d39086c75dc895442e78130fb95993c747`. The follow-up commit changed documentation only, and no new workflow was triggered because the workflow's path filter does not include that audit document. The implementation tested by the queued run is unchanged. Do not describe it as a current-head pass until the queued run completes.


## Live execution refresh — 18 November 2026 (current session)

**Verification basis:** live GitHub PR metadata, branch references, focused workflow run metadata, and source reads from the current PR #8 implementation branch. This refresh supersedes the older run IDs/statuses above where they conflict.

### Pull-request state

| PR | Workstream | Head SHA | Base branch / base SHA | State |
|---:|---|---|---|---|
| [#1](https://github.com/Schmacko/freely-bitcoin-core./pull/1) | M1 monetary policy | `e3f8f4df7fd2` | `freely/upstream-v32.1` / `f0de87f04062` | Open, draft |
| [#2](https://github.com/Schmacko/freely-bitcoin-core./pull/2) | Consensus specification / genesis | `1c839b9b8773` | `freely/upstream-v32.1` / `f0de87f04062` | Open, draft |
| [#3](https://github.com/Schmacko/freely-bitcoin-core./pull/3) | Chain-selection audit | `6b1443774a7b` | `freely/upstream-v32.1` / `f0de87f04062` | Open, draft |
| [#4](https://github.com/Schmacko/freely-bitcoin-core./pull/4) | PoW/difficulty audit | `442ebbe77434` | `freely/upstream-v32.1` / `f0de87f04062` | Open, draft |
| [#5](https://github.com/Schmacko/freely-bitcoin-core./pull/5) | Retarget policy | `226a5f83fe83` | `freely/upstream-v32.1` / `f0de87f04062` | Open, draft |
| [#6](https://github.com/Schmacko/freely-bitcoin-core./pull/6) | Retarget/BIP94 tests | `fb4cb26b635e` | `freely/upstream-v32.1` / `f0de87f04062` | Open, draft |
| [#7](https://github.com/Schmacko/freely-bitcoin-core./pull/7) | Network architecture | `7157d5ce9654` | `freely/upstream-v32.1` / `f0de87f04062` | Open, draft |
| [#8](https://github.com/Schmacko/freely-bitcoin-core./pull/8) | Core chain integration | `e3fddb9e5a56` | `freely/m1-consensus` / `e3f8f4df7fd2` | Open, draft |
| [#9](https://github.com/Schmacko/freely-bitcoin-core./pull/9) | Windows CI portability | `66a92038f423` | `freely/upstream-v32.1` / `f0de87f04062` | Open, draft |
| [#10](https://github.com/Schmacko/freely-bitcoin-core./pull/10) | Network safety preflight | `b367050355d5` | `freely/upstream-v32.1` / `f0de87f04062` | Open, draft |
| [#11](https://github.com/Schmacko/freely-bitcoin-core./pull/11) | Wallet/node readiness | `eab50e4ccb0d` | `freely/core-chain-implementation` / `8a10e4b88757` | Open, draft; base is behind current PR #8 head |

All 11 PRs remain open and draft; none is merged. GitHub's mergeable flag is not a test or review approval. PR #11's recorded base SHA is behind the current PR #8 head and must be reconciled before integration. Its review threads and submitted reviews were empty at this inspection.

### Current CI evidence

- [PR #8 focused core-chain workflow, run 44211419468](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44211419468): queued on head `e3fddb9e5a56`.
- [PR #8 inherited CI, run 44211419033](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44211419033): queued on head `e3fddb9e5a56`.
- [PR #11 wallet/node workflow, run 44211327838](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44211327838): queued on head `eab50e4ccb0d`.
- [PR #11 inherited CI, run 44211327837](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44211327837): queued on head `eab50e4ccb0d`.
- [PR #2 consensus/genesis workflow, run 44210212065](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44210212065): queued on head `1c839b9b8773`.
- [PR #10 network safety workflow, run 44210117086](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44210117086): queued on head `b367050355d5`.
- [PR #6 retarget/BIP94 workflow, run 44200994415](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44200994415): pending at last known inspection; needs fresh job-level confirmation.

The earlier PR #8 run `44211275120` was subsequently **cancelled** after a newer run was generated; it is not a code failure or a pass. No current-head focused test pass is verified in this refresh.

### Work completed in this session

- **PR #8:** extended `docs/FREELY-RPC-P2P-SAFETY-AUDIT.md` with a fresh source audit of `src/init.cpp`, `src/chainparams.cpp`, `src/chainparamsbase.cpp`, `src/chainparamsbase.h`, `src/net.cpp` and `src/rpc/server.cpp`. It clarifies that `ChainType::MAIN` constructions in `SetupServerArgs()` are static help/default metadata, not active-chain fallback; records the `-test` regtest-only guard; and documents RPC/P2P exposure and pre-activation tests still required. Commit: `2ee86445cc1e7c15d715f785e02fa1adeba295b4`.
- **PR #8:** no production parameters, network identity, genesis activation, DNS seeds or public listener were added. Startup remains fail-closed.
- **PR #11:** dependency gap identified: base SHA `8a10e4b88757` is behind PR #8 head `e3fddb9e5a56`. No rebase/update was attempted because the connector currently exposes PR base metadata but not a verified branch-update/rebase operation in this session.

### Metrics and evidence discipline

- Open draft PRs: **11/11**.
- Merged PRs: **0/11**.
- Current-head focused test passes verified in this session: **0**.
- PR #8 source audit documentation: **committed** at `2ee86445cc1e7c15d715f785e02fa1adeba295b4`.
- Full compilation on the latest PR #8 head: **not verified**.
- Overall project and branch percentages: **not increased**. Documentation/source review alone does not establish compiled, runtime-tested or merged completion.

### Handbook

The latest available DOCX source remains handbook v1.3. A v1.4 DOCX was not created in this session because the document-generation capability was unavailable. Continue updating GitHub implementation documentation; only publish a new DOCX after file-generation capability returns and the file is verified.

### Safety gates

Numeric production `powLimit` and initial difficulty, final genesis header/time/message, network magic/ports/address prefixes/HRP, live FREELY RPC/P2P activation, public testnet/mainnet, DNS seeds, mining deployment and paid infrastructure remain outside this execution batch. No production values or network launch were activated.
