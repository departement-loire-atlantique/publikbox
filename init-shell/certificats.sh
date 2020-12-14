#!/bin/bash

# install cerficats on EO way

# exit if error
set -e

[ -d /home/vagrant/certificats ] || mkdir /home/vagrant/certificats
cd /home/vagrant/certificats 
wget https://doc-publik.entrouvert.com/media/certificates/dev.publik.love/fullchain.pem -O dev.publik.love-fullchain.pem
wget https://doc-publik.entrouvert.com/media/certificates/dev.publik.love/privkey.pem -O dev.publik.love-privkey.pem