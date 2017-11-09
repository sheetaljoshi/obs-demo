#!/bin/bash

file=$1

if [ -z "$file" ]; then
	echo "Filename must be specified"
	exit 1
fi

virsh net-create --file $file

exit 0
