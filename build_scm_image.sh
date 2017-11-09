#!/bin/bash

cd "$(dirname "$0")"
[ ! -f reciever.ova ] && wget https://www.dropbox.com/s/ttn1peerrwcr0ok/reciever.ova
tar -xvf reciever.ova
qemu-img convert -f vmdk -O qcow2 ./reciever-disk1.vmdk reciever.qcow2
mkdir -p /var/images/
cp reciever.qcow2 /var/images/proscm.qcow2
cp reciever.qcow2 /var/images/tenscm.qcow2

