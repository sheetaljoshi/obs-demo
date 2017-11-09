#!/bin/bash

br=$1

if [ -z "$br" ]; then
	echo "Virtual bridge name must be specified"
	exit 1
fi

sudo virsh net-destroy $br
exit 0
