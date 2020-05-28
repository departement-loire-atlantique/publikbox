#!/bin/sh

# install publik on EO way

# exit if error
set -e

if getent passwd publik > /dev/null 2>&1; then
    echo "Skip : user publik already exists"
else
    # create publik user as sudoer
    sudo useradd -m publik --groups sudo --shell /bin/bash
    #sudo passwd publik
    sudo echo 'publik:publik' | sudo chpasswd
fi

# commands to install publik

[ -d /home/publik/publik-devinst ] || sudo runuser -l publik -c 'git clone https://git.entrouvert.org/publik-devinst.git'
sudo runuser -l publik -c 'ansible-playbook -K -i /home/publik/publik-devinst/inventory.yml /home/publik/publik-devinst/install.yml -e "ansible_sudo_pass=publik ansible_python_interpreter=/usr/bin/python3"'
sudo runuser -l publik -c 'ansible-playbook -i /home/publik/publik-devinst/inventory.yml /home/publik/publik-devinst/deploy-tenants.yml -e "ansible_sudo_pass=publik ansible_python_interpreter=/usr/bin/python3"'