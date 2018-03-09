#!/bin/bash
REMOTE="*"
DEPLOY=".deploy"
APP="$DEPLOY/app.tar"
SETUP_FILE="$DEPLOY/setup.sh"
DEPLOY_FILE="$DEPLOY/deploy.sh"
NGINX_CONF="$DEPLOY/nginx.conf"
NODE_MODULES="node_modules"
GIT=".git"

cd ..
case $1 in
  s)
    echo "=> Setup"
    scp $NGINX_CONF $REMOTE:~/ >> /dev/null 2>&1
    echo "..upload nginx"
    ssh $REMOTE "bash -s" < $SETUP_FILE
    ;;
  d)
    echo "=> Deploy"
    echo "..bundle"
    tar -zcvf $APP . --exclude=$DEPLOY --exclude=$NODE_MODULES --exclude=$GIT >> /dev/null
    echo "..upload app"
    scp $APP $REMOTE:~/ >> /dev/null 2>&1
    echo "..run deploy"
    rm $APP
    ssh $REMOTE "bash -s" < $DEPLOY_FILE
    ;;
  *)
    echo "FUCK"
    ;;
esac
