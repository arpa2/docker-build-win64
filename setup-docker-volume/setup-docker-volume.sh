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

# copy flex
echo Extracting flex...
tar -C /msys64 -I zstd -xf mingw-w64-x86_64-flex-2.5.39-1-any.pkg.tar.zst mingw64

# copy bison
echo Extracting bison...
tar -C /msys64 -I zstd -xf mingw-w64-x86_64-bison-3.0.4-2-any.pkg.tar.zst mingw64

# copy improved Cyrus SASL
echo Extracting Cyrus SASL...
tar -C /msys64 -I zstd -xf mingw-w64-x86_64-cyrus-sasl-2.1.27-1-any.pkg.tar.zst mingw64
