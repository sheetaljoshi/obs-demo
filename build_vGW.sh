#!/bin/bash

cd "$(dirname "$0")"

[ ! -f transmitter.tgz ] && wget https://www.dropbox.com/s/ewle8m0tvnrqygi/transmitter.tgz
tar -zxvf transmitter.tgz
qemu-img convert -f vmdk -O qcow2 ./Users/tomchris/Development/video-stream/Transmitter.vmwarevm/Transmitter-disk1.vmdk vGW.qcow2
mkdir -p /var/images/
mv vGW.qcow2 /var/images/
