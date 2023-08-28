#!/usr/bin/env bash

image='myjupyter'
name=jupyter
# a convenience assuming that the first interface containing '192.168' is the interface to be used
HOST_IP=`ip addr show | grep 'inet ' | grep '192.168' | head -n1 | awk '{print $2}' | cut -d '/' -f 1`

echo "==> stopping "$name
docker stop $name
docker rm $name
docker image prune -f

sh ./build.sh

echo "==> recreating "$name
docker container create \
    --name=$name \
    -p $HOST_IP:10000:8888 \
    -v "$(pwd)/work":/home/jovyan/work \
    --restart unless-stopped \
    $image

echo "==> restarting "$name
docker start $name
sleep 5
sh ./get_token.sh

sh ./fileserver.sh
