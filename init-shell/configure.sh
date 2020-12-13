#!/bin/sh

# exit if error
set -e

# setting keyboard to azerty
sed -i 's/XKBLAYOUT.*/XKBLAYOUT="fr"/g' /etc/default/keyboard
sed -i 's/XKBVARIANT.*/XKBVARIANT="azerty"/g' /etc/default/keyboard 
sudo service keyboard-setup restart

# install tools
apt update && apt install -y git ansible postgresql rabbitmq-server
rabbitmqctl add_user hobo hobopass
rabbitmqctl set_permissions -p / hobo ".*" ".*" ".*"