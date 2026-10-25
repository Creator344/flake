#!/usr/bin/env bash
# Run nixos-rebuild with the full output recorded to /var/log/nixos-rebuild.log
# so a failed rebuild is readable afterwards (nixos-rebuild's own output never
# reaches the journal). Log access is granted by hosts/duck/agents.nix.
#
# Usage: just rlog   (i.e. sudo bash scripts/nixos-rebuild-logged.sh [host])
set -uo pipefail

if [[ ${EUID} -ne 0 ]]; then
  echo "nixos-rebuild-logged: must run as root — use 'just rlog'" >&2
  exit 2
fi

if [[ $(uname -s) != Linux ]]; then
  echo "nixos-rebuild-logged: NixOS only; on macOS use 'just r'" >&2
  exit 2
fi

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
host=${1:-$(uname -n)}
log=/var/log/nixos-rebuild.log
keep=10

# Rotate newest-last: .9 -> .10, ... .1 -> .2, log -> .1 (keeps `keep` runs).
for i in $(seq $((keep - 1)) -1 1); do
  [[ -f ${log}.${i} ]] && mv -f -- "${log}.${i}" "${log}.$((i + 1))"
done
[[ -f ${log} ]] && mv -f -- "${log}" "${log}.1"

# Created root-owned; group is fixed up below once `argo-logs` exists (it does
# not on the very first run, before this config is activated).
install -m 0640 -o root -g root /dev/null "${log}"

printf '===== rebuild start %s host=%s =====\n' "$(date -Is)" "${host}" >>"${log}"

cd -- "${repo_root}" || exit 2
/run/current-system/sw/bin/nixos-rebuild switch --flake ".#${host}" 2>&1 | tee -a "${log}"
rc=${PIPESTATUS[0]}

printf '===== rebuild end %s host=%s exit=%d =====\n' "$(date -Is)" "${host}" "${rc}" >>"${log}"
chgrp argo-logs "${log}" 2>/dev/null || true
chmod 0640 "${log}"

if [[ ${rc} -eq 0 ]]; then
  echo "nixos-rebuild-logged: switch OK   (full log: ${log})"
else
  echo "nixos-rebuild-logged: switch FAILED rc=${rc}   (full log: ${log})" >&2
fi
exit "${rc}"
