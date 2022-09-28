#!/bin/bash

source ./constants.sh

xhost local:root

docker run \
  --rm \
  --platform linux/amd64 \
  --net=host \
  -v /tmp/.X11-unix \
  -e DISPLAY \
  $DOCKER_TAG
