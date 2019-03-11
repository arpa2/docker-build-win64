FROM debian:jessie

MAINTAINER Henri Manson

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y install wget less vim apt-transport-https xz-utils git net-tools
RUN wget https://dl.winehq.org/wine-builds/winehq.key && apt-key add winehq.key && echo 'deb https://dl.winehq.org/wine-builds/debian/ jessie main' >> /etc/apt/sources.list && rm winehq.key
RUN apt-get update && apt-get -y install winehq-staging
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /msys64
COPY .wine /root/.wine
