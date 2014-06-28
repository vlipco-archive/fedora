#!/usr/bin/env bash
set -eo pipefail

HOSTNAME=$(/usr/local/bin/user-data hostname || true)

if [ -z "$HOSTNAME" ]; then
  echo Setting hostname to $HOSTNAME
  /bin/hostname $HOSTNAME
  echo "Writing hostname to /etc/hostname"
  echo $HOSTNAME > /etc/hostname
fi