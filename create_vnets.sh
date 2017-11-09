#!/bin/bash

cd "$(dirname "$0")"

#delete networks if already present
virsh net-destroy proscm
virsh net-destroy tenscm
virsh net-destroy gw


#create networks
virsh net-create --file provider-net.xml
virsh net-create --file tenant-net.xml
virsh net-create --file gateway-net.xml
