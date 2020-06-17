#!/bin/sh

# exit if error
set -e

# setting keyboard to azerty
sed -i 's/XKBLAYOUT.*/XKBLAYOUT="fr"/g' /etc/default/keyboard
sed -i 's/XKBVARIANT.*/XKBVARIANT="azerty"/g' /etc/default/keyboard 
sudo service keyboard-setup restart

# install tools
sudo apt install -y git ansible