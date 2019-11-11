FROM debian:stable

MAINTAINER Henri Manson

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y install wget less vim apt-transport-https xz-utils git net-tools gnupg2
# RUN wget https://dl.winehq.org/wine-builds/winehq.key && apt-key add winehq.key && echo 'deb https://dl.winehq.org/wine-builds/debian/ stable main' >> /etc/apt/sources.list && rm winehq.key
COPY winehq.key /root/winehq.key
RUN apt-key add /root/winehq.key && echo 'deb https://dl.winehq.org/wine-builds/debian/ stable main' >> /etc/apt/sources.list && rm /root/winehq.key
RUN apt-get update && apt-get -y install winehq-stable
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
COPY wine /root/.wine
COPY setup-docker-volume/com_err/mingw64 /msys64/mingw64

# copy files to /tmp of docker
# GnuTLS with dane
COPY setup-docker-volume/mingw-w64-x86_64-gnutls-3.6.6-2-any.pkg.tar.xz /tmp
# list of MSYS2 packages to be installed on /msys64/mingw64
COPY setup-docker-volume/mingw64-packages.txt /tmp
# script to setup docker volume
COPY setup-docker-volume/setup-docker-volume.sh /tmp
# tlspool configuration files and client programs
COPY setup-docker-volume/home /msys64
# fill docker volume with mingw64 and git repositories
RUN /tmp/setup-docker-volume.sh
