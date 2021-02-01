#!/bin/bash

# exit if error
set -e

# installation d'apache
zypper install --no-confirm apache2
cp /home/vagrant/localhost.conf /etc/apache2/vhosts.d/localhost.conf
mkdir -p /srv/www/vhosts/localhost/
a2enmod proxy
a2enmod proxy_http
rcapache2 restart

# installation de flask
groupadd flaskappuser
useradd --create-home -g flaskappuser flaskappuser
mkdir -p /home/flaskappuser/flaskapp/logs
cd /home/flaskappuser/flaskapp/
python3 -m venv flaskvenv
source flaskvenv/bin/activate
pip install flask gunicorn
cp /home/vagrant/app.py /home/flaskappuser/flaskapp/app.py
cp /home/vagrant/gunicorn.conf /home/flaskappuser/flaskapp/gunicorn.conf
chown -R flaskappuser:flaskappuser /home/flaskappuser/

# configuration du systemd pour le service flaskapp
cp /home/vagrant/flaskapp.service /etc/systemd/system/flaskapp.service
systemctl daemon-reload
systemctl start flaskapp
