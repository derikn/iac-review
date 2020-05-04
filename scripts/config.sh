#!/bin/bash
set -e

echo " ----- install ruby and bundler ----- "
sudo apt-get update
sudo apt-get install -y ruby-full build essential
gem install --no-rdoc --no-ri bundler

echo " ----- install mongodb ----- "
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org

echo " ----- start mongodb ----- "
systemctl start mongod
systemctl enable mongod 

echo " ----- copy unit file for application ----- "
wget https://gist.githubusercontent.com/Artemmkin/ce82397cfc69d912df9cd648a8d69bec/raw/7193a36c9661c6b90e7e482d256865f085a853f2/raddit.service
mv raddit.service /etc/systemd/system/raddit.service