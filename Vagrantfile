# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "departement-loire-atlantique/publikbox"

  # Forwarded ports
  config.vm.network "forwarded_port", guest: 80, host: 80, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 443, host: 443, host_ip: "127.0.0.1"

  config.vm.provider "virtualbox" do |vb|
    # the machine name
    vb.name = "publikbox" 
  end
  
  # Disabling the default /vagrant
  config.vm.synced_folder ".", "/vagrant", disabled: true

end
