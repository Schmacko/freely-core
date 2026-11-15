#!/usr/bin/env bash
set -u

printf '%s\n' "=== FREELY environment check (read-only) ==="
printf 'Date (UTC): '; date -u '+%Y-%m-%dT%H:%M:%SZ' 2>/dev/null || echo unavailable
printf 'Directory: '; pwd
printf '\n%s\n' "=== Operating system ==="
uname -a 2>/dev/null || true
if [ -r /etc/os-release ]; then
  sed -n '1,8p' /etc/os-release
fi

printf '\n%s\n' "=== Git repository ==="
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git status --short --branch
  git remote -v
else
  echo "Not inside a Git working tree."
fi

printf '\n%s\n' "=== Available tools ==="
for tool in git cmake gcc g++ make ninja python3 pkg-config; do
  if command -v "$tool" >/dev/null 2>&1; then
    printf '%-12s %s\n' "$tool" "$(command -v "$tool")"
  else
    printf '%-12s %s\n' "$tool" "not found"
  fi
done

printf '\n%s\n' "=== Resources ==="
if command -v nproc >/dev/null 2>&1; then printf 'CPU cores: '; nproc; fi
if [ -r /proc/meminfo ]; then
  awk '/MemTotal:/ {printf "Memory: %.1f GiB\n", $2/1048576}' /proc/meminfo
fi
printf '\n%s\n' "Check complete. No packages installed and no files changed."
