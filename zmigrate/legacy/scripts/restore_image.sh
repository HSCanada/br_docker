#!/bin/bash

echo '...jupyter'
docker load -i ./data/jupyter_image_backup.tar 
echo '...maria'
docker load -i ./data/mariadb_image_backup.tar 
echo '...mediawiki'
docker load -i ./data/mediawiki_image_backup.tar 
echo '...proxy'
docker load -i ./data/nginx-proxy_image_backup.tar 
echo '...postgres'
docker load -i ./data/postgresql_image_backup.tar 
echo '...redmine'
docker load -i ./data/redmine_image_backup.tar 
echo '...web'
docker load -i ./data/web_image_backup.tar 

