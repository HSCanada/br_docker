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

echo "restore..."
cd $MY_BACKUP_DIR
for f in $(ls $COMPOSE_PROJECT_NAME*.gz); do
  #remove backup suffux vol-suffix.gz
  v=${f%-*}
  docker run --rm -i \
    -v $v:/target \
    busybox tar -xzC /target <$f
  echo "file=$f, volume=$v"
done
cd ..
