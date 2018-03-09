# Simple-deploy
A simple bash script to deploy Node application to remote server

## Usage:
Go into your project folder
```bash
git clone git@github.com:duytai/simple-deploy.git .deploy
cd .deploy
```
Add remote server to `tool.sh` file by editing `REMOTE` variable. To deploy:
```bash
./tool.sh setup && ./tool.sh deploy
```
