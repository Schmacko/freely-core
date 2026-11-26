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


### CI status correction — latest job-level recheck

A subsequent job-level inspection shows the latest PR #8 runs are no longer queued: focused run [44211419468](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44211419468) and inherited run [44211419033](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44211419033) have both been **cancelled**. The cancellation does not establish a code failure or a pass. PR #11 focused wallet job [44211327838](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44211327838), inherited CI [44211327837](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44211327837), PR #2 run `44210212065`, PR #10 run `44210117086`, and PR #6 run `44200994415` were still queued at the latest job-level check. Current-head successful tests verified: **0**.

A commit comparison confirms PR #8 is two commits ahead of PR #11's recorded base SHA `8a10e4b88757`: the changes are the fail-closed startup regression test and the RPC/P2P audit document. PR #11 cannot be considered fully reconciled until its head is updated to include these two commits without losing its wallet workflow and readiness documentation. No safe automatic rebase/update operation was available in this session, so the branch was left untouched.


---

## Live engineering execution update — 18 November 2026, 17:20 UTC

**This section supersedes all earlier PR counts, head SHAs, workflow IDs and status statements above.** Earlier snapshots are retained as history and must not be read as current status.

### Current PR inventory

**12 PRs created · 10 open · 2 closed unmerged · 0 merged.** All 10 open PRs are drafts.

| PR | Workstream | Current head | Current base | State |
|---:|---|---|---|---|
| [#1](https://github.com/Schmacko/freely-bitcoin-core./pull/1) | M1 monetary policy | `06d79002` | `freely/upstream-v32.1` | Open, draft |
| [#2](https://github.com/Schmacko/freely-bitcoin-core./pull/2) | Consensus specification | `1c839b9b` | `freely/upstream-v32.1` | Open, draft |
| [#3](https://github.com/Schmacko/freely-bitcoin-core./pull/3) | Chain-selection audit | `d4b6ad2d` | `freely/upstream-v32.1` | Closed, unmerged; superseded by #12 |
| [#4](https://github.com/Schmacko/freely-bitcoin-core./pull/4) | PoW/difficulty audit | `442ebbe7` | `freely/upstream-v32.1` | Open, draft |
| [#5](https://github.com/Schmacko/freely-bitcoin-core./pull/5) | Retarget policy | `96288f54` | `freely/upstream-v32.1` | Open, draft |
| [#6](https://github.com/Schmacko/freely-bitcoin-core./pull/6) | Retarget/BIP94 tests | `fb4cb26b` | `freely/upstream-v32.1` | Open, draft |
| [#7](https://github.com/Schmacko/freely-bitcoin-core./pull/7) | Network architecture | `7157d5ce` | `freely/upstream-v32.1` | Closed, unmerged; superseded by #12 |
| [#8](https://github.com/Schmacko/freely-bitcoin-core./pull/8) | Core chain implementation | `5f8fa282` | `freely/m1-consensus` @ `06d79002` | Open, draft |
| [#9](https://github.com/Schmacko/freely-bitcoin-core./pull/9) | Windows CI portability | `66a92038` | `freely/upstream-v32.1` | Reopened, draft |
| [#10](https://github.com/Schmacko/freely-bitcoin-core./pull/10) | Network safety preflight | `344e7ed3` | `freely/upstream-v32.1` | Open, draft |
| [#11](https://github.com/Schmacko/freely-bitcoin-core./pull/11) | Wallet/node readiness | `3cc61bad` | `freely/core-chain-implementation` @ `5f8fa282` | Open, draft |
| [#12](https://github.com/Schmacko/freely-bitcoin-core./pull/12) | Consolidated docs/specification | `ad93aa6e` | `freely/upstream-v32.1` | Open, draft |

### Dependency status

- PR #8 is based on the current PR #1 head.
- PR #11 is based on the current PR #8 head; the previously identified three-commit mismatch is reconciled.
- PR #12 consolidates consensus specification, network architecture and chain-selection audit documents previously spread across PRs #2, #3 and #7. PR #3 and #7 were closed unmerged after their source-of-truth content was carried into #12.
- PR #9 was reopened because its Windows checkout and no-wallet container fixes remain independently useful and had not been merged elsewhere.

### New source-of-truth correction

PR #12's chain-selection audit contained stale language saying the project still had to decide whether genesis had a reward output. This contradicted the owner's 17 November decision. The wording was corrected to state:
- the 50 FLY height-zero subsidy remains in scheduled issuance accounting;
- the genesis coinbase is permanently unspendable and excluded from spendable supply;
- the current OP_RETURN transaction is only a candidate, not an activated genesis commitment.

Correction commit: `ad93aa6e970b770e8fed899931c13fb2d6c6ab10`.

### Current exact-head CI evidence

| Workstream | Run | Head | Status at 17:20 UTC |
|---|---:|---|---|
| PR #9 inherited CI | [44357357887](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44357357887) | `66a92038` | Pending; 25 jobs queued |
| PR #12 focused consensus checks | [44357328594](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44357328594) | `ad93aa6e` | Queued |
| PR #12 inherited CI | [44357328605](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44357328605) | `ad93aa6e` | Queued |
| PR #11 wallet/node | [44318647471](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44318647471) | `3cc61bad` | Queued |
| PR #10 network safety | [44320905289](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44320905289) | `344e7ed3` | Queued |
| PR #6 retarget/BIP94 | [44200994415](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44200994415) | `fb4cb26b` | Queued |

The PR #9 and #12 job lists were inspected directly. PR #9 has 25 inherited jobs queued; PR #12 focused consensus job is queued. PR #11, #10 and #6 each have their single focused job queued. There are no current-head successful tests or confirmed builds in this inspection. Cancelled older runs are not passes or failures.

### Work completed in this execution

- Reconciled PR #12 chain-selection audit with the owner-approved genesis accounting; committed `ad93aa6e970b770e8fed899931c13fb2d6c6ab10`.
- Reopened PR #9 to preserve the Windows-safe checkout, vcpkg cache-key and no-wallet container-image fixes. The PR remains draft; current-head CI is pending.
- Reconfirmed PR #8 → #1 and PR #11 → #8 dependency alignment.
- Reviewed the PR #6 BIP94 functional test and C++ retarget fixtures against their documented purpose. The source-level review is not a substitute for CI execution.
- Updated PR #12's description with the correction and current exact-head workflow references.

### Metrics discipline

Do not carry forward the previous 80% five-branch mean, 27% whole-project estimate, or 81% branch average as a live completion score. Those numbers were produced from older scopes and inconsistent denominators. Recalculate only after a branch-by-branch acceptance audit that separates:
1. code committed;
2. code compiled on exact head;
3. focused tests passed on exact head;
4. full CI passed;
5. reviewed;
6. merged.

Current verified measures for this refresh: code/documentation commit made: yes; current-head successful focused runs: 0; current-head builds verified: 0; merged PRs: 0.

### Remaining priorities

1. Obtain terminal results for PR #9, #12, #11, #10 and #6 exact-head workflows; inspect job logs and distinguish code defects from runner/queue failures.
2. Reconcile any portability findings from PR #9 before considering merge.
3. Complete the full `ChainType::MAIN` call-site audit and verify production/test override guards.
4. Expand genesis candidate checks and independently validate the transaction/header commitment after parameters are approved.
5. Continue wallet/node functional coverage, without claiming FREELY-specific addresses or a live FREELY chain.
6. Recalculate branch compliance from explicit acceptance criteria.
7. Update the implementation handbook only when the document-generation tool is available; no new DOCX version is claimed in this execution.

### Safety gates

Numeric production `powLimit`, initial difficulty, final network identity, final genesis commitment and exact script activation matrix remain unresolved. Keep FREELY startup fail-closed. No public testnet/mainnet launch, mining deployment, DNS seeds, public listener, paid infrastructure or irreversible deployment is authorised.


### PR consolidation correction — 18 November 2026, 17:22 UTC

After verifying that PR #12 carries the exact PR #2 consensus-specification head and its complete specification/generator/workflow file set, PR #2 was closed unmerged to avoid duplicate review and CI. PR #12 is the sole consolidated review target for that work. PR #3 and #7 remain closed unmerged as previously recorded; PR #9 remains reopened for the independent CI portability fixes.

**Corrected inventory:** 12 PRs created · 9 open · 3 closed unmerged · 0 merged. All 9 open PRs are drafts. No source implementation is discarded by this consolidation, and no production parameters are activated.


---

## Live engineering refresh — 19 November 2026

**This section supersedes earlier PR counts, SHAs, approvals and CI statuses above.** Older sections remain historical context.

### Coordination repository synchronization

- Default branch `main`: `710c05b84f7551d00b1316eedb6d11ca077e7f1f`.
- Design branch `m1-consensus-design`: `59b8028325148331d2ed3cb2d359fb82a8de4539`.
- Created a non-fast-forward merge commit with parents `d074476549cfb92c998a51cdbbc8a8ce3c4fa916` and current main `710c05b84f7551d00b1316eedb6d11ca077e7f1f`.
- The two main-branch commits changed only `docs/BRANCH-COMPLIANCE-DASHBOARD.md`; the design branch's three changed paths were `docs/M1-CONSENSUS-DESIGN.md`, `docs/M1-UPSTREAM-SOURCE-REVIEW.md`, and `scripts/check-subsidy-schedule.sh`. The path sets were disjoint and the dashboard file was preserved in the merged tree.
- PR #2 remains open/draft. Compare now reports 7 commits ahead and 0 behind. GitHub's mergeable flag still reports false; no merge was attempted.

### Implementation PR inventory

**12 PRs created · 9 open · 3 closed unmerged · 0 merged.** All 9 open implementation PRs are drafts. PR #2, #3 and #7 were closed unmerged; their specification/audit content is consolidated in PR #12.

| PR | Workstream | Current exact head | Current CI evidence |
|---:|---|---|---|
| [#1](https://github.com/Schmacko/freely-bitcoin-core./pull/1) | M1 monetary policy / production guards | `06d79002573506f9311abf35ae1d70c891f0a358` | Focused C++ run [44310378703](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44310378703) passed: test_bitcoin built; pow_tests and validation_tests 2/2 passed. Full CI [44310378640](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44310378640) queued. |
| [#4](https://github.com/Schmacko/freely-bitcoin-core./pull/4) | PoW/difficulty source audit | `08cfaff6d76ab301562badf2297756997f0ba420` | Previous run [43983947425](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/43983947425) failed on Windows checkout and trailing whitespace; whitespace fixed, checkout fix is in PR #9. No new exact-head run observed yet. |
| [#5](https://github.com/Schmacko/freely-bitcoin-core./pull/5) | Retarget policy | `96288f5487025c0b2f71783a09c4c9021cf06b78` | CI [44313365353](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44313365353) queued. |
| [#6](https://github.com/Schmacko/freely-bitcoin-core./pull/6) | Retarget/BIP94 C++ and functional tests | `76da2362b7c231669ba0b8cd4b658d558dbcf94a` | Focused [44360048684](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44360048684) and full CI [44360048592](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44360048592) queued. |
| [#8](https://github.com/Schmacko/freely-bitcoin-core./pull/8) | FREELY chain selector/base parameters and fail-closed startup | `77582a206d70f4d8af88d2f4fea3273cfd985d41` | Focused [44366915126](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44366915126) pending; full CI [44366915015](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44366915015) queued. |
| [#9](https://github.com/Schmacko/freely-bitcoin-core./pull/9) | Windows-safe CI portability | `66a92038f42385f12b16ec1295d77507a5c25d88` | New inherited CI [44357357887](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44357357887) pending. Earlier partial run was cancelled; not a full pass. |
| [#10](https://github.com/Schmacko/freely-bitcoin-core./pull/10) | Network safety and production-readiness preflight | `594b0f3afb28636a0855dff44dc63926175b3243` | Focused [44536476372](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44536476372) and full CI [44536476397](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44536476397) queued. |
| [#11](https://github.com/Schmacko/freely-bitcoin-core./pull/11) | Wallet/node readiness | `0b7e053a0e108b56ee361114b2c052081654ccba` | Fixed CMake functional-runner path after exact-head failure. Focused [44535690321](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44535690321) and full CI [44535690335](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44535690335) queued. |
| [#12](https://github.com/Schmacko/freely-bitcoin-core./pull/12) | Consolidated consensus/network docs and genesis candidate generator | `dbb6c6a549637616b5ccbfc6e57d367b9979d2ec` | Focused [44536381067](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44536381067) and full CI [44536381169](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44536381169) queued. |

### Owner-approved protocol parameters — 18 November 2026

All four proposal areas were explicitly approved. The authoritative implementation baseline is `docs/FREELY-APPROVED-PROTOCOL-PARAMETERS.md` in PR #10 and now also PR #12.

- PoW: SHA-256d; `powLimit=00000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffff`; genesis `nBits=0x1d00ffff` (decoded target is slightly harder than powLimit); 600-second spacing; 2,016-block interval; 14-day timespan; 1/4–4x clamp; minimum difficulty and no-retargeting disabled; BIP94 enabled from genesis.
- Network identity: magic `fa c3 b7 d1`; P2P/RPC 49444/49445; data/config suffix `freely`; Base58 55/117/183; extended keys `04464c59/04666c79`; Bech32 HRP `fly`.
- Genesis candidate: version 1; timestamp 1,794,960,000; message `FREELY FLY genesis 2026-11-18`; 50 FLY permanently unspendable OP_RETURN output. Nonce, transaction ID, Merkle root and final block hash remain derived and must be independently verified.
- Initial script matrix: BIP34/BIP65/BIP66/CSV/SegWit at height 1; Taproot/witness-v1 via the v32.1 script-flag architecture; TESTDUMMY NEVER_ACTIVE.

Approval authorizes implementation and verification only. It does not authorize production genesis activation, public network exposure, DNS seeds, mining deployment, public testnet/mainnet, paid infrastructure or launch. FREELY startup remains fail-closed.

### Current verified engineering evidence

- Exact-head PR #1 focused C++ compilation succeeded and `pow_tests` plus `validation_tests` passed 2/2.
- PR #11 wallet-enabled build succeeded on the earlier merge ref, but its functional runner failed before tests because it read the source-tree config path. The workflow now invokes the CMake build-tree runner; the fix is queued, not yet verified.
- PR #10 manifest and validator record the approved values but keep genesis hash/nonce unset. The preflight must remain blocked until the derived genesis commitment and release evidence exist.
- PR #12 now removes the conflicting unapproved proposal values, establishes one canonical approved document, reconciles the decision register/specification/architecture, and aligns the genesis candidate generator with the approved message/time/script/PoW values. Its focused test run is queued.
- No full CI matrix is currently verified successful; no PR is merged.

### Metrics discipline

Estimated weighted phase completion is a separate project estimate, not a CI/build/merge score. Current estimated phase values: foundation 90%, consensus specification 85%, network architecture 100%, core implementation 35%, testing 28%, wallet/node 15%, mining 10%, security 30%, testnet 5%, production readiness 0%. With the established weights this is 45.45%.

PR-backed branch estimates: 75.8% across 12 PR branches (including the three closed unmerged branches); all feature branches: 71.9% across 13 branches (adds the superseded no-PR retarget-regression branch). Open PR branch average alone is 71.1% across 9 branches. Compared with the prior 71.8%/11 PR-backed and 67.9%/12 all-branch snapshot, denominators increased by one because PR #12 was added; PR #2/#3/#7 closure changes status, not the historical branch count.

### Immediate next actions

1. Inspect exact-head PR #10 and #12 focused workflows and correct any deterministic test defects.
2. Inspect PR #11 rerun and confirm the CMake build-tree runner finds `build/test/config.ini` and starts the wallet functional test.
3. Reconcile PR #8 and PR #11 dependency heads before integration; PR #11 currently bases on PR #8's exact current head.
4. Resolve PR #9 portability CI and re-run PR #4 after the shared Windows checkout correction is available.
5. Begin the dedicated C++ FREELY parameter/genesis implementation behind the existing fail-closed startup gate; do not make the production chain selectable until derived genesis vectors and all exact-head tests are verified.
6. Continue no-merge policy while any relevant workflow is pending, queued, cancelled, skipped or failed.


## Latest engineering delta — 19 November 2026, 13:59 UTC

This addendum supersedes the earlier 19 November snapshot above.

### New exact-head implementation changes

- **PR #8, head `3078f79d6452dfccc9a1f4baeb0c0f3f1f635358`:** added `src/test/freely_genesis_tests.cpp` and registered it in `src/test/CMakeLists.txt`. The C++ test constructs the approved version-1 coinbase, checks the 50 FLY OP_RETURN output is unspendable, and asserts candidate transaction ID/Merkle root `c28adb462751d49bfd4ab13451f8f2801634f28d333d1493e93b6077dd6cdfa1`. It does not set a nonce or activate the chain. Focused run [44537444112](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44537444112) and full CI [44537444113](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44537444113) are queued; the C++ vector is not yet verified.
- **PR #11, head `65c5e697414b75943eea2d8cd76cb756bc8d9981`:** synchronized with PR #8 through merge commit `8791456a30a93004db334091d165a2838e407e94`, then corrected the wallet workflow to enable `BUILD_TESTS=ON` (so CMake generates `build/test/config.ini` and functional-runner links) while building only `bitcoind` and `bitcoin-cli`. It runs `build/test/functional/test_runner.py`. Focused [44537919886](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44537919886) and full CI [44537919781](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44537919781) are queued.
- **PR #10, head `33a69483ac55f77714755435dcfc77233bb6f336`:** static collision checks now include default BIP325 signet magic `0a03cf40`; arbitrary custom signet challenges are explicitly left to runtime collision validation. Added the missing `test_check_production_readiness.py` file after discovering that the workflow's second unittest discovery command previously ran zero tests. Current inventory: 22 network-safety tests + 17 production-readiness tests = 39 methods. Focused [44538762299](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44538762299) is queued; full CI [44538762453](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44538762453) is pending.
- **PR #12, head `c58b0b8772543b1dd417a04c5b703b7f78a095c7`:** approved baseline now documents the default signet collision value; focused [44538844927](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44538844927) and full CI [44538845317](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44538845317) are queued.

### Current verified evidence

- PR #1 exact-head focused C++ run [44310378703](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44310378703) passed: `test_bitcoin` compiled; `pow_tests` and `validation_tests` passed 2/2. Full CI [44310378640](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44310378640) remains queued.
- PR #9 full CI [44357357887](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44357357887) remains pending with all 25 jobs queued. Earlier partial run was cancelled.
- PR #4 trailing whitespace fixed in `08cfaff6d76ab301562badf2297756997f0ba420`; new runs [44536951045](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44536951045) and [44536938452](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44536938452) queued. Its previous run failed on Windows checkout; PR #9 holds the portability correction.
- PR #5 runs [44313365353](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44313365353) and [44313351736](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44313351736) queued.
- PR #6 focused [44360048684](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44360048684) and inherited runs [44360048592](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44360048592), [44360040395](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44360040395) queued.
- No PR has merged. Current successful C++ evidence remains PR #1's focused two-suite run only. No current-head FREELY genesis, retarget, preflight or wallet functional pass is verified.

### Current branch metrics

Estimated weighted phase completion: **47.50%** using the established phase weights and current phase estimates (foundation 90%, consensus spec 90%, architecture 100%, core 35%, testing 30%, wallet/node 20%, mining 10%, security 35%, testnet 5%, production 0%). This is an estimate of work, not build/test/release readiness.

- Open PR branch average: **71.1% across 9** open implementation PR branches.
- All PR-backed branch average: **75.8% across 12** PR branches, including #2/#3/#7 closed unmerged.
- All feature branch average: **71.9% across 13**, adding the superseded no-PR retarget-regression branch.
- Prior baseline: 71.8%/11 PR-backed and 67.9%/12 all feature branches. Denominators each increased by one with PR #12; three earlier PR branches are now closed but remain in the historical PR-backed average.

### Parameter approval and safety

All four parameter proposal areas were explicitly approved on 18 November 2026. The exact PoW, network identity, genesis candidate and script activation values are in `docs/FREELY-APPROVED-PROTOCOL-PARAMETERS.md`. Genesis nonce, transaction/Merkle commitment and final block hash remain derived outputs; the C++ test is queued, not passed. Production chain selection remains fail-closed. No production genesis activation, public network exposure, DNS seeds, mining deployment, paid infrastructure or launch is authorized.


---

## Live engineering refresh — 20 November 2026

This section supersedes earlier status, branch-head and CI snapshots above. Historical sections are retained as an audit trail.

### Repository identity and default branches

- Coordination repository: `Schmacko/freely-core`, default branch `main`, exact head `710c05b84f7551d00b1316eedb6d11ca077e7f1f`.
- Bitcoin Core fork repository is actually named `Schmacko/freely-bitcoin-core.` (including the trailing period), default branch `master`, exact head `498b598cf27317b7306a859ce82b0571a0f9e348`. The similarly named repository without the trailing period returns 404; do not target it.
- Pinned upstream baseline branch: `freely/upstream-v32.1` at `f0de87f040621468b956f01f526a43a010310501`.
- No workflow runs are associated with either default-branch head in the current query. PR/push workflows below are the relevant evidence.

### Current open PR inventory

All 13 open PRs are drafts. No open PR has submitted reviews or inline review threads. GitHub currently reports the open PRs as mergeable; that does not satisfy the merge gate while required CI is queued/pending.

| Repository / PR | Branch | Exact head | Estimated branch work | Exact-head workflow evidence |
|---|---|---|---:|---|
| freely-core #2 | `m1-consensus-design` | `4f287c9ff3a72bde4f654cad3911428d67bcc667` | 85% | No Actions run returned |
| bitcoin-core #1 | `freely/m1-consensus` | `06d79002573506f9311abf35ae1d70c891f0a358` | 90% | Focused C++ run 44310378703 passed; full CI 44310378640 has 28/29 jobs successful and one Windows job queued |
| bitcoin-core #4 | `freely/pow-difficulty-audit` | `08cfaff6d76ab301562badf2297756997f0ba420` | 90% | Push 44536938452 and PR CI 44536951045 queued |
| bitcoin-core #5 | `freely/retarget-policy` | `96288f5487025c0b2f71783a09c4c9021cf06b78` | 95% | Push 44313351736 and PR CI 44313365353 queued |
| bitcoin-core #6 | `freely/retarget-test-vectors` | `04554fd475b0d9a6300b6f4673870e881af26484` | 90% | Push 44615892846, focused PR 44615900434 and PR CI 44615900431 queued |
| bitcoin-core #8 | `freely/core-chain-implementation` | `003d36400c74bc58a06ae9aa12d966e1c0ef69f2` | 75% | Focused 44617396994 and PR CI 44617397075 queued |
| bitcoin-core #10 | `freely/network-safety-preflight` | `4c2c3588f2a1d40ae76976d518fa35f228f2933c` | 75% | Focused 44551102470 and PR CI 44551102352 queued |
| bitcoin-core #11 | `freely/wallet-node-readiness` | `77c55275bb716a72452f52741ff905f87fee1a48` | 70% | Current exact-head wallet workflow 44753559587 and PR CI 44753559664 queued |
| bitcoin-core #12 | `freely/reconciled-docs` | `0eef50da8c8897430841ceee62f57d8ab56ee9a3` | 95% | Focused 44551190526 and PR CI 44551190648 queued; push CI 44551866472 and 44551173884 queued |
| bitcoin-core #17 | `freely/genesis-and-network-code` | `b14ea45a6227b0f90f45c1eb6a1c2b12c3ed8c18` | 85% | Focused 44617567251 and PR CI 44617567271 pending |
| bitcoin-core #18 | `freely/genesis-miner-implementation` | `561d0947b0b7bc23491aeff9dfa0bb4f8ef64c0c` | 95% | Genesis search 44642789182 and PR CI 44642798126 queued |
| bitcoin-core #20 | `freely/chainparams-candidate-integration` | `0a41849496a7499d2650a18c01675b4dd92e04c2` | 87% | Focused 44754105862 and PR CI 44754120057 queued |
| bitcoin-core #21 | `freely/private-node-startup` | `7eb692a647b76314cc28b1e219e2e18027b2813f` | 87% | Focused 44754182149 (1 job) and PR CI 44754193506 (25 jobs) queued |

### Retained feature branches without an open PR

| Branch | Exact head | Estimated branch work | State |
|---|---|---:|---|
| freely-core `docs/freely-foundation` | `f07aab1643fef08cb918b3bf2cdaf447213f68a2` | 100% | PR #1 merged |
| `freely/chain-selection-audit` | `d4b6ad2d171764fffc25e5034e0fc7a4ec69fcc5` | 100% | PR #3 closed unmerged |
| `freely/ci-windows-safe` | `66a92038f42385f12b16ec1295d77507a5c25d88` | 100% | PR #9 closed unmerged |
| `freely/consensus-specification` | `1c839b9b8773492850a0bd82496b99b7eeb911ed` | 100% | PR #2 closed unmerged; content consolidated elsewhere |
| `freely/genesis-nonce-search` | `a4015b90c27e2dad02177d792f5ce64f12591ab6` | 100% | PR #14 closed unmerged |
| `freely/genesis-nonce-tool-integration` | `9149a0f153c23740cebf9b7fd4d4577679c850ee` | 100% | PR #16 closed unmerged |
| `freely/network-architecture` | `7157d5ce96549dc9f937fe0896e4b59e44551d70` | 100% | PR #7 closed unmerged |
| `freely/network-magic-integration-v2` | `74655cbc36450e7d8f0fe2bf3fc036e1955c879e` | 100% | PR #15 closed unmerged |
| `freely/network-magic-registration` | `8adf6cd05d819c3ae2f97ea48b1aca5f1d41119f` | 100% | PR #13 closed unmerged |
| `freely/production-pow-regression-vectors` | `2026956da81c6e0c49c6e2e0d28de921762dfdfe` | 100% | PR #19 closed unmerged |
| `freely/retarget-regression-expansion` | `3c64e8e54ef1c42c37ea416cd4b107e947fcb7ed` | 75% | Retained branch; no PR |

The inventory contains 24 retained feature branches: 13 open-PR branches and 11 retained branches without an open PR. The default branches and the upstream baseline branch are excluded from branch averages.

- Open-PR branch average: **86.1% (13 branches)**.
- All retained feature-branch average: **91.4% (24 branches)**.
- These are estimates of branch task completion, not merge, CI, build or production-readiness scores. Closed/unmerged branches remain in the all-feature average because their work still exists in the repository history; closure does not mean their code was integrated.

### Current dependency graph and synchronization

- PR #1 is 24 commits ahead of the pinned upstream branch and 0 behind.
- PR #8 is 20 commits ahead of PR #1's branch and 0 behind.
- PR #17 is 6 commits ahead of PR #8 and 0 behind.
- PR #20 is 45 commits ahead of PR #17 and 0 behind.
- PR #21 is 87 commits ahead of the current PR #20 base and 0 behind.
- PR #11 had diverged from the current PR #8 base by four commits. This run created merge commit `77c55275bb716a72452f52741ff905f87fee1a48` with the PR #11 head as first parent and PR #8's current head `003d36400c74bc58a06ae9aa12d966e1c0ef69f2` as second parent. The two base-side changed files were disjoint from PR #11's two added files. Current comparison: 14 ahead, 0 behind; the PR's two-file diff is preserved.
- PR #2 in the coordination repository is 11 commits ahead of `main`, 0 behind.
- No unresolved review threads or submitted reviews were found on any of the 13 open PRs.

### Verified changes in this run

1. PR #21: fixed `test/functional/feature_freely_startup.py`. Its initial offline test node previously omitted `-discover=0`, `-dnsseed=0` and `-listenonion=0`, which the new fail-closed validator requires. Added these and explicit `-upnp=0`, `-natpmp=0`. Commit: `e2abcb44ca44b47fabcad7e6b76a8f98a09f7fe5`.
2. PR #20: added an independent Python serializer regression for the approved 117-byte genesis coinbase, checking the transaction ID and single-transaction Merkle root. The equivalent isolated local Python unittest passed 1/1; the full repository test command on the new head remains pending. Final branch head: `0a41849496a7499d2650a18c01675b4dd92e04c2`.
3. PR #21: synchronized the private-node branch with PR #20's three new commits using merge commit `7eb692a647b76314cc28b1e219e2e18027b2813f` (PR #21 first parent; PR #20 head `0a41849496a7499d2650a18c01675b4dd92e04c2` second parent). Comparison: 87 ahead, 0 behind. The new Python coinbase/Merkle regression is now inherited by PR #21.
2. PR #11: synchronized the wallet/node readiness branch with the current core-chain base using the two-parent merge commit above. The upstream/base changes were preserved without altering the wallet readiness workflow or its document.
3. Updated PR #11 and #21 descriptions with exact heads, merge/synchronization details and pending workflow evidence.
4. This dashboard is being updated with the current branch, PR, dependency and CI inventory.

### CI evidence and merge gate

- The only successful exact-head FREELY-focused C++ evidence remains PR #1 run [44310378703](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44310378703): `test_bitcoin` compiled and `pow_tests` plus `validation_tests` passed 2/2.
- PR #1 full CI [44310378640](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44310378640) has 28/29 jobs completed successfully; the Windows msvcrt cross-built job remains queued. The full matrix is not complete.
- Current exact-head PR #20 focused workflow [44754105862](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44754105862) and full CI [44754120057](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44754120057) are queued. PR #21 focused workflow [44754182149](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44754182149) and full CI [44754193506](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44754193506) are queued. PR #11's current exact-head wallet workflow [44753559587](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44753559587) and full CI [44753559664](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44753559664) are queued. Previous PR #20/#21 head runs were cancelled after their branches advanced; none is a pass.
- No Bitcoin Core fork PR has merged. Only the initial documentation foundation PR in the coordination repository is merged.
- No PR was merged in this run. Production genesis activation, public network exposure, DNS seeds, mining deployment, paid infrastructure and public launch remain unauthorized.

### Weighted project estimate

Using the established phase weights (foundation 5%, consensus specification 15%, network architecture 10%, core implementation 25%, testing 15%, wallet/node 10%, mining 5%, security 10%, testnet 5%, production readiness 5%):

| Phase | Weight | Estimated work completion |
|---|---:|---:|
| Foundation | 5% | 100% |
| Consensus specification | 15% | 90% |
| Network architecture | 10% | 85% |
| Core implementation | 25% | 65% |
| Testing | 15% | 46% |
| Wallet/node readiness | 10% | 40% |
| Mining | 5% | 90% |
| Security | 10% | 65% |
| Testnet | 5% | 10% |
| Production readiness | 5% | 0% |
| **Weighted overall estimate** | **100%** | **65.7%** |

The previous conversation reported a rough 48.0% overall estimate without a phase breakdown. The current 65.7% is the refreshed estimate using the explicit phase weights in this dashboard, so the 17.7-point difference is not a clean like-for-like productivity delta. Work-completion estimates remain separate from verified builds, test passes, merges and production readiness.

### Next engineering actions

1. Wait for and inspect the exact-head PR #11 and #21 focused workflows; fix any deterministic failures.
2. Inspect PR #20's candidate parameter workflow and PR #17's genesis/network tests once jobs leave queued/pending.
3. Complete exact-head CI on PR #8 before considering its dependants; reconcile PR #11, #17, #20 and #21 in dependency order.
4. Re-run and verify the genesis nonce-search helper tests and C++ genesis/PoW vectors.
5. Keep production chain selection fail-closed until all consensus, genesis and network identity evidence is independently reproduced and release authorization is explicitly granted.


## Latest branch/CI delta — 20 November 2026

- PR #20 current head `0a41849496a7499d2650a18c01675b4dd92e04c2`; current push test run `44754105862` and pull-request CI `44754120057` are queued.
- PR #21 current head `7eb692a647b76314cc28b1e219e2e18027b2813f`; current push test run `44754182149` and pull-request CI `44754193506` are queued.
- PR #20's new independent coinbase/Merkle test has only an isolated local Python 1/1 reproduction so far; do not treat it as the full repository test suite or C++ verification.
- PR #21's previous exact-head runs `44752779624` and `44752791923` were cancelled after the merge synchronization. The new exact-head runs above are not passes until completed successfully.
- Branch averages now use 86.1% across 13 open-PR branches and 91.4% across all 24 retained feature branches. Weighted project estimate is 65.7% after raising testing work estimate to 46%; verification/merge/production status is unchanged.


### Coordination-branch self-update

The dashboard is maintained on the `m1-consensus-design` branch itself. After the latest dashboard commit, the current PR #2 head is `4f287c9ff3a72bde4f654cad3911428d67bcc667`, 11 commits ahead of `main` and 0 behind. The open-PR inventory above reflects this exact head; no Actions run is returned for this documentation-only update.


## Live engineering snapshot — 21 November 2026

This section supersedes the earlier 20 November snapshot above. All refs, PR heads, comparisons and workflow states below were re-read from GitHub during this run.

### Repository defaults and integration baseline

- `Schmacko/freely-core`: default branch `main`, head `710c05b84f7551d00b1316eedb6d11ca077e7f1f`.
- `Schmacko/freely-bitcoin-core.`: default branch `master`, head `498b598cf27317b7306a859ce82b0571a0f9e348`. The repository name includes a trailing period.
- Pinned Bitcoin Core v32.1 base branch: `freely/upstream-v32.1`, now at `0f27415ebe114f3e93157a4b3c95e7670012dee1`.
- PR #1 is merged into that integration branch at `0f27415ebe114f3e93157a4b3c95e7670012dee1`; it is not merged into default `master`.

### Current open PR inventory

There are 12 open PRs, all draft. GitHub currently reports each as mergeable. No submitted reviews or unresolved inline review threads were returned for the open PR inventory.

| Repository / PR | Branch | Exact head | Estimated work | Latest exact-head CI evidence |
|---|---|---|---:|---|
| freely-core #2 | `m1-consensus-design` | `cb3f53d1157ba0e023d0d267d2343fc4a33c5471` | 85% | No Actions run returned |
| bitcoin-core #4 | `freely/pow-difficulty-audit` | `92d0c7957fd054c74a195de2ba8133cabd696a18` | 90% | Full CI 44910339764 queued |
| bitcoin-core #5 | `freely/retarget-policy` | `3d5006d411ed2781985d00506c3e1a3c36675962` | 95% | Full CI 44910342400 queued |
| bitcoin-core #6 | `freely/retarget-test-vectors` | `e2d83e87ef9ec238104ed817189fd57e7abdebf1` | 90% | Focused validation 44899510249 and PoW 44899510328 passed; full CI 44899510261 queued |
| bitcoin-core #8 | `freely/core-chain-implementation` | `a0f92c088c130d56a9484ec05a0c4d7b7ed53c14` | 75% | Focused C++ 44909002120 passed; full CI 44909002234 queued |
| bitcoin-core #10 | `freely/network-safety-preflight` | `e7019df06a72c8ec37922eca34d6f4cbeefc207f` | 75% | Python preflight 44899513446 passed; full CI 44899513419 queued |
| bitcoin-core #11 | `freely/wallet-node-readiness` | `c7e34f02d06f99988fbea519334c774c2d935ffb` | 70% | Wallet readiness 44910294866 and full CI 44910294894 queued |
| bitcoin-core #12 | `freely/reconciled-docs` | `09e9de08904e3cf23996740dca94d6f0ef32d2ef` | 95% | Spec checks 44910363473 and full CI 44910363483 queued |
| bitcoin-core #17 | `freely/genesis-and-network-code` | `c237f42435ce24360586228aa702f62905b14c9f` | 85% | Focused core-chain 44909033940 passed; full CI 44909033959 queued |
| bitcoin-core #18 | `freely/genesis-miner-implementation` | `865026e755239bf0a89e7a5b91513f896bb9858a` | 95% | Genesis verification 44910736974 and full CI 44910736929 queued |
| bitcoin-core #20 | `freely/chainparams-candidate-integration` | `fb8f9efa5e817e5bafd635139e5386240ea05b67` | 87% | Candidate tests 44911934468 queued; full CI 44911934466 pending |
| bitcoin-core #21 | `freely/private-node-startup` | `e921bf801721df28b19cc68b9d7fc9c84e04f363` | 89% | Candidate tests 44912414852 queued; security tests 44912414861 pending; wallet tests 44912414901 queued; full CI 44912414892 queued |

### Retained feature branches without an open PR

| Branch | Exact head | Estimated work | State |
|---|---|---:|---|
| freely-core `docs/freely-foundation` | `f07aab1643fef08cb918b3bf2cdaf447213f68a2` | 100% | Foundation PR merged |
| `freely/chain-selection-audit` | `d4b6ad2d171764fffc25e5034e0fc7a4ec69fcc5` | 100% | PR #3 closed unmerged |
| `freely/ci-windows-safe` | `66a92038f42385f12b16ec1295d77507a5c25d88` | 100% | PR #9 closed unmerged |
| `freely/consensus-specification` | `1c839b9b8773492850a0bd82496b99b7eeb911ed` | 100% | PR #2 closed unmerged; content consolidated |
| `freely/genesis-and-network-code-rebased` | `e609e9b734c1e9165e0d8a7a3980b73d642ed215` | 90% | Retained branch; no open PR |
| `freely/genesis-nonce-search` | `a4015b90c27e2dad02177d792f5ce64f12591ab6` | 100% | PR #14 closed unmerged |
| `freely/genesis-nonce-tool-integration` | `9149a0f153c23740cebf9b7fd4d4577679c850ee` | 100% | PR #16 closed unmerged |
| `freely/m1-consensus` | `06d79002573506f9311abf35ae1d70c891f0a358` | 90% | PR #1 merged into integration baseline |
| `freely/network-architecture` | `7157d5ce96549dc9f937fe0896e4b59e44551d70` | 100% | PR #7 closed unmerged |
| `freely/network-magic-integration-v2` | `74655cbc36450e7d8f0fe2bf3fc036e1955c879e` | 100% | PR #15 closed unmerged |
| `freely/network-magic-registration` | `8adf6cd05d819c3ae2f97ea48b1aca5f1d41119f` | 100% | PR #13 closed unmerged |
| `freely/production-pow-regression-vectors` | `2026956da81c6e0c49c6e2e0d28de921762dfdfe` | 100% | PR #19 closed unmerged |
| `freely/retarget-regression-expansion` | `3c64e8e54ef1c42c37ea416cd4b107e947fcb7ed` | 75% | Retained branch; no PR |

The upstream baseline branch is excluded from feature-branch averages. There are 12 open-PR branches and 13 retained branches without an open PR: 25 retained FREELY feature branches in total.

- Open-PR branch average: **85.9% (12 branches)**.
- All retained feature-branch average: **91.4% (25 branches)**.
- Compared with the previous snapshot, the open-PR denominator fell from 13 to 12 because PR #1 merged. The all-feature denominator rose from 24 to 25 because the rebased genesis/network branch is now included. PR #1's branch remains in the all-feature average as merged work.

### Verified implementation, tests and merge progress

1. **PR #1 merged:** `freely/m1-consensus` merged into `freely/upstream-v32.1` at `0f27415ebe114f3e93157a4b3c95e7670012dee1`. Full CI [44310378640](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44310378640) completed **29/29 jobs successfully**, including Windows UCRT and msvcrt cross-built tests. Focused C++ [44310378703](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44310378703) also passed.
2. **PR #6 exact head:** validation suite [44899510249](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44899510249) compiled `test_bitcoin` and passed CTest 2/2; PoW suite [44899510328](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44899510328) passed CTest 1/1 and the BIP94 timestamp-boundary functional test. Full CI remains queued.
3. **PR #8 exact head:** focused run [44909002120](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44909002120) compiled `test_bitcoin` and passed validation/PoW CTest 2/2. Full CI remains queued.
4. **PR #10 exact head:** preflight run [44899513446](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44899513446) passed 28 unit tests and 17 production-readiness evidence tests. The evidence gate correctly remains **0/9**; preflight PASS is not production readiness.
5. **PR #17 exact head:** core-chain run [44909033940](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44909033940) compiled `test_bitcoin`, passed chain-type/genesis/validation/PoW CTest 4/4, ran the genesis nonce helper 11/11, and passed the fail-closed startup functional test. Full CI remains queued.
6. **PR #20:** inspected failed ancestor run [44909054253](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44909054253). Compilation, four C++ suites and 13 Python tests passed; functional discovery failed because an unregistered stale `feature_freely_candidate_startup.py` was present in that older tree. The stale script is absent from the current branch. Added a pull-request trigger for candidate tests; current exact-head run 44911934468 is queued and full CI 44911934466 is pending.
7. **PR #21:** added negative startup regressions for offline and loopback-private modes, a focused network-isolation workflow, and a pull-request trigger for wallet-enabled offline tests. Synchronization merge commit `df10f3e43b1789b22f5a51a7df0f0b013e1b740a` has first parent the private-node branch and second parent PR #20's current base `fb8f9efa5e817e5bafd635139e5386240ea05b67`. The branch is 21 ahead, 0 behind. Exact-head candidate, security, wallet and full CI runs are queued/pending; none is a pass yet.
8. No PR other than #1 was merged. No production parameters were activated, no public testnet/mainnet or DNS seeds were launched, and no public P2P/RPC exposure or mining deployment was performed.

### Weighted project estimate

Using the established phase weights (foundation 5%, consensus specification 15%, network architecture 10%, core implementation 25%, testing 15%, wallet/node 10%, mining 5%, security 10%, testnet 5%, production readiness 5%):

| Phase | Weight | Estimated work completion |
|---|---:|---:|
| Foundation | 5% | 100% |
| Consensus specification | 15% | 92% |
| Network architecture | 10% | 88% |
| Core implementation | 25% | 65% |
| Testing | 15% | 50% |
| Wallet/node readiness | 10% | 40% |
| Mining | 5% | 90% |
| Security | 10% | 70% |
| Testnet | 5% | 10% |
| Production readiness | 5% | 0% |
| **Weighted overall estimate** | **100%** | **67.35%** |

The previous weighted estimate was 65.7%. The 1.65-point increase reflects the merged and fully passing M1 branch plus newly verified exact-head PoW, core-chain and network-preflight test evidence. Estimated task completion remains separate from merge status, exact-head CI, release readiness and security certification. The project has **not** reached the 70% milestone.

### Current blockers and next actions

1. Obtain exact-head full CI and focused workflow results for PR #20 and PR #21; fix deterministic failures rather than treating queued or pending checks as passes.
2. Obtain full CI for PR #6, #8, #10 and #17 before considering dependency-order merges.
3. Inspect PR #11 wallet/node readiness and PR #18 genesis miner results when their focused jobs leave the queue.
4. Review the complete diffs and Bitcoin Core v32.1 compatibility before any PR merge. No PR is eligible to merge while required checks remain queued or pending.
5. Keep normal FREELY startup fail-closed. Production genesis activation, public network exposure, DNS seeds, mining deployment, paid services and launch remain separately unauthorized.


## Live engineering refresh — 26 November 2026

This snapshot supersedes prior CI and PR-status tables above where they conflict. Repository refs, PR heads, comparisons, workflow runs, job states and selected failure logs were refreshed from GitHub during this run.

### Repository and branch inventory

- `Schmacko/freely-core`: default `main` at `710c05b84f7551d00b1316eedb6d11ca077e7f1f`.
- `Schmacko/freely-bitcoin-core.`: default `master` at `498b598cf27317b7306a859ce82b0571a0f9e348`.
- Pinned integration baseline `freely/upstream-v32.1`: `0f27415ebe114f3e93157a4b3c95e7670012dee1`.
- PR #1 is merged into `freely/upstream-v32.1`, not into default `master`.
- The implementation repository now has **45 branch refs: 44 FREELY-named refs plus `master`**. The increase from the previous 43 FREELY-named refs is the new PR #25 replacement branch. The coordination repository has `docs/freely-foundation`, `m1-consensus-design` and `main`.
- There are 15 open PRs across both repositories: coordination PR #2 and implementation PRs #4–#25 (with the gaps shown in the inventory below). PR #24 is retained temporarily as superseded audit history; PR #21 remains an older alternative lineage.

### Current scored PR branches

The percentages below estimate scope completion only. They are not CI, review, merge or production-readiness scores.

| PR | Branch | Exact head | Estimate | Current state |
|---:|---|---|---:|---|
| freely-core [#2](https://github.com/Schmacko/freely-core/pull/2) | `m1-consensus-design` | `6155725d3740c3ed468fcaaa2949b6149be75cb0` | 85% | Open draft; 29 commits ahead of `main`; no Actions run associated with this head |
| [#4](https://github.com/Schmacko/freely-bitcoin-core./pull/4) | `freely/pow-difficulty-audit` | `92d0c7957fd054c74a195de2ba8133cabd696a18` | 90% | Full CI failed on CMake 4.5 `non-target-directive` diagnostics |
| [#5](https://github.com/Schmacko/freely-bitcoin-core./pull/5) | `freely/retarget-policy` | `3d5006d411ed2781985d00506c3e1a3c36675962` | 95% | Full CI failed on the same CMake 4.5 diagnostic; two matrix jobs cancelled |
| [#6](https://github.com/Schmacko/freely-bitcoin-core./pull/6) | `freely/retarget-test-vectors` | `5cbca965a9340f85631804a5fa5c827a3b79b015` | 90% | Full CI **29/29 passed**, including ancestor replay; focused retarget and M1 workflows passed; branch is 4 ahead / 25 behind upstream |
| [#8](https://github.com/Schmacko/freely-bitcoin-core./pull/8) | `freely/core-chain-implementation` | `370d4a436b7218e77de25dc296d14e01b38de589` | 75% | Focused M1 workflow passed; full CI conclusion success but ancestor-replay job was skipped (28/29); not a strict full pass |
| [#10](https://github.com/Schmacko/freely-bitcoin-core./pull/10) | `freely/network-safety-preflight` | `77106e215d5a04c4e6529650e3f8cbcb6a066e17` | 75% | Focused preflight passed; full CI has 26 successes and 3 cancelled jobs |
| [#11](https://github.com/Schmacko/freely-bitcoin-core./pull/11) | `freely/wallet-node-readiness` | `86aeb0676c3bfd81fb896177cf3baedf0a558cad` | 70% | Focused wallet/node workflow passed; full CI conclusion success but ancestor replay skipped (28/29); not a strict full pass |
| [#12](https://github.com/Schmacko/freely-bitcoin-core./pull/12) | `freely/reconciled-docs` | `9d772339ab85fc38e2d67c591999c57aee11babd` | 95% | Focused specification checks passed; full CI failed in ancestor replay and Windows configure/build; CMake 4.5 diagnostic confirmed in logs |
| [#17](https://github.com/Schmacko/freely-bitcoin-core./pull/17) | `freely/genesis-and-network-code` | `8a567e0f11a3405d62f52b4b3a7c89869f1d5ec3` | 85% | Focused core-chain workflow passed; full CI conclusion success but ancestor replay skipped (28/29); not a strict full pass |
| [#18](https://github.com/Schmacko/freely-bitcoin-core./pull/18) | `freely/genesis-miner-implementation` | `8e81ea9fbf9c0b079bad1d14e8383cd36a4912b5` | 95% | Full CI **29/29 passed**, including ancestor replay; focused genesis proof-of-work verification passed; stacked on #17 |
| [#21](https://github.com/Schmacko/freely-bitcoin-core./pull/21) | `freely/private-node-startup` | `8423e716103ca6e64373f97e4763e8c62f447d71` | 89% | Candidate, wallet and security focused workflows passed; full CI has two cancelled macOS jobs and skipped ancestor replay; stale alternative to #25 |
| [#22](https://github.com/Schmacko/freely-bitcoin-core./pull/22) | `freely/chainparams-reconciled-20261122` | `87e494b444889ae5aacd6b35fdd2313ed115115e` | 92% | Focused core-chain workflow passed; full CI retry queued with ancestor replay passed, macOS native queued and macOS native-fuzz cancelled |
| [#23](https://github.com/Schmacko/freely-bitcoin-core./pull/23) | `freely/ci-cmake-4-5-compat` | `250d6657da43967240dacec246a45159bfc6cbb3` | 95% | Independent CMake 4.5 CI fix; 27 matrix jobs succeeded, macOS native-fuzz retry queued and Alpine (musl) cancelled; no full pass |
| [#25](https://github.com/Schmacko/freely-bitcoin-core./pull/25) | `freely/private-node-integration-squashed-20261126` | `e46167bc48b2037fe8e368e7c64ce2ec5bdbb830` | 85% | New draft replacement for #24; two commits ahead / zero behind #22; full CI and focused security/wallet workflows are pending or in progress |

Superseded PR #24 remains open only for audit traceability at head `0437c8e68ca36bd165331c10412c9160ae06af95` (estimated 85%). Its focused security and wallet workflows passed, but full CI failed ancestor replay at intermediate commit `ebc45da690c463f1b1253eba055782d23ffbc334`. Do not merge #24; PR #25 is its replacement.

### Exact workflow evidence

- PR #6 full CI [45034083216](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45034083216): 29/29 successful, including ancestor replay.
- PR #8 full CI [45028307701](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028307701): 28 successful plus skipped ancestor replay.
- PR #11 full CI [45028317116](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028317116): 28 successful plus skipped ancestor replay.
- PR #17 full CI [45028325268](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45028325268): 28 successful plus skipped ancestor replay.
- PR #18 full CI [45204040649](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45204040649): 29/29 successful, including ancestor replay.
- PR #22 full CI [45413263894](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45413263894): retry active; macOS native queued, macOS native-fuzz cancelled, ancestor replay successful.
- PR #23 full CI [45204795368](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45204795368): 27 successes; macOS native-fuzz queued and Alpine cancelled. The macOS retry was accepted; the Alpine retry was blocked while the workflow run was active.
- PR #25 full CI [45832040012](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45832040012): latest head `e46167bc48b2037fe8e368e7c64ce2ec5bdbb830`; ancestor replay is now running because the branch has a second commit. Focused private-node security [45832040167](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45832040167) and offline-wallet [45832039994](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45832039994) are in progress. No new-head pass is claimed.
- PR #4 [44910339764](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44910339764), #5 [44910342400](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/44910342400) and #12 [45206228485](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45206228485) logs confirm CMake 4.5's `non-target-directive` diagnostic is promoted to an error by `-Werror=dev` in vendored secp256k1 configuration. PR #23 scopes a compatibility suppression to this diagnostic while retaining the other warning-as-error policy; its complete matrix is still incomplete.
- PR #10 [45206108420](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45206108420) has three cancelled jobs, including macOS native and ancestor replay. PR #21 [45428003881](https://github.com/Schmacko/freely-bitcoin-core./actions/runs/45428003881) has two cancelled macOS jobs and skipped ancestor replay.

Under the project's strict policy, queued, pending, cancelled and skipped jobs are not passes. Only PRs #6 and #18 currently have fully successful 29/29 matrices including ancestor replay. The apparent success conclusion on #8, #11 and #17 is not a complete strict pass because the ancestor job was skipped for their one-commit PRs.

### PR #25 replacement and code review notes

PR #24's ancestor-replay failure was traced to an intermediate commit that introduced the default-on NAT-PMP guard before all test fixtures were updated. The final tree contained the corrections, but replaying that intermediate commit failed. Rather than weakening CI, a new branch was created with a single complete snapshot commit `1836cb737f825f4a7715dc4ef8e41c5559cf51cf`, followed by IPv6 loopback-binding regression test commit `e46167bc48b2037fe8e368e7c64ce2ec5bdbb830`. The duplicate `-natpmp=0` fixture assignment was removed.

The 16-file replacement diff was reviewed across chain selection, startup validation, runtime `addnode`, wallet/key encodings, functional tests, PoW/BIP94 vectors and CI workflows. The security model remains:
- ordinary FREELY startup fails closed unless exactly one development gate is explicit;
- offline mode disables inbound/outbound peers and external discovery/port mapping;
- private mode binds only literal IPv4/IPv6 loopback addresses and restricts runtime peers to loopback;
- proxy/overlay, remote RPC, external discovery and ZMQ publish paths are rejected;
- candidate genesis and consensus values remain candidate-only and production startup is not activated.

No unresolved inline review threads were returned for implementation PRs #4–#25. Submitted review objects were empty on #22, #23 and #25 at this inspection. PR #25 remains draft; no merge was performed.

### Completion estimates and denominator discipline

The established phase weights and estimates remain unchanged because this run added validation and a replacement/test commit but did not complete a new implementation milestone:

| Phase | Estimate | Weight |
|---|---:|---:|
| Foundation | 100% | 5% |
| Consensus specification | 92% | 15% |
| Network architecture | 88% | 10% |
| Core implementation | 65% | 25% |
| Testing | 50% | 15% |
| Wallet/node readiness | 45% | 10% |
| Mining | 90% | 5% |
| Security | 75% | 10% |
| Testnet | 10% | 5% |
| Production readiness | 0% | 5% |
| **Weighted overall estimate** | **68.35%** | **100%** |

- Scored PR-branch mean: **86.9% (14 branches)**. PR #25 replaces #24 in this denominator; #24 is excluded as superseded. The still-open but stale #21 alternative remains included for continuity with the prior 14-branch baseline.
- Historical all-feature-branch scored mean: **91.4% (25 scored branches)**. The implementation repository has 44 FREELY-named refs; 19 retained/snapshot refs are unscored. This is not a claim that every branch ref is 91.4%.
- The prior baseline was 86.9% across 14 PR branches and 91.4% across 25 scored feature branches. Denominators are unchanged for scored workstreams; the #24 → #25 replacement is not double-counted.
- Default branches and `freely/upstream-v32.1` are excluded from feature-branch averages.

### Work completed in this run

1. Re-inspected both repository defaults, branch refs, all open PR heads, ancestry comparisons, workflow runs, job results and available review threads.
2. Inspected full-CI job logs and confirmed the shared CMake 4.5 diagnostic affecting PRs #4, #5 and #12.
3. Replaced the transient 10-commit PR #24 history with PR #25's one-commit snapshot branch to avoid weakening ancestor-replay CI; removed the duplicate NAT-PMP fixture assignment.
4. Added a unit regression proving that the loopback-private mode accepts an explicit IPv6 loopback binding. PR #25 now has two commits so ancestor replay is exercised rather than skipped.
5. Updated PR #24 and PR #25 descriptions with the exact replacement lineage, SHAs and validation evidence.
6. Retried PR #23's macOS native-fuzz job and PR #22's macOS native job. The remaining Alpine and macOS native-fuzz retries are still blocked by active/cancelled workflow state and need another attempt when the run is idle.
7. No PR was merged and no public or production network action was taken.

### Next actions

1. Let PR #25's exact-head full CI, ancestor replay, security and wallet jobs finish; inspect every failure log and correct deterministic defects.
2. Retry PR #23's Alpine (musl) job and finish its complete 29-job matrix before considering the independent CMake compatibility fix.
3. Complete PR #22's remaining macOS native-fuzz job.
4. Once PR #23 is fully green, rebase/revalidate PRs #4, #5 and #12 on the compatible CI baseline.
5. Reconcile PR #6's 25-commit divergence before merge consideration.
6. Treat PR #8, #11 and #17 as incomplete until their skipped ancestor checks are replaced by actual successful required checks.
7. Preserve fail-closed production startup. Do not select or activate unapproved powLimit/genesis/initial difficulty/network identity/activation parameters, publish DNS seeds, launch public testnet/mainnet, deploy mining, pay for infrastructure or expose public services.
