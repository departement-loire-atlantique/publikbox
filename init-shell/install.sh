#!/bin/bash

# install publik on EO way

# exit if error
set -e

# Get the sources
[ -d /home/vagrant/publik-shell ] || git clone https://github.com/departement-loire-atlantique/publik-shell.git
cd /home/vagrant/publik-shell && chmod +x *.sh ./*/*.sh

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

# start all
/home/vagrant/publik-shell/start-all.sh

# creation des tenants
cd /tmp && ./cook.sh
