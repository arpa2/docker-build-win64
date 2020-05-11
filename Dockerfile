FROM debian:stable

MAINTAINER Henri Manson

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y install wget less vim apt-transport-https xz-utils git net-tools gnupg2
# RUN wget https://dl.winehq.org/wine-builds/winehq.key && apt-key add winehq.key && echo 'deb https://dl.winehq.org/wine-builds/debian/ stable main' >> /etc/apt/sources.list && rm winehq.key
COPY winehq.key /root/winehq.key
RUN apt-key add /root/winehq.key && echo 'deb https://dl.winehq.org/wine-builds/debian/ stable main' >> /etc/apt/sources.list && rm /root/winehq.key
RUN wget https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_10/amd64/libfaudio0_20.01-0~buster_amd64.deb && apt install -y libstb0 libsdl2-2.0-0  libavutil56 libavcodec58 && dpkg -i libfaudio0_20.01-0~buster_amd64.deb
RUN wget https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_10/i386/libfaudio0_20.01-0~buster_i386.deb && apt install -y libstb0:i386 libsdl2-2.0-0:i386  libavutil56:i386 libavcodec58:i386 && dpkg -i libfaudio0_20.01-0~buster_i386.deb
RUN apt-get update && apt-get -y install winehq-stable zstd
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# copy com_err files
COPY setup-docker-volume/com_err/mingw64 /msys64/mingw64

# copy kerberos files
COPY setup-docker-volume/kerberos/mingw64 /msys64/mingw64

# copy files to /tmp of docker
# GnuTLS with dane
COPY setup-docker-volume/mingw-w64-x86_64-gnutls-3.6.6-2-any.pkg.tar.xz /tmp

# Flex
COPY setup-docker-volume/mingw-w64-x86_64-flex-2.5.39-1-any.pkg.tar.zst /tmp

# Bison
COPY setup-docker-volume/mingw-w64-x86_64-bison-3.0.4-2-any.pkg.tar.zst /tmp

# list of MSYS2 packages to be installed on /msys64/mingw64
COPY setup-docker-volume/mingw64-packages.txt /tmp
# script to setup docker volume
COPY setup-docker-volume/setup-docker-volume.sh /tmp
# tlspool configuration files and client programs
COPY setup-docker-volume/home /msys64/home
COPY wine /root/.wine
# fill docker volume with mingw64 and git repositories
RUN /tmp/setup-docker-volume.sh

CMD ["bash"]
