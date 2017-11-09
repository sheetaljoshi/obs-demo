#!/usr/bin/env bash
set -e
 
echo "Installing dependencies..."
if [ -x "$(command -v apt-get)" ]; then
  sudo apt-get update -y
  sudo apt-get install -y unzip
else
  sudo yum update -y
  sudo yum install -y unzip wget
fi
 
 
echo "Fetching Consul..."
CONSUL=0.7.5
cd /tmp
wget https://releases.hashicorp.com/consul/${CONSUL}/consul_${CONSUL}_linux_amd64.zip -O consul.zip
#wget https://github.com/hashicorp/consul/blob/master/terraform/shared/scripts/rhel_consul.service -O consul.service
 
echo "Installing Consul..."
unzip consul.zip >/dev/null
chmod +x consul
sudo mv consul /usr/local/bin/consul
sudo mkdir -p /var/consul
