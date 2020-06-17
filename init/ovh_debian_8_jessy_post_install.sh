#!/bin/sh

# Stop installation if something goes wrong (errpr code different from zero)
set -e

echo "Add some convenients tools"
#################################

sudo apt-get install -y gnupg vim git curl

echo "install virtualbox"
#####################################
echo "deb http://httpredir.debian.org/debian/ jessie main contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt-get update
# sudo apt-get install -y linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') virtualbox
sudo apt-get install -y linux-headers-`uname -r` virtualbox

#### Troubleshooting
# sudo apt-get remove -y virtualbox-dkms
# sudo apt-get install -y virtualbox-dkms 
# sudo apt-get install -y linux-headers-`uname -r`
# sudo dpkg-reconfigure virtualbox-dkms

echo "install vagrant"
#####################################
sudo apt-get update
sudo apt-get install -y vagrant

echo "getting into publicbox"
#############################
git clone https://github.com/departement-loire-atlantique/publikbox.git && cd publikbox