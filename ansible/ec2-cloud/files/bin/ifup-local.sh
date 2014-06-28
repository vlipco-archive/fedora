#!/usr/bin/env bash
set -eo pipefail

# Script for multiple EIPs on a single ENI on ec2
# Confirm this is an AWS-EC2 machine using ping
if curl -s http://169.254.169.254/latest/ --max-time 1 &> /dev/null; then
	MAC_ADDR=$(ifconfig $1 | sed -n 's/.*ether \([a-f0-9:]*\).*/\1/p')
	IP=($(curl http://169.254.169.254/latest/meta-data/network/interfaces/macs/$MAC_ADDR/local-ipv4s))

	for ip in ${IP[@]:1}; do
	    ip addr add dev eth0 $ip/24
	done
else
	echo "Not an EC2 machine, skipping ifup-local"
fi
