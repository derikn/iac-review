#!/bin/bash
set -e

echo " ----- install ruby and bundler ----- "
sudo apt-get update
sudo apt-get install -y ruby-full build-essential
sudo gem install --no-rdoc --no-ri bundler

echo " ----- install mongodb ----- "
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt-get update
sudo apt-get install -y mongodb-org

echo " ----- start mongodb ----- "
sudo systemctl start mongod
sudo systemctl enable mongod 

echo " ----- copy unit file for application ----- "
wget https://gist.githubusercontent.com/Artemmkin/ce82397cfc69d912df9cd648a8d69bec/raw/7193a36c9661c6b90e7e482d256865f085a853f2/raddit.service
sudo mv raddit.service /etc/systemd/system/raddit.service
