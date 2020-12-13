#!/bin/sh

# install publik on EO way

# exit if error
set -e

# commands to install publik
[ -d /home/vagrant/publik-shell ] || git clone https://github.com/departement-loire-atlantique/publik-shell.git
cd /home/vagrant/publik-shell && chmod +x *.sh ./*/*.sh
cd /home/vagrant/publik-shell/base/ && ./install-base.sh