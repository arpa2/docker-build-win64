#!/bin/sh

# script to fill volume mounted on /msys64 with mingw64, ARPA2 git repositories and CMake

# mingw64
if [ -d /msys64/mingw64 ]; then
   echo "/msys64/mingw64 already exists"
else
    cd /tmp;
# copy MSYS2 packages
    cat mingw64-packages.txt | while read p v; do
        f=$p-$v-any.pkg.tar.xz
        echo Extracting $f...
        u="http://repo.msys2.org/mingw/x86_64/$f"
        wget -q $u
        tar -C /msys64 -xJf $f mingw64
        rm $f
    done
# copy gnutls with libdane
    echo Extracting GnuTLS with libdane...
    tar -C /msys64 -xJf mingw-w64-x86_64-gnutls-3.6.6-2-any.pkg.tar.xz mingw64
fi

# tlspool packages
if [ -d /msys64/home/arpa2 ]; then
   echo "/msys64/home/arpa2 already exists"
else
# ARPA2
   echo Cloning ARPA2 packages...
   mkdir -p /msys64/home/arpa2
   cd /msys64/home/arpa2
   git clone https://github.com/arpa2/arpa2cm
   git clone https://github.com/hfmanson/quick-der
   git clone https://github.com/hfmanson/tlspool
# cmake with updated shell_path
   echo Cloning cmake with updated SHELL_PATH...
   cd /msys64/home
   git clone https://gitlab.kitware.com/hfmanson/cmake
fi
