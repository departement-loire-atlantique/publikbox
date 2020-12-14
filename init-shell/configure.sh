#!/bin/bash

# exit if error
set -e

# setting keyboard to azerty
sed -i 's/XKBLAYOUT.*/XKBLAYOUT="fr"/g' /etc/default/keyboard
sed -i 's/XKBVARIANT.*/XKBVARIANT="azerty"/g' /etc/default/keyboard 
service keyboard-setup restart

# install tools
apt update && apt install -y git ansible postgresql rabbitmq-server

hostsAlreadyModify=$(cat /etc/hosts | grep db | wc -l)
if [ "$hostsAlreadyModify" -eq "0" ]; then
    echo "hosts modifyed"
    echo "127.0.0.1 db rabbitmq" >> /etc/hosts
else
    echo "Skipping : hosts already modifyed"
fi

userHoboExist=$(rabbitmqctl list_users | grep hobo | wc -l)
if [ "$userHoboExist" -eq "0" ]; then
    rabbitmqctl add_user hobo hobopass
    rabbitmqctl set_permissions -p / hobo ".*" ".*" ".*"
else
    echo "Skipping : user hobo already exists for rabbitmq"
fi