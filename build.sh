#!/bin/bash

source ./constants.sh

if [ ! -f ./docker-assets/${ARCHIVE} ]; then
  curl ${ARCHIVE_URL} > ./docker-assets/${ARCHIVE}
fi

docker build \
  --platform linux/x86_64 \
  --build-arg ARCHIVE=$ARCHIVE \
  -t chromiums.local/$DOCKER_TAG \
  -f ./docker/base.Dockerfile \
  .
