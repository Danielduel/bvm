FROM --platform=linux/amd64 ubuntu:18.04

# Base dependencies
RUN apt-get update && apt-get install -y zip unzip xauth libelf-dev

# Chrome 56 dependencies
RUN apt-get update && apt-get install -y \
  libc6 \
  libpango1.0-dev \
 	libx11-xcb-dev \
  libxcomposite-dev \
 	libxcursor-dev \
  libxdamage-dev \
  libxi-dev \
  libxtst-dev \
  libnss3 \
  libcups2-dev \
  libgconf-2-4 \
  libxss-dev \
  libxrandr2 \
  libasound2-dev \
  libatk1.0-dev \
  libgtk2.0-dev \
  libcanberra-gtk-module

RUN adduser chrome
USER chrome

ARG ARCHIVE
ARG DIR=/home/chrome
RUN mkdir -p ${DIR}

WORKDIR ${DIR}

COPY --chown=chrome ./docker-assets/${ARCHIVE} ./chrome.zip

RUN unzip chrome.zip -d ./

CMD [ "./chrome-linux/chrome", "--no-sandbox" ]
