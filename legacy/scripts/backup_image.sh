#!/bin/bash

echo 'jupyter...'
docker save -o ./data/jupyter_image_backup.tar home_jupyter:latest
echo 'maria...'
docker save -o ./data/mariadb_image_backup.tar bitnami/mariadb:10.3-debian-10
echo 'mediawiki...'
docker save -o ./data/mediawiki_image_backup.tar home_mediawiki:latest
echo 'proxy...'
docker save -o ./data/nginx-proxy_image_backup.tar jwilder/nginx-proxy:latest
echo 'postgres...'
docker save -o ./data/postgresql_image_backup.tar bitnami/postgresql:11-debian-10
echo 'redmine...'
docker save -o ./data/redmine_image_backup.tar bitnami/redmine:4-debian-10
echo 'web...'
docker save -o ./data/web_image_backup.tar nginx:latest

#docker import imagename_backup_yyyymmdd.tar newimagename:tagname
#CONTAINER ID   IMAGE                             NAMES
#043783c8dd81   bitnami/postgresql:11-debian-10   home_postgresql_1
#6488501014be   bitnami/mariadb:10.3-debian-10    home_mariadb_1
#d5d8d6fdf33a   home_jupyter                      home_jupyter_1
#639bc02203c9   nginx                             home_web_1
#1caae1a293b5   jwilder/nginx-proxy               home_nginx-proxy_1
#ba4fad232e9c   bitnami/redmine:4-debian-10       home_redmine_1
#0041228d63fb   home_mediawiki                    home_mediawiki_1
