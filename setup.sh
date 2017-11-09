#!/bin/bash

apt-get update 
apt-get install git

echo 'deb-src http://in.archive.ubuntu.com/ubuntu/ xenial universe' >> /etc/apt/source.list
apt-get update

#install vagrant and libvirt dependencies
apt-get build-dep vagrant ruby-libvirt
apt-get install qemu libvirt-bin ebtables dnsmasq
apt-get install libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev
sudo apt-get remove vagrant
rm -r ~/.vagrant.d
wget https://releases.hashicorp.com/vagrant/1.8.5/vagrant_1.8.5_x86_64.deb
dpkg -i vagrant_1.8.5_x86_64.deb
vagrant plugin install vagrant-libvirt

#install ansible 
apt-get install software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install ansible
