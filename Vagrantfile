# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "cg44/publikbox"

  # Forwarded ports
  config.vm.network "forwarded_port", guest: 443, host: 4040, host_ip: "127.0.0.1"

  config.vm.provider "virtualbox" do |vb|
    # the machine name
    vb.name = "publikbox" 
  end
  
  # Disabling the default /vagrant
  config.vm.synced_folder ".", "/vagrant", disabled: true

end
