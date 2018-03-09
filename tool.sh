#!/bin/bash
REMOTE="taind@35.199.52.214"
DEPLOY=".deploy"
APP="$DEPLOY/app.tar"
STOP_FILE="$DEPLOY/stop.sh"
SETUP_FILE="$DEPLOY/setup.sh"
DEPLOY_FILE="$DEPLOY/deploy.sh"
START_FILE="$DEPLOY/start.sh"
LOGS_FILE="$DEPLOY/logs.sh"
LINK_FILE="$DEPLOY/link.sh"
NGINX_CONF="$DEPLOY/nginx.conf"
NODE_MODULES="node_modules"
GIT=".git"

cd ..
case $1 in
  setup)
    echo "=> Setup"
    scp $NGINX_CONF $REMOTE:~/ >> /dev/null 2>&1
    echo "..upload nginx"
    ssh $REMOTE "bash -s" < $SETUP_FILE
    ;;
  deploy)
    echo "=> Deploy"
    echo "..bundle"
    tar -zcvf $APP . --exclude=$DEPLOY --exclude=$NODE_MODULES --exclude=$GIT >> /dev/null
    echo "..upload app"
    scp $APP $REMOTE:~/ >> /dev/null 2>&1
    echo "..run deploy"
    rm $APP
    ssh $REMOTE "bash -s" < $DEPLOY_FILE
    ;;
  stop)
    echo "=> Stop"
    ssh $REMOTE "bash -s" < $STOP_FILE
    ;;
  start)
    echo "=> Start"
    ssh $REMOTE "bash -s" < $START_FILE
    ;;
  logs)
    echo "=> Logs"
    ssh $REMOTE "bash -s" < $LOGS_FILE
    ;;
  link)
    echo "=> Link"
    ssh $REMOTE "bash -s" < $LINK_FILE
    ;;
  *)
    echo "deploy NodeJS application"
    echo "usage:"
    echo ""
    echo "  ./tool.sh [command]"
    echo ""
    echo "commands:"
    echo ""
    echo "  setup  : setup production environment"
    echo "  deploy : deploy application"
    echo "  start  : start application"
    echo "  stop   : stop application"
    echo "  logs   : show logs"
    ;;
esac
