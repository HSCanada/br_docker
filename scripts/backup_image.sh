docker save -o ./data/home_jupyter:latest_20210908.tar 1b71f0fb9e51
docker save -o ./data/bitnami:mariadb:10.3-debian-10_20210908.tar 5a3fcc67453d
docker save -o ./data/home_mediawiki:latest_20210908.tar 775951540ddf
docker save -o ./data/jwilder:nginx-proxy:latest_20210908.tar fcb5a96e19c1
docker save -o ./data/bitnami:postgresql:11-debian-10_20210908.tar d4411339942b
docker save -o ./data/bitnami:redmine:4-debian-10_20210908.tar a6e4e6829b11
docker save -o ./data/nginx:latest_20210908.tar bc9a0695f571

#echo 'postgres...'
#docker export 043783c8dd81 -o ./data/home_postgresql_1_backup_20210906.tar
#echo 'maria...'
#docker export 6488501014be -o ./data/home_mariadb_1_backup_20210906.tar
#echo 'jupyter...'
#docker export d5d8d6fdf33a -o ./data/home_jupyter_1_backup_20210906.tar
#echo 'web...'
#docker export 639bc02203c9 -o ./data/home_web_1_backup_20210906.tar
#echo 'proxy...'
#docker export 1caae1a293b5 -o ./data/home_nginx-proxy_1_backup_20210906.tar
#echo 'redmine...'
#docker export ba4fad232e9c -o ./data/home_redmine_1_backup_20210906.tar
#echo 'mediawiki...'
#docker export 0041228d63fb -o ./data/home_mediawiki_1_backup_20210906.tar

#docker import imagename_backup_yyyymmdd.tar newimagename:tagname
#CONTAINER ID   IMAGE                             NAMES
#043783c8dd81   bitnami/postgresql:11-debian-10   home_postgresql_1
#6488501014be   bitnami/mariadb:10.3-debian-10    home_mariadb_1
#d5d8d6fdf33a   home_jupyter                      home_jupyter_1
#639bc02203c9   nginx                             home_web_1
#1caae1a293b5   jwilder/nginx-proxy               home_nginx-proxy_1
#ba4fad232e9c   bitnami/redmine:4-debian-10       home_redmine_1
#0041228d63fb   home_mediawiki                    home_mediawiki_1
