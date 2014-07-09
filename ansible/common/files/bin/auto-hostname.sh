#!/usr/bin/bash
set -eo pipefail

# if the current hostname has localhost in it
# we set a random one by default
# required words pkg

if cat /etc/hostname | grep -qG localhost; then
	random_word="$(shuf -n1 /usr/share/dict/words | tr [A-Z] [a-z] | cut -c 1-5)"
	random_number="$(seq 9 | shuf | head -n2 | tr -d "\\n")"
	random_hostname="${random_word}-${random_number}"
	echo "Setting random hostname to avoid localhost as hostname"
	echo $random_hostname > /etc/hostname
	hostname $random_hostname
fi