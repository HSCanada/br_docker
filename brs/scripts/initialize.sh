docker-compose down
docker rmi $(docker images brs* -q)
docker volume prune
