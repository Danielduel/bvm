# Browser version manager

*chromium version manager*

*(google) chrome version manager*

## Dependencies

- bash
- docker
- curl
- xhost

## Usage

`./build.sh && ./run.sh`

- `./build.sh` fetches browser image (caches it in subdir) and then builds docker image with tag relating to what browser it wraps
- `./run.sh` calls xhost, passes necessary env, runs prebuilt image

(if you will get permission-related issues - `chmod +x ./build.sh ./run.sh`)

## Summary

This repository contains scripts used to run outdated browsers.

Building and running is contained in a short and easy to understand
docker+bash script, look into `constants.sh` to modify what you need.

Dependencies inside the docker are solved for chrome 56,
it is set as default
(it is a version before css grid(57), `AbortController`(66) and `globalThis`(71)
were a thing)

### Why?

Browsers that are supporting different standards were frontend dev bane in the past.
Recently I've discovered that there are areas that still use stuff like chrome 69
as a WebView driver, I've already heard about supporting chrome 30.

Going through timeconsuming process to get a result of `xyz is not defined`, then
seeing that `xyz` has partial support since like 15 versions higher than the device
that your feature targets... is not ideal.

Browserstack could be an alternative, but it has own problems and it is not so clear
if keys used to access development builds aren't stored in BrowserStacks logs ;)

From the other side - I think running vounerable browsers on your metal is not
the safest thing, so I've decided that containing browser in a docker and passing
the window to X will be the sweetspot between not spinning up whole VM each time
and security for this project.

### Notes:

Online tool for searching for ubuntu bionic (18.04) dependencies
https://packages.ubuntu.com/bionic/

Listing of available versions in easy to browse form
https://vikyd.github.io/download-chromium-history-version/#/

Example directory
https://commondatastorage.googleapis.com/chromium-browser-snapshots/index.html?prefix=Linux_x64/426989/

Example download link 
https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F426989%2Fchrome-linux.zip?generation=1477123731602000&alt=media
