#!/bin/bash

# install publik on EO way

# exit if error
set -e

# Get the sources
apt install -y dos2unix
[ -d /home/vagrant/publik-shell ] || git clone https://github.com/departement-loire-atlantique/publik-shell.git
dos2unix $(find /home/vagrant/ -type f)
cd /home/vagrant/publik-shell && chmod +x $(find . -type f -name '*.sh')

# copy configure data
rm -rf /home/vagrant/publik-shell/configure_data
mv /home/vagrant/configure_data /home/vagrant/publik-shell/configure_data

# install base
cd /home/vagrant/publik-shell/base && ./install-base.sh

# intit database
runuser -l postgres -c '/home/vagrant/publik-shell/init-db.sh'

# install
cd /home/vagrant/publik-shell/hobo && ./install-hobo.sh
cd /home/vagrant/publik-shell/authentic && ./install-authentic.sh
cd /home/vagrant/publik-shell/combo && ./install-combo.sh
cd /home/vagrant/publik-shell/fargo && ./install-fargo.sh
cd /home/vagrant/publik-shell/passerelle && ./install-passerelle.sh
cd /home/vagrant/publik-shell/wcs && ./install-wcs.sh
cd /home/vagrant/publik-shell/chrono && ./install-chrono.sh
cd /home/vagrant/publik-shell/bijoe && ./install-bijoe.sh

# copy https configuration
mv /home/vagrant/configure_https/* /etc/nginx/conf.d/
rm -rf /home/vagrant/configure_https

# start all
/home/vagrant/publik-shell/start-all.sh

# creation des tenants
cd /tmp && ./cook.sh
