#!/bin/bash
source ~/.nvm/nvm.sh >> /dev/null 2>&1
pm2 delete all >> /dev/null 2>&1
echo "..untar"
tar -xvf app.tar -C app/ >> /dev/null 2>&1
rm app.tar
cd app/
echo "..install devs"
npm i >> /dev/null 2>&1
pm2 start npm -- start
