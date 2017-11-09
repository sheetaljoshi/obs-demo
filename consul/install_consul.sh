#!/usr/bin/env bash
set -e
 
echo "Fetching Consul..."
CONSUL=1.0.0
cd /tmp
#wget https://releases.hashicorp.com/consul/${CONSUL}/consul_${CONSUL}_linux_amd64.zip -O consul.zip
wget https://releases.hashicorp.com/consul/1.0.0/consul_1.0.0_darwin_amd64.zip -O consul.zip
#wget https://github.com/hashicorp/consul/blob/master/terraform/shared/scripts/rhel_consul.service -O consul.service
 
echo "Installing Consul..."
unzip consul.zip >/dev/null
chmod +x consul
sudo mv consul /usr/local/bin/consul
sudo mkdir -p /var/consul
mkdir -p /etc/consul.d/server
