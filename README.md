# Simple-deploy
A simple bash script to deploy Node application to remote server

## Usage:
Go into your project folder
```bash
git clone git@github.com:duytai/simple-deploy.git .deploy
cd .deploy
```
## Configuration
- Add remote server to `tool.sh`
- Edit forward port in `nginx.conf`
- Add startup script to `start` in `package.json`
- Edit scripts when you want co customize

## Deployment:
```bash
./tool.sh setup && ./tool.sh deploy
```
