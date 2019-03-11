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

## Building and installing ARPA2CM

<pre>
root@530226e28371:/# <b>wine cmd</b>
Microsoft Windows 6.1.7601 (4.3)

Z:\><b>cd \msys64\home\arpa2\arpa2cm</b>

Z:\msys64\home\arpa2\arpa2cm><b>mkdir build</b>

Z:\msys64\home\arpa2\arpa2cm><b>cd build</b>

Z:\msys64\home\arpa2\arpa2cm\build><b>set PATH=%PATH%;z:\msys64\mingw64\bin</b>

Z:\msys64\home\arpa2\arpa2cm\build><b>cmake -G "MinGW Makefiles" "-DCMAKE_INSTALL_PREFIX:PATH=Z:/msys64/mingw64" ..</b>
-- 
-- Configuring done
-- Generating done
-- Build files have been written to: Z:/msys64/home/arpa2/arpa2cm/build

Z:\msys64\home\arpa2\arpa2cm\build><b>mingw32-make install</b>
Install the project...
-- Install configuration: ""
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/modules/Config.cmake.in
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/modules/ConfigVersion.cmake.in
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/modules/MacroAddUninstallTarget.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/modules/MacroCreateConfigFiles.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/modules/MacroEnsureOutOfSourceBuild.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/modules/MacroGitVersionInfo.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/modules/PackAllPossible.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/modules/PythonSupport.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/modules/cmake_uninstall.cmake.in
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/find-modules/ECMFindModuleHelpers.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/find-modules/FindBDB.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/find-modules/FindGnuTLSDane.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/find-modules/FindGperf.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/find-modules/FindLibTASN1.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/find-modules/FindLibldns.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/find-modules/FindLog4cpp.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/find-modules/FindOpenLDAP.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/find-modules/FindP11-Kit.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/find-modules/FindSQLite3.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/find-modules/FindUnbound.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/find-modules/check_log4cpp.cpp
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/toolchain/README.md
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/doc/README.md
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/doc/CMakeLists.example.txt
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/cmake/ARPA2CMConfig.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/cmake/ARPA2CMConfigVersion.cmake

Z:\msys64\home\arpa2\arpa2cm\build>
</pre>
