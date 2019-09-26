#!/bin/bash
source box.sh


echo -n "Name Directory Server ?"
read REP

if [ -d $REP ]; then
    echo "Directory $REP already exists"
else
    mkdir $REP
box echo -e "Directory $REP create"
fi

# touch $REP/.env.dev

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


# mv .env.dev $REP/