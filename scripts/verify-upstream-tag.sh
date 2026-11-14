#!/usr/bin/env bash
set -euo pipefail

TAG="${1:-v32.1}"
REPO_DIR="${2:-.}"

if ! command -v git >/dev/null 2>&1; then
  echo "ERROR: git is not installed." >&2
  exit 1
fi

if ! git -C "$REPO_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "ERROR: $REPO_DIR is not a Git working tree." >&2
  exit 1
fi

if ! git -C "$REPO_DIR" show-ref --tags --verify --quiet "refs/tags/$TAG"; then
  echo "ERROR: tag $TAG is not present locally. Fetch it from the official upstream first." >&2
  exit 1
fi

echo "Verifying signed tag: $TAG"
echo "Repository: $(git -C "$REPO_DIR" remote get-url origin 2>/dev/null || echo 'origin URL unavailable')"
git -C "$REPO_DIR" verify-tag "$TAG"

echo
echo "Tag signature verification command succeeded."
echo "Resolved commit: $(git -C "$REPO_DIR" rev-parse "$TAG^{commit}")"
echo
echo "IMPORTANT: confirm the signer's full key fingerprint independently."
echo "A mathematically valid signature is not sufficient unless the signing key is trusted."
