#!/bin/bash
    set -e
    set -u
    set -o pipefail

read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # do dangerous stuff
    docker-compose down
    docker rmi $(docker images brs* -q)
    docker volume prune
fi

