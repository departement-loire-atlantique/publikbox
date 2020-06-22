# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "cg44/publikbox"

  # Forwarded ports
  config.vm.network "forwarded_port", guest: 80, host: 80, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 443, host: 443, host_ip: "127.0.0.1"

  config.vm.provider "virtualbox" do |vb|
    # the machine name
    vb.name = "publikbox"

    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true
  
    # Customize the amount of memory on the VM:
    # vb.memory = "1024"
  end
  
  # Disabling the default /vagrant
  config.vm.synced_folder ".", "/vagrant", disabled: true

end
