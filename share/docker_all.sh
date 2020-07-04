#proxy 
docker run \
	--name br_proxy \
	-p 80:80 \
	-v /var/run/docker.sock:/tmp/docker.sock:ro \
	-d jwilder/nginx-proxy

#notebook 
docker run \
	--name br_notebook \
	-e VIRTUAL_HOST=nb.br.hsa.ca \
	-p 8888:8888 \
	-v /home/notebooks:/home/jovyan/work \ 
	-d jupyter:br_notebook \
	start.sh jupyter lab 

#wiki DB
docker run \
        --name br_mysql \
        -v /home/br_mysql/conf.d:/etc/mysql/conf.d \
        -v /home/br_mysql/initdb.d:/docker-entrypoint-initdb.d \
        -v /home/br_mysql/data:/var/lib/mysql \
        -e MYSQL_ROOT_PASSWORD=booger \
        -d mysql

#wiki app
docker run  \
        --link br_mysql:mysql \
	--name br_mediawiki \
	-e VIRTUAL_HOST=wiki.br.hsa.ca \
        -p 8080:80 \
        -v /home/br_mediawiki/config/LocalSettings.php:/var/www/html/LocalSettings.php \
        -v /home/br_mediawiki/images:/var/www/html/images \
        -v /home/br_mediawiki/extensions:/var/www/html/extensions \
        -d synctree/mediawiki

#project DB
docker run \
	--name br_postgres \
	-e POSTGRES_PASSWORD=secret \
	-e POSTGRES_USER=redmine \
	-d postgres

#project app
docker run \
	--name br_redmine \
	-e VIRTUAL_HOST=hours.br.hsa.ca \
	-p 8088:3000 \
	--link br_postgres:postgres \
	-d redmine

