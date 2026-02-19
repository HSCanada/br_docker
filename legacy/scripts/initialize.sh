#!/bin/bash
    set -e
    set -u
    set -o pipefail
#    set -x

# read params, for prefix
file=".env"
if [ -f $file ]; then
    set set -o allexport
    source $file 
    set set +o allexport
else
    echo "No $file file found" 1>&2
    exit 1 
fi

#COMPOSE_PROJECT_NAME
#MY_BACKUP_PATH

read -p "Nuke $COMPOSE_PROJECT_NAME: Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # do dangerous stuff
    docker-compose down
    docker rmi $(docker images $COMPOSE_PROJECT_NAME* -q)
    docker volume prune
fi

