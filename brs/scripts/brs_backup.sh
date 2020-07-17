#!/bin/bash
    set -e
    set -u
    set -o pipefail

echo "backup..."
#volumes = $(docker volume ls -f name=brs -q)

for v in $(docker volume ls -f name=^brs -q); do
  docker run --rm \
    -v $v:/source:ro \
    busybox tar -czC /source . >$v-backup.tar.gz
echo "$v"
done
