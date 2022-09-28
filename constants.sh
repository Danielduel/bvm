#!/bin/bash

SNAPSHOT_PLATFORM="Linux_x64" # I think most of those dirs that look like valid targets are in https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html
SNAPSHOT_NUMBER="426989" # You can find those on https://vikyd.github.io/download-chromium-history-version/#/
SNAPSHOT_PRODUCT="chrome" # Not sure if it is necessary to expose, just leaving it here for now
SNAPSHOT_SUFFIX="linux" # it is general target - for mac and mac_arm is mac, for linux and linux_x64 is linux, windows...
SNAPSHOT_GENERATION="1477123731602000" # Not sure what it is for, you can get that from inspecting the link addr

ARCHIVE="${SNAPSHOT_PLATFORM}_${SNAPSHOT_NUMBER}_${SNAPSHOT_PRODUCT}-${SNAPSHOT_SUFFIX}.zip"
ARCHIVE_DOCKER_NAME="${SNAPSHOT_PLATFORM}_${SNAPSHOT_NUMBER}_${SNAPSHOT_PRODUCT}-${SNAPSHOT_SUFFIX}"
ARCHIVE_DOCKER_NAME_NORMALISED=`echo $ARCHIVE_DOCKER_NAME | tr '[:upper:]' '[:lower:]'`
ARCHIVE_ESCAPED="${SNAPSHOT_PLATFORM}%2F${SNAPSHOT_NUMBER}%2F${SNAPSHOT_PRODUCT}-${SNAPSHOT_SUFFIX}.zip"
ARCHIVE_URL="https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/${ARCHIVE_ESCAPED}?generation=${SNAPSHOT_GENERATION}&alt=media"

DOCKER_TAG=bvm.local/$ARCHIVE_DOCKER_NAME_NORMALISED
