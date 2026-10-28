#!/usr/bin/env bash
# Run nixos-rebuild with the full output recorded to /var/log/nixos-rebuild.log
# so a failed rebuild is readable afterwards (nixos-rebuild's own output never
# Log access is granted by hosts/duck/modules/agents.nix.
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

# Readable by the agent's group on every exit path — an aborted or killed
# rebuild is precisely the case this log exists for, so the hand-off cannot be
# the last statement in the script. Harmless if the file is missing.
trap 'chgrp argo-logs "${log}" 2>/dev/null && chmod 0640 "${log}"' EXIT

# Rotate newest-last: .9 -> .10, ... .1 -> .2, log -> .1. Keeps the current log
# plus `keep` old runs (11 files).
for i in $(seq $((keep - 1)) -1 1); do
  [[ -f ${log}.${i} ]] && mv -f -- "${log}.${i}" "${log}.$((i + 1))"
done
[[ -f ${log} ]] && mv -f -- "${log}" "${log}.1"

# The group does not exist on the very first run, before this config is
# activated; fall back to root:root there and let the EXIT trap upgrade it.
if getent group argo-logs >/dev/null; then
  install -m 0640 -o root -g argo-logs /dev/null "${log}"
else
  install -m 0640 -o root -g root /dev/null "${log}"
fi

printf '===== rebuild start %s host=%s =====\n' "$(date -Is)" "${host}" >>"${log}"

cd -- "${repo_root}" || exit 2
/run/current-system/sw/bin/nixos-rebuild switch --flake ".#${host}" 2>&1 | tee -a "${log}"
rc=${PIPESTATUS[0]}

printf '===== rebuild end %s host=%s exit=%d =====\n' "$(date -Is)" "${host}" "${rc}" >>"${log}"
# Ownership/permissions are handled by the EXIT trap above.

if [[ ${rc} -eq 0 ]]; then
  echo "nixos-rebuild-logged: switch OK   (full log: ${log})"
else
  echo "nixos-rebuild-logged: switch FAILED rc=${rc}   (full log: ${log})" >&2
fi
exit "${rc}"
