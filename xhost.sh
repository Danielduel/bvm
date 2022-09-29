#!/bin/bash

# Default (Linux) - use flat stetup (I am not sure if it will work with wayland backend)
# I assume that it will work for BSD too
XHOST_LOCAL="localhost"
XHOST_DOCKER=$DISPLAY

# Possible setup for mac
if [[ `uname -s` == "Darwin" ]]; then
  # If on mac - use network-like setup
  XHOST_LOCAL="localhost"
  XHOST_DOCKER="host.docker.internal:0"
fi

# Windows?
