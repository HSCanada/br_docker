#!/bin/sh
# script to backup docker images to file for offline backup, tmc, 8 Sep 17
# takes about 7 minutes to run

# CONTAINER ID	IMAGE					NAMES	id
# df1f15bd7d88	jwilder/nginx-proxy			br_proxy	1
# 3bc73b32486e	postgres				br_postgres	2
# a5c9c2e3b4ea	redmine					br_redmine	3
# 61a218adabd5	mysql					br_mysql	4
# 53e269a10844	synctree/mediawiki			br_mediawiki	5
# 93e52890df06	jupyter/my-datascience-notebook		br_notebook	6


BACKUP_DIR="/home/backup/docker_backupd/" 
BACKUP_PRE="backup-"


BACKUP_NAME="br_proxy"
BACKUP_CONTAINER_ID="df1f15bd7d88"
echo backing up ${BACKUP_NAME}... 
docker commit -p $BACKUP_CONTAINER_ID $BACKUP_PRE$BACKUP_NAME 
docker save -o $BACKUP_DIR$BACKUP_PRE${BACKUP_NAME}.tar $BACKUP_PRE$BACKUP_NAME

BACKUP_NAME="br_postgres"
BACKUP_CONTAINER_ID="3bc73b32486e"
echo backing up ${BACKUP_NAME}... 
docker commit -p $BACKUP_CONTAINER_ID $BACKUP_PRE$BACKUP_NAME
docker save -o $BACKUP_DIR$BACKUP_PRE${BACKUP_NAME}.tar $BACKUP_PRE$BACKUP_NAME

echo custom volume backup logic
docker run --rm --volumes-from $BACKUP_NAME -v $BACKUP_DIR:$BACKUP_DIR ubuntu tar cvf ${BACKUP_DIR}${BACKUP_PRE}${BACKUP_NAME}_volume.tar /var/lib/postgresql/data

BACKUP_NAME="br_redmine"
BACKUP_CONTAINER_ID="4d1ae97a27c3"

echo backing up ${BACKUP_NAME}... 
docker commit -p $BACKUP_CONTAINER_ID $BACKUP_PRE$BACKUP_NAME
docker save -o $BACKUP_DIR$BACKUP_PRE${BACKUP_NAME}.tar $BACKUP_PRE$BACKUP_NAME

BACKUP_NAME="br_mysql"
BACKUP_CONTAINER_ID="61a218adabd5"
echo backing up ${BACKUP_NAME}... 
docker commit -p $BACKUP_CONTAINER_ID $BACKUP_PRE$BACKUP_NAME
docker save -o $BACKUP_DIR$BACKUP_PRE${BACKUP_NAME}.tar $BACKUP_PRE$BACKUP_NAME

BACKUP_NAME="br_mediawiki"
BACKUP_CONTAINER_ID="53e269a10844"
echo backing up ${BACKUP_NAME}... 
docker commit -p $BACKUP_CONTAINER_ID $BACKUP_PRE$BACKUP_NAME
docker save -o $BACKUP_DIR$BACKUP_PRE${BACKUP_NAME}.tar $BACKUP_PRE$BACKUP_NAME

BACKUP_NAME="br_notebook"
BACKUP_CONTAINER_ID="bd4053e62138"
echo backing up ${BACKUP_NAME}... 
docker commit -p $BACKUP_CONTAINER_ID $BACKUP_PRE$BACKUP_NAME
docker save -o $BACKUP_DIR$BACKUP_PRE${BACKUP_NAME}.tar $BACKUP_PRE$BACKUP_NAME 




