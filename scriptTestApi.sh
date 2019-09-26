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

# mv .env.dev $REP/