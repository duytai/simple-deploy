#!/bin/bash
SESSION="mongodb"
DB_PATH="data/db"
MONGO_PORT="27017"
sudo apt-get install tmux -y
curl -O https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.6.3.tgz
tar -zxvf mongodb-linux-x86_64-3.6.3.tgz
rm mongodb-linux-x86_64-3.6.3.tgz
mkdir -p $DB_PATH
tmux kill-session -t $SESSION
tmux new -d -s $SESSION "./mongodb-linux-x86_64-3.6.3/bin/mongod --config mongod.conf"
tmux ls
lsof -i :$MONGO_PORT
