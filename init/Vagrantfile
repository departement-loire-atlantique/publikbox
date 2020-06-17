# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/buster64"

  # Forwarded ports
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 443, host: 4040, host_ip: "127.0.0.1"

  config.vm.provider "virtualbox" do |vb|
    # the machine name
    vb.name = "publikbox"

    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true
  
    # Customize the amount of memory on the VM:
    # vb.memory = "1024"
  end

  # Configure the environnement
  config.vm.provision "shell", path: "configure.sh" 

  # install publikb
  config.vm.provision "shell", path: "install.sh" 

end
