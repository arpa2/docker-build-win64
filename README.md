# docker-build-win64
Docker container to build ARPA2 software for 64-bit Windows

```
git clone https://github.com/arpa2/docker-build-win64
cd docker-build-win64
docker build .
# -e DISPLAY=192.168.2.20:0.0 replace with your X server
# --name win42 name of containter
# --rm remove container after stopping
# --mount src=mingw64,dst=/msys64 mount mingw64 docker volume on /msys64, create if non-existing
# -it interactive terminal
# win42 name of docker image
docker run -e DISPLAY=192.168.2.20:0.0 --name win42 --rm --mount src=mingw64,dst=/msys64 -it win42
```

## One time setup of docker volume
On another terminal in the same docker-build-win64 directory
```
# copy files to /tmp of docker
# GnuTLS with dane
docker cp mingw-w64-x86_64-gnutls-3.6.6-2-any.pkg.tar.xz win42:/tmp
# list of MSYS2 packages to be installed on /msys64/mingw64
docker cp mingw64-packages.txt win42:/tmp
# script to setup docker volume
docker cp setup-docker-volume.sh win42:/tmp
```
switch back to terminal running docker bash


```
root@454514ecc504:/# /tmp/setup-docker-volume.sh
```
