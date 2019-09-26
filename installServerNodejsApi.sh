#!/bin/bash
source box.sh

# Create Folder

echo -n "Name Directory Server ?"
read REP

if [ -d $REP ]; then
    box echo -e "Directory $REP already exists" "green" "purple"
else
    mkdir $REP
    box echo -e "Directory $REP create" "green" "purple"
fi

# copy files to directory

cp app.js $REP
box echo -e echo "app.js copy to directory $REP" "green" "purple"


# create Files

touch $REP/readme.mb

# Define port .env

portDefault="6000"

echo -n "port number ?"
read port

if [ -z $port ]; then
    echo -e "default port $portDefault"
    cat>$REP/.env.dev<<eof
PLATEFORM=DEV
PORT=$portDefault
DEBUG=true
NODENAME=hostname
eof
else
    echo -e "Ok the port is $port"
    
cat>$REP/.env.dev<<eof
PLATEFORM=DEV
PORT=$port
DEBUG=true
NODENAME=hostname
eof
fi



# Create Git Ignore

cat>$REP/.gitignore<<eof
node_modules/
target/
#etc/
.config/
.npm/
dist/
.idea/
.sonar_lock
.vscode
debug.log
all-logs.log
coverage
npm-debug.log*
*.iml
.DS_Store
.npmrc
src/app/auto-generated/
.ts-node/
ormconfig.json
animco-engager.db
docker/postgres/data
# /.env
.pm2/
client/build/
/.ash_history
Zone de message
eof




# Create Directory SRC / ASSETS/... / Views

ASSETS=$REP/src/assets

mkdir -p $REP/src/router


while true; do
    read -p "do you want to create assets directory y/n ?" yn
    case $yn in
        [Yy]* ) mkdir $ASSETS  $ASSETS/css  $ASSETS/images  $ASSETS/script  $ASSETS/utils
        echo "Directory created"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "do you want to create views directory y/n ?" yn
    case $yn in
        [Yy]* ) mkdir  $REP/src/views
        echo "Directory created"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


cd $REP

echo "install npm"
sleep 2

# Init npm
npm -y init

npm i --save express
npm i --save cors
npm i --save dotenv
npm i --save express-validator
#identique
npm i --save node-fetch
#npm i --save superagent
#npm i --save isomorphic-fetch

while true; do
    read -p "do you want install body-parser y/n ?" yn
    case $yn in
        [Yy]* ) npm i body-parser
        echo "body-parser installed"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Install Eslint

npm i --save-dev eslint
node node_modules/eslint/bin/eslint.js --init

cd ..

# Create docker Files

mkdir $REP/docker
touch $REP/docker/Dockerfile $REP/docker/docker-compose.yml $REP/docker/.dockerignore


cat>$REP/docker/.dockerignore<<eof
node_modules/
target/
etc/
.config/
.npm/
dist/
.idea/
.sonar_lock
.vscode
debug.log
all-logs.log
coverage
npm-debug.log*
*.iml
.DS_Store
.npmrc
src/app/auto-generated/
.ts-node/
ormconfig.json
animco-engager.db
docker/postgres/data
/.env
.pm2/
client/build/
/.ash_history
Zone de message
eof



box echo -e "installation finished server $REP create" "green" "purple"