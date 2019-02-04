#!/bin/bash
set -uex
image=$(docker build --quiet .)
container=$(docker create $image)
docker cp $container:docs.tar.gz .
docker rm -v $container
docker rmi $image
