#!/usr/bin/env bash
set -eo pipefail

HOSTNAME="$(user-data hostname)"

if [[ -n "$HOSTNAME" ]]; then
  echo Setting hostname to $HOSTNAME
  /bin/hostname $HOSTNAME
  echo "Writing hostname to /etc/hostname"
  echo $HOSTNAME > /etc/hostname
fi