#!/usr/bin/env bash
set -eo pipefail

# Confirm this is an AWS-EC2 machine using ping
if curl -s http://169.254.169.254/latest/ --max-time 1 &> /dev/null; then
  USER_DATA=$(/bin/curl -s http://169.254.169.254/latest/user-data)

  # check if it's valid JSON
  if $(echo $USER_DATA | /bin/jq '.' &> /dev/null); then
    # It's valid
    QUERY=$(echo $USER_DATA | /bin/jq -r ".$1" || true)
    if [ -z "$QUERY" ]; then
      echo $QUERY
      exit 0
    fi
  fi
fi

# This isn't an ec2-machine or the user info didn't include the query
# we therefore look for the default in /srv/user-data/$1 o exirt with 1
FALLBACK="/srv/user-data/$1"
if $(test -e "$FALLBACK"); then
  cat $FALLBACK
  exit 0
else
  exit 1
fi
