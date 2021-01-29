#!/bin/bash

# exit if error
set -e

# installation d'apache
zypper install --no-confirm apache2
#sed 's/dummy-host.example.com/localhost/' /etc/apache2/vhosts.d/vhost.template >> /etc/apache2/vhosts.d/localhost.conf
mkdir -p /srv/www/vhosts/localhost/
a2enmod proxy
a2enmod proxy_http
rcapache2 restart

# installation de flask
useradd --create-home flaskappuser
mkdir /home/flaskappuser/flaskapp/
cd /home/flaskappuser/flaskapp/
python3 -m venv flaskvenv
source flaskvenv/bin/activate
pip install flask gunicorn
#touch /home/flaskappuser/flaskapp/app.py
