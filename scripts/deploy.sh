#!/bin/bash
set -e

echo " ----- clone app repo ----- "
git clone https://github.com/Artemmkin/raddit.git

echo " ----- install app dependencies ----- "
cd ./raddit
sudo gem install bcrypt -v '3.1.13' --source 'https://rubygems.org/'
sudo gem install nio4r -v '2.5.2' --source 'https://rubygems.org/'
sudo bundle install 

echo " ----- start app ----- "
sudo systemctl start raddit 
sudo systemctl enable raddit 