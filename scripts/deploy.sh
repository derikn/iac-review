#!/bin/bash
set -e

echo " ----- clone app repo ----- "
git clone https://github.com/Artemmkin/raddit.git

echo " ----- install app dependencies ----- "
cd ./raddit
sudo gem install bcrypt -v '3.1.13' --source 'https://rubygems.org/'
sudo gem install nio4r -v '2.5.2' --source 'https://rubygems.org/'
sudo gem install bson -v '4.8.2' --source 'https://rubygems.org/'
sudo gem install puma -v '4.3.3' --source 'https://rubygems.org/'
sudo gem install bson_ext -v '1.5.1' --source 'https://rubygems.org/'
sudo bundle install 

echo " ----- start app ----- "
sudo systemctl start raddit 
sudo systemctl enable raddit 