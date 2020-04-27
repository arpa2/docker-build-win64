#!/bin/sh

# script to fill volume mounted on /msys64 with mingw64, ARPA2 git repositories and CMake
# mingw64
cd /tmp
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
