#!/bin/bash
echo "..install nvm"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash >> /dev/null 2>&1
source ~/.nvm/nvm.sh >> /dev/null 2>&1
NVM_VERSION="$(nvm --version)"
echo "..${NVM_VERSION}"
echo "..install node"
nvm install node >> /dev/null 2>&1
NODE_VERSION="$(node --version)"
echo "..${NODE_VERSION}"
echo "..install pm2"
npm i -g pm2 >> /dev/null 2>&1
PM2_VERSION="$(pm2 --version)"
echo "..${PM2_VERSION}"
echo "..install nginx"
sudo apt-get install nginx -y >> /dev/null 2>&1
sudo mv ~/nginx.conf /etc/nginx/sites-available/default
echo "..start nginx"
sudo service nginx restart
