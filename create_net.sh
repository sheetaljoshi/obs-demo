#!/bin/bash

bridge=$1
nic=$2
tap=$3

if [ -z "$bridge" ]; then
	echo "Bridge name must be specified."
	exit 1
fi

if [ -z "$tap" ]; then
	echo "Tap name must be specified."
	exit 1
fi

if [ -z "$nic" ]; then
	echo "NIC name must be specified."
	exit 1
fi

nicip=`ifconfig $nic | grep "inet " | awk '{ print substr($2,1) }'`
if [ -z "$nicip" ]; then
	echo "NIC $nic does not have IP assigned"
	exit 1
fi

ip link add $bridge type bridge
ip addr flush dev $nic
ip link set $nic master $bridge
ip tuntap add mode tap $tap
ip link set $tap master $bridge
ip link set dev $bridge up
ip link set dev $tap up

exit 0
