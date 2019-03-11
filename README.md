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

## Building and installing quick-der

<pre>
root@530226e28371:/# <b>wine cmd</b>
Microsoft Windows 6.1.7601 (4.3)

Z:\><b>cd \msys64\home\arpa2\quick-der</b>

Z:\msys64\home\arpa2\quick-der><b>mkdir build</b>

Z:\msys64\home\arpa2\quick-der><b>cd build</b>

Z:\msys64\home\arpa2\quick-der\build><b>set PATH=%PATH%;z:\msys64\mingw64\bin</b>

Z:\msys64\home\arpa2\quick-der\build><b>cmake -G "MinGW Makefiles" "-DCMAKE_INSTALL_PREFIX:PATH=Z:/msys64/mingw64" "-DCMAKE_C_STANDARD_LIBRARIES:STRING=-lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32 -lwsock32 -lws2_32"  "-DCMAKE_SHARED_LIBRARY_SUFFIX:STRING=.dll.a" ..</b>
-- The C compiler identification is GNU 8.3.0
-- Check for working C compiler: Z:/msys64/mingw64/bin/gcc.exe
-- Check for working C compiler: Z:/msys64/mingw64/bin/gcc.exe -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
CMake Warning at Z:/msys64/mingw64/share/ARPA2CM/modules/MacroGitVersionInfo.cmake:85 (message):
  Git not found; git-versioning uses default 1.3-0.
Call Stack (most recent call first):
  CMakeLists.txt:62 (get_version_from_git)


-- Looking for Python
-- Found Python: Z:/msys64/mingw64/bin/python3.7.exe (found version "3.7.2") found components:  Interpreter 
-- Configuring done
-- Generating done
-- Build files have been written to: Z:/msys64/home/arpa2/quick-der/build

Z:\msys64\home\arpa2\quick-der\build><b>python3 z:\msys64\mingw64\bin\pip3-script.py install asn1ate</b>
Collecting asn1ate
  Downloading https://files.pythonhosted.org/packages/ec/20/7310475955a893ddd0beb7c8a9b1f940390d67bc46cae9d60c7bc7566d5c/asn1ate-0.6.0.tar.gz
Requirement already satisfied: pyparsing>=2.0.0 in z:\msys64\mingw64\lib\python3.7\site-packages (from asn1ate) (2.3.1)
Installing collected packages: asn1ate
  Running setup.py install for asn1ate ... done
Successfully installed asn1ate-0.6.0

Z:\msys64\home\arpa2\quick-der\build><b>mingw32-make install</b>
Scanning dependencies of target quickderStatic
[  0%] Building C object lib/CMakeFiles/quickderStatic.dir/der_header.c.obj
[  1%] Building C object lib/CMakeFiles/quickderStatic.dir/der_iterate.c.obj
[  2%] Building C object lib/CMakeFiles/quickderStatic.dir/der_pack.c.obj
...
[100%] Linking C executable data_putget.test.exe
[100%] Built target data_putget.test
Install the project...
-- Install configuration: ""
-- Installing: Z:/msys64/mingw64/lib/pkgconfig/Quick-DER.pc
-- Installing: Z:/msys64/mingw64/CMake/Quick-DERConfig.cmake
-- Installing: Z:/msys64/mingw64/CMake/Quick-DERConfigVersion.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/toolchain/MacroASN1Module.cmake
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/toolchain/module-test.c.in
-- Installing: Z:/msys64/mingw64/share/ARPA2CM/toolchain/module-test.py.in
-- Installing: Z:/msys64/mingw64/lib/libquickder.dll.a
-- Installing: Z:/msys64/mingw64/lib/libquickder.a
-- Installing: Z:/msys64/mingw64/include/quick-der
-- Installing: Z:/msys64/mingw64/include/quick-der/api.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc1422.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc2315.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc2578.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc2898.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc3062.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc3280.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc3909.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc4120.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc4178.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc4373.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc4511.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc4531.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc4556.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc5208.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc5280.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc5805.h
-- Installing: Z:/msys64/mingw64/include/quick-der/rfc7292.h
-- Installing: Z:/msys64/mingw64/include/quick-der/kxover.h
-- Installing: Z:/msys64/mingw64/include/quick-der/RemotePKCS11.h
-- Installing: Z:/msys64/mingw64/share/doc/quick-der/kxover.md
-- Installing: Z:/msys64/mingw64/share/doc/quick-der/RemotePKCS11.md

Z:\msys64\home\arpa2\quick-der\build>
</pre>

At this moment libquickder.dll is not installed. We do it manually
<pre>
Z:\msys64\home\arpa2\quick-der\build><b>copy lib\libquickder.dll z:\msys64\mingw64\bin</b>
</pre>
