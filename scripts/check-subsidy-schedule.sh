#!/usr/bin/env bash
# Independent arithmetic check for the proposed Bitcoin-style FLY subsidy.
# Run with: bash scripts/check-subsidy-schedule.sh
set -euo pipefail

INITIAL_SUBSIDY_BASE_UNITS=5000000000
HALVING_INTERVAL=210000
EXPECTED_TOTAL_BASE_UNITS=2099999997690000
EXPECTED_LAST_NONZERO_ERA=32

total=0
last_nonzero_era=-1

for ((era=0; era<64; era++)); do
  subsidy=$(( INITIAL_SUBSIDY_BASE_UNITS >> era ))
  if (( subsidy == 0 )); then
    break
  fi
  last_nonzero_era=$era
  era_total=$(( subsidy * HALVING_INTERVAL ))
  total=$(( total + era_total ))
  printf 'Era %2d: subsidy=%10d base units; issuance=%15d base units\n' \
    "$era" "$subsidy" "$era_total"
done

printf '\nTotal issuance: %d base units\n' "$total"
printf 'Total issuance: %d.%08d FLY\n' "$(( total / 100000000 ))" "$(( total % 100000000 ))"
printf 'Last nonzero subsidy era: %d\n' "$last_nonzero_era"

if (( total != EXPECTED_TOTAL_BASE_UNITS )); then
  echo "FAIL: cumulative issuance does not match expected value." >&2
  exit 1
fi
if (( last_nonzero_era != EXPECTED_LAST_NONZERO_ERA )); then
  echo "FAIL: last nonzero subsidy era does not match expected value." >&2
  exit 1
fi

# Check exact block-height boundaries as well as cumulative issuance.
subsidy_at_height() {
  local height="$1"
  local halvings
  if (( height < 0 )); then
    return 1
  fi
  halvings=$(( height / HALVING_INTERVAL ))
  if (( halvings >= 64 )); then
    printf '0'
  else
    printf '%d' "$(( INITIAL_SUBSIDY_BASE_UNITS >> halvings ))"
  fi
}

while read -r height expected; do
  actual="$(subsidy_at_height "$height")"
  if [[ "$actual" != "$expected" ]]; then
    printf 'FAIL: height %d expected %d base units, got %d.\n' "$height" "$expected" "$actual" >&2
    exit 1
  fi
done <<'BOUNDARIES'
0 5000000000
209999 5000000000
210000 2500000000
419999 2500000000
420000 1250000000
630000 625000000
1260000 78125000
6720000 1
6930000 0
BOUNDARIES

echo "PASS: cumulative issuance and all selected subsidy boundaries match."
