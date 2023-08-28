#!/usr/bin/env bash

TOKEN=`docker logs jupyter  2>&1 | \
    grep token | \
    tail -n 1 | \
    cut -d "=" -f2-`

echo "TOKEN: "$TOKEN

printf "TOKEN: %s \n" $TOKEN >| token.txt
