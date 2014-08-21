#!/usr/bin/bash
set -eo pipefail
if test -e /etc/ferm/ferm.conf; then
	echo "Flushing IPtables"
	iptables -F

	echo "Loading ferm rules with Flush option"
	ferm --flush /etc/ferm/ferm.conf

	echo "Saving iptables"
	iptables-save > /etc/sysconfig/iptables
	exit 0
else
	echo "No /etc/ferm/ferm.conf was found"
	exit 1
fi