#!/bin/bash

cd "$(dirname "$0")"

#delete networks if already present
virsh net-destroy proscm
virsh net-destroy tenscm
virsh net-destroy gw
