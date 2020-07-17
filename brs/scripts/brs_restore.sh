#!/bin/bash
    set -e
    set -u
    set -o pipefail

prefix=""
#prefix="dummy_"
echo "restore..."
for f in $(ls brs*.gz); do
  v=$prefix${f%-*}
  docker run --rm -i \
  -v $v:/target \
  busybox tar -xzC /target <$f
  echo "file=$f, volume=$v"
done
