#!/bin/bash
    set -e
    set -u
    set -o pipefail

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

echo "backup..."
cd $MY_BACKUP_DIR
for v in $(docker volume ls -f name=^$COMPOSE_PROJECT_NAME -q); do
  docker run --rm \
    -v $v:/source:ro \
    busybox tar -czC /source . >$v-backup.tar.gz
  echo "$(date) |  $v"
done
cd ..

