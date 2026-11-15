# GitHub Actions — FREELY baseline build

## Purpose

This workflow provides a remote, repeatable build of the **unchanged** Bitcoin Core v32.1 source. It is a development baseline only; it does not build FREELY consensus changes, start a node, mine blocks, expose RPC, or download blockchain data.

Workflow: [FREELY upstream baseline build](../.github/workflows/freely-upstream-build.yml)

## Cost and permission controls

- The repository is public. GitHub documents standard GitHub-hosted runner use as free for public repositories. This workflow uses only the standard `ubuntu-24.04` runner, never a larger runner.
- It has a 60-minute job timeout and compiles with two parallel jobs.
- It uses no Actions cache, package publishing, deployment, or artifact upload, avoiding those additional usage/storage paths.
- The workflow is manual-only (`workflow_dispatch`); it has no push, pull-request, schedule, or release trigger.
- A required boolean input defaults to `false`. The build job is skipped unless the person manually starting the workflow explicitly sets `run_build=true`.
- The workflow requests only `contents: read`. It uses no repository secrets, write token, or pull-request permissions.
- It downloads the upstream maintainer public key, checks its primary fingerprint against the fingerprint published on the official Bitcoin Core download page, and then requires Git's signed-tag verification to succeed for `v32.1`.
- No workflow has been run as part of adding this file.

Public repository runner billing reference: https://docs.github.com/en/actions/concepts/billing-and-usage

## Activation

1. Review this workflow in the FREELY pull request.
2. Merge the pull request into `main` only after you approve it. A `workflow_dispatch` workflow must exist on the default branch before it can be manually dispatched. The pull request is intentionally not merged by this workflow.
3. In GitHub, open **Actions → FREELY upstream baseline build → Run workflow**.
4. Select the `main` branch, set `run_build` to `true`, and start it.
5. Review the run logs. A successful compile is not a security audit and does not establish that FREELY itself is ready for launch.

## Trust anchor

The expected primary-key fingerprint is:

```
E777 299F C265 DD04 7930 70EB 944D 35F9 AC3D B76A
```

Bitcoin Core's official download page publishes this fingerprint. The GitHub v32.1 release identifies the tag signer by key ID `2EEB9F5CC09526C1`. The workflow checks the imported key's primary fingerprint, then verifies the tag signature and checks that the expected signer key ID appears in the verification output.

Official references:

- https://bitcoincore.org/en/download/
- https://github.com/bitcoin/bitcoin/releases/tag/v32.1
- https://github.com/bitcoin-core/guix.sigs/blob/main/builder-keys/fanquake.gpg

## Limitations

- The repository's Actions-enabled setting and billing budget controls cannot be confirmed through the available GitHub connection. The repository is confirmed public and the connected GitHub identity has repository admin/push permissions. A repository administrator can inspect **Settings → Actions → General** before activation.
- GitHub-hosted runner availability can still be affected by GitHub service limits or account policy.
- This baseline compiles upstream source only. FREELY-specific consensus implementation comes later.
