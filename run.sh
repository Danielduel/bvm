#!/bin/bash

source ./constants.sh

xhost local:root

docker run \
  --rm \
  --platform linux/x86_64 \
  --net=host \
  -v /tmp/.X11-unix \
  -e DISPLAY \
  chromiums.local/$DOCKER_TAG
