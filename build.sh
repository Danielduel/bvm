#!/bin/bash

source ./constants.sh
mkdir -p docker-assets

if [ ! -f ./docker-assets/${ARCHIVE} ]; then
  curl ${ARCHIVE_URL} > ./docker-assets/${ARCHIVE}
fi

docker build \
  --platform linux/amd64 \
  --build-arg ARCHIVE=$ARCHIVE \
  -t $DOCKER_TAG \
  -f ./docker/base.Dockerfile \
  .
