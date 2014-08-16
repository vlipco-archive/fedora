#!/usr/bin/env bash
set -eo pipefail
# Confirm this is an AWS-EC2 machine using ping
if curl -sL http://169.254.169.254/latest/ --max-time 1 &> /dev/null; then
  USER_DATA="$(curl -sL http://169.254.169.254/latest/user-data)"
  # check if it's valid JSON
  if $(echo $USER_DATA | jq '.' &> /dev/null); then
    # It's valid
    QUERY="$(echo $USER_DATA | jq -r ".$1" || true)"
    if [[ -n "$QUERY" ]]; then
      echo $QUERY
      exit 0
    fi
  fi
fi
