#!/bin/bash
    set -e
    set -u
    set -o pipefail
#    set -x

# read params, for prefix
file=".env"
if [ -f $file ]; then
	export $(grep -v '^#' $file  | xargs -d '\n')
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
# offline backup
if [ -d $MY_BACKUP_EXT_DIR ]; then
    cp -r $MY_BACKUP_DIR $MY_BACKUP_EXT_DIR
fi


