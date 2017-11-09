# -*- mode:  -*-
# vi: set ft=ruby :

$wanbr_vmnet = 'vmnet10'

$script = <<SCRIPT
# Update apt and get dependencies
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y unzip curl wget vim git qemu-kvm libvirt-bin \
apt-transport-https \
    ca-certificates \
    software-properties-common
SCRIPT


$brwan3_vmnet = 'vmnet3'
$brwan4_vmnet = 'vmnet4'

Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.ssh.forward_agent = true

  # Begin SDP
  config.vm.define "scmpod", primary: true do |c|
    c.vm.hostname = "scmpod"
    #c.vm.network "public_network", bridge: "en1: Wi-Fi (AirPort)"
    c.vm.provider "vmware_fusion" do |v|
      v.gui = true
      v.customize [
        "modifyvm", :id,
        "--cableconnected1", "on",
         "--rtcuseutc", "on"
      ]
      v.vmx["name"] = "scmpod"
      v.vmx["numvcpus"] = "2"
      v.vmx["memsize"] = "2048"
      v.vmx["vhv.enable"] = "TRUE"

      v.vmx["ethernet1.present"] = "TRUE"
      v.vmx["ethernet1.connectionType"] = "custom"
      v.vmx["ethernet1.virtualDev"] = "e1000"
      v.vmx["ethernet1.wakeOnPcktRcv"] = "FALSE"
      v.vmx["ethernet1.addressType"] = "generated"
      v.vmx["ethernet1.displayname"] = "eth1"
      v.vmx["ethernet1.vnet"] = "#{$wanbr_vmnet}"

    end
      c.vm.provision "shell", inline: $script, privileged: true
      c.vm.synced_folder ".", "/root/vagrant", privileged: true

  end
end
