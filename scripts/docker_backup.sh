#!/bin/sh
# script to backup docker images to file for offline backup, tmc, 8 Sep 17
# updated container, post migration, 1 Oct 18
# takes about 7 minutes to run



BACKUP_DIR="/home/backup/docker_backupd/" 
BACKUP_PRE="backup-"


BACKUP_NAME="br_proxy"
BACKUP_CONTAINER_ID="9da38de77755"
echo backing up ${BACKUP_NAME}... 
docker commit -p $BACKUP_CONTAINER_ID $BACKUP_PRE$BACKUP_NAME 
docker save -o $BACKUP_DIR$BACKUP_PRE${BACKUP_NAME}.tar $BACKUP_PRE$BACKUP_NAME

BACKUP_NAME="br_postgres"
BACKUP_CONTAINER_ID="545ca15e437f"
echo backing up ${BACKUP_NAME}... 
docker commit -p $BACKUP_CONTAINER_ID $BACKUP_PRE$BACKUP_NAME
docker save -o $BACKUP_DIR$BACKUP_PRE${BACKUP_NAME}.tar $BACKUP_PRE$BACKUP_NAME

echo custom volume backup logic
docker run --rm --volumes-from $BACKUP_NAME -v $BACKUP_DIR:$BACKUP_DIR ubuntu tar cvf ${BACKUP_DIR}${BACKUP_PRE}${BACKUP_NAME}_volume.tar /var/lib/postgresql/data

BACKUP_NAME="br_redmine"
BACKUP_CONTAINER_ID="1f28f727e2f2"

echo backing up ${BACKUP_NAME}... 
docker commit -p $BACKUP_CONTAINER_ID $BACKUP_PRE$BACKUP_NAME
docker save -o $BACKUP_DIR$BACKUP_PRE${BACKUP_NAME}.tar $BACKUP_PRE$BACKUP_NAME

BACKUP_NAME="br_mysql"
BACKUP_CONTAINER_ID="66553a8183d6"
echo backing up ${BACKUP_NAME}... 
docker commit -p $BACKUP_CONTAINER_ID $BACKUP_PRE$BACKUP_NAME
docker save -o $BACKUP_DIR$BACKUP_PRE${BACKUP_NAME}.tar $BACKUP_PRE$BACKUP_NAME

BACKUP_NAME="br_mediawiki"
BACKUP_CONTAINER_ID="fb22ca772e2a"
echo backing up ${BACKUP_NAME}... 
docker commit -p $BACKUP_CONTAINER_ID $BACKUP_PRE$BACKUP_NAME
docker save -o $BACKUP_DIR$BACKUP_PRE${BACKUP_NAME}.tar $BACKUP_PRE$BACKUP_NAME

BACKUP_NAME="br_notebook"
BACKUP_CONTAINER_ID="9df33a5c1b52"
echo backing up ${BACKUP_NAME}... 
docker commit -p $BACKUP_CONTAINER_ID $BACKUP_PRE$BACKUP_NAME
docker save -o $BACKUP_DIR$BACKUP_PRE${BACKUP_NAME}.tar $BACKUP_PRE$BACKUP_NAME 




