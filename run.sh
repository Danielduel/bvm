#!/bin/bash

source ./constants.sh

xhost $XHOST_LOCAL

docker run \
  --rm \
  --platform linux/amd64 \
  --net=host \
  -v $(pwd)/docker-assets/extensions/:/home/chrome/chrome-linux/resources/extension/ \
  -v /tmp/.X11-unix \
  -e DISPLAY=$XHOST_DOCKER \
  $DOCKER_TAG
