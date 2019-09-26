#!/bin/bash
source box.sh


echo -n "Name Directory Server ?"
read REP

if [ -d $REP ]; then
    echo "Directory $REP already exists"
else
    mkdir $REP
box "Directory \033[32;1;5m$REP\033[0m create"
fi

