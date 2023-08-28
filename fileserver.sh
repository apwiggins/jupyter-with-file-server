#!/usr/bin/env bash

image='halverneus/static-file-server:latest'
name=fileserver

echo "==> stopping "$name
docker stop $name
docker rm $name
docker image prune -f

echo "==> creating "$name
docker create \
	--name=$name \
    -v "$(pwd)/files":/web \
    -p 80:8080 \
	--restart unless-stopped \
	$image

echo "==> restarting "$name
docker start $name
