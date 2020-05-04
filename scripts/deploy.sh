#!/bin/bash
set -e

echo " ----- clone app repo ----- "
git clone https://github.com/Artemmkin/raddit.git

echo " ----- install app dependencies ----- "
cd ./raddit
sudo bundle install 

echo " ----- start app ----- "
sudo systemctl start raddit 
sudo systemctl enable raddit 