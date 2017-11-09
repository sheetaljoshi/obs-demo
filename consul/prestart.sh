#!/bin/bash

source /etc/default/consul

if [ -z "$DOMAIN" ]; then
  echo "Environment variable DOMAIN must be set."
  exit 1
fi

if [ -z "$DATACENTER" ]; then
  echo "Environment variable DATACENTER must be set."
  exit 1
fi

if [ -z "$CONSUL_NET_BIND" ]; then
  echo "Environment variable CONSUL_NET_BIND must be set."
  exit 1
fi

echo "Checking for existing DNS/DHCP Servers on the machine...."
COUNT=`ps -ef | grep dnsmasq | grep -v grep | wc -l`
if [ "$COUNT" != "0" ]; then
  echo "Other DNS servers are found running on this machine, stopping dnsmaq processes already running on this machine.."
  echo "Disabling default libvirt networks default ...."
  #virsh net-destroy default
fi

BIND=`ifconfig $CONSUL_NET_BIND | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'` 
echo "Binding Consul to $BIND"

HOST=`hostname`
DNSSERVERS=""
for ds in `cat /etc/resolv.conf | grep "nameserver" | cut -d ' ' -f2 |tac`; do
  if [ -z "$DNSSERVERS" ]; then
    DNSSERVERS="\"$ds\""
  else
    if [ "$ds" != "$BIND" ]; then
      DNSSERVERS="$DNSSERVERS,\"$ds\""
    fi
  fi
done


mkdir -p /var/data

WDIR=/root/obs-demo/consul

mkdir -p /etc/consul.d/server

cp $WDIR/config.json /etc/consul.d/server/config.json
sed -i "s/__HOST_IP__/$BIND/g" /etc/consul.d/server/config.json
sed -i "s/__DNS_SERVERS__/$DNSSERVERS/g" /etc/consul.d/server/config.json
sed -i "s/__HOST_NAME__/$HOST/g" /etc/consul.d/server/config.json
sed -i "s/__HOST_DC__/$DATACENTER/g" /etc/consul.d/server/config.json
sed -i "s/__HOST_DOMAIN__/$DOMAIN/g" /etc/consul.d/server/config.json
