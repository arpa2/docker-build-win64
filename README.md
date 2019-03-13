
# docker-build-win64
Docker container to build ARPA2 software for 64-bit Windows

## build and tag wine image
<pre>
$ <b>git clone https://github.com/arpa2/docker-build-win64</b>
$ <b>cd docker-build-win64</b>
$ <b>docker build --tag wine .</b>
</pre>

## create mingw64 docker volume and fill it
<pre>
$ <b>./fill-docker-volume</b>
e09f68a1ea05389898018c3036c57da51cfa423aa4474a175df41451fdd07648
Extracting mingw-w64-x86_64-adwaita-icon-theme-3.30.1-1-any.pkg.tar.xz...
Extracting mingw-w64-x86_64-atk-2.30.0-1-any.pkg.tar.xz...
Extracting mingw-w64-x86_64-binutils-2.30-5-any.pkg.tar.xz...
Extracting mingw-w64-x86_64-brotli-1.0.7-1-any.pkg.tar.xz...
...
Extracting mingw-w64-x86_64-zlib-1.2.11-5-any.pkg.tar.xz...
Extracting mingw-w64-x86_64-zstd-1.3.8-1-any.pkg.tar.xz...
Extracting GnuTLS with libdane...
Cloning ARPA2 packages...
Cloning into 'arpa2cm'...
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 166 (delta 0), reused 1 (delta 0), pack-reused 163
Receiving objects: 100% (166/166), 46.23 KiB | 0 bytes/s, done.
Resolving deltas: 100% (86/86), done.
Checking connectivity... done.
Cloning into 'quick-der'...
remote: Enumerating objects: 143, done.
remote: Counting objects: 100% (143/143), done.
remote: Compressing objects: 100% (79/79), done.
remote: Total 1949 (delta 80), reused 102 (delta 57), pack-reused 1806
Receiving objects: 100% (1949/1949), 1.63 MiB | 1.69 MiB/s, done.
Resolving deltas: 100% (1223/1223), done.
Checking connectivity... done.
Cloning into 'tlspool'...
remote: Enumerating objects: 134, done.
remote: Counting objects: 100% (134/134), done.
remote: Compressing objects: 100% (77/77), done.
remote: Total 3772 (delta 66), reused 93 (delta 44), pack-reused 3638
Receiving objects: 100% (3772/3772), 3.22 MiB | 1.98 MiB/s, done.
Resolving deltas: 100% (2260/2260), done.
Checking connectivity... done.
Cloning cmake with updated SHELL_PATH...
Cloning into 'cmake'...
remote: Enumerating objects: 266093, done.
remote: Counting objects: 100% (266093/266093), done.
remote: Compressing objects: 100% (61448/61448), done.
remote: Total 266093 (delta 202428), reused 266015 (delta 202366)
Receiving objects: 100% (266093/266093), 79.90 MiB | 10.77 MiB/s, done.
Resolving deltas: 100% (202428/202428), done.
Checking connectivity... done.
winehq
$ 
</pre>
## start wine container
* \-\-name winehq name of container
* \-\-rm remove container after stopping
* \-\-mount src=mingw64,dst=/msys64 mount mingw64 docker volume on /msys64
* \-it interactive terminal
* wine name of docker image
<pre>
$ <b>docker run --name winehq --rm --mount src=mingw64,dst=/msys64 -it wine</b>
</pre>

## Building and installing ARPA2CM

<pre>
root@530226e28371:/# <b>wine cmd</b>
Microsoft Windows 6.1.7601 (4.3)

Z:\><b>cd \msys64\home\arpa2\arpa2cm</b>

Z:\msys64\home\arpa2\arpa2cm><b>mkdir build</b>

Z:\msys64\home\arpa2\arpa2cm><b>cd build</b>

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

Z:\msys64\home\arpa2\quick-der\build><b>cmake -G "MinGW Makefiles" "-DCMAKE_INSTALL_PREFIX:PATH=Z:/msys64/mingw64" ..</b>
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

## Building and installing tlspool

<pre>
root@530226e28371:/# <b>wine cmd</b>
Microsoft Windows 6.1.7601 (4.3)

Z:\><b>cd \msys64\home\arpa2\tlspool</b>

Z:\msys64\home\arpa2\tlspool><b>mkdir build</b>

Z:\msys64\home\arpa2\tlspool><b>cd build</b>

Z:\msys64\home\arpa2\tlspool\build><b>cmake -G "MinGW Makefiles" "-DCMAKE_INSTALL_PREFIX:PATH=Z:/msys64/mingw64" "-DCMAKE_C_STANDARD_LIBRARIES:STRING=-lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32 -lwsock32 -lws2_32" ..</b>

-- The C compiler identification is GNU 8.3.0
-- Check for working C compiler: Z:/msys64/mingw64/bin/gcc.exe
-- Check for working C compiler: Z:/msys64/mingw64/bin/gcc.exe -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
CMake Warning at Z:/msys64/mingw64/share/ARPA2CM/modules/MacroGitVersionInfo.cmake:85 (message):
  Git not found; git-versioning uses default 0.20-0.
Call Stack (most recent call first):
  CMakeLists.txt:33 (get_version_from_git)


-- Found Berkeley DB header files in Z:/msys64/mingw64/include
-- Found Berkeley libraries: Z:/msys64/mingw64/lib/libdb.a
-- Found GnuTLS: Z:/msys64/mingw64/lib/libgnutls.dll.a  
-- Found PkgConfig: Z:/msys64/mingw64/bin/pkg-config.exe (found version "0.29.2") 
-- Found GnuTLSDane: Z:/msys64/mingw64/lib/libgnutls-dane.dll.a  
-- Found Libldns: Z:/msys64/mingw64/lib/libldns.dll.a  
-- Found LibTASN1: Z:/msys64/mingw64/lib/libtasn1.dll.a  
-- Found OpenLDAP: Z:/msys64/mingw64/lib/libldap.dll.a  
-- Found P11-Kit: Z:/msys64/mingw64/lib/libp11-kit.dll.a  
-- Found unbound in Z:/msys64/mingw64/include
-- Found Unbound: Z:/msys64/mingw64/lib/libunbound.dll.a  
-- The following OPTIONAL packages have been found:

 * PkgConfig

-- The following REQUIRED packages have been found:

 * ARPA2CM (required version >= 0.5), CMake modules for ARPA2 projects, <https://github.com/arpa2/arpa2cm/>
   Required for the CMake build system for 
 * BDB, Berkeley DB storage, <http://www.oracle.com/database/berkeley-db>
 * GnuTLS
 * GnuTLSDane, GnuTLS DANE extensions, <https://www.gnutls.org/>
 * Libldns, simplify DNS programming, <https://github.com/threatstack/libldns>
 * LibTASN1, ASN.1 library used by GnuTLS, <http://www.gnu.org/software/libtasn1/>
 * OpenLDAP
 * P11-Kit, PKCS#11 module loader, <https://p11-glue.freedesktop.org/p11-kit.html>
 * Quick-DER
 * Unbound

-- Building TLSPool tests
.. run 'make test' to run them.
-- Configuring done
-- Generating done
-- Build files have been written to: Z:/msys64/home/arpa2/tlspool/build

Z:\msys64\home\arpa2\tlspool\build><b>mingw32-make tlspool</b>
Scanning dependencies of target tlspool
[  5%] Building C object src/CMakeFiles/tlspool.dir/cache.c.obj
[ 11%] Building C object src/CMakeFiles/tlspool.dir/config.c.obj
[ 16%] Building C object src/CMakeFiles/tlspool.dir/ctlkey.c.obj
[ 22%] Building C object src/CMakeFiles/tlspool.dir/daemon.c.obj
[ 27%] Building C object src/CMakeFiles/tlspool.dir/donai.c.obj
[ 33%] Building C object src/CMakeFiles/tlspool.dir/error.c.obj
[ 38%] Building C object src/CMakeFiles/tlspool.dir/lidentry.c.obj
[ 44%] Building C object src/CMakeFiles/tlspool.dir/manage.c.obj
[ 50%] Building C object src/CMakeFiles/tlspool.dir/online.c.obj
Z:\msys64\home\arpa2\tlspool\src\online.c: In function 'ldap_getattr_first':
Z:\msys64\home\arpa2\tlspool\src\online.c:1049:5: warning: passing argument 7 of 'ldap_search_st' from incompatible pointer type [-Wincompatible-pointer-types]
     &ldap_timeout, &dta->ldap_attr_search);
     ^~~~~~~~~~~~~
In file included from Z:\msys64\home\arpa2\tlspool\src\online.c:35:
Z:/msys64/mingw64/x86_64-w64-mingw32/include/winldap.h:396:136: note: expected 'struct l_timeval *' but argument is of type 'struct timeval *'
   WINLDAPAPI ULONG LDAPAPI ldap_search_st(LDAP *ld,PCHAR base,ULONG scope,PCHAR filter,PCHAR attrs[],ULONG attrsonly,struct l_timeval *timeout,LDAPMessage **res);
                                                                                                                      ~~~~~~~~~~~~~~~~~~^~~~~~~
[ 55%] Building C object src/CMakeFiles/tlspool.dir/pgp.c.obj
[ 61%] Building C object src/CMakeFiles/tlspool.dir/pinentry.c.obj
[ 66%] Building C object src/CMakeFiles/tlspool.dir/remote.c.obj
[ 72%] Building C object src/CMakeFiles/tlspool.dir/service.c.obj
[ 77%] Building C object src/CMakeFiles/tlspool.dir/starttls.c.obj
Z:\msys64\home\arpa2\tlspool\src\starttls.c: In function 'clisrv_cert_retrieve':
Z:\msys64\home\arpa2\tlspool\src\starttls.c:1557:148: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 fprintf (stderr, "DEBUG: clisrv_cert_retrieve() sets *pcert to 0x%lx (length %d)... {pubkey = 0x%lx, cert= {data = 0x%lx, size=%ld}, type=%ld}\n", (long) *pcert, *pcert_length, (long) (*pcert)->pubkey, (long) (*pcert)->cert.data, (long) (*pcert)->cert.size, (long) (*pcert)->type);
                                                                                                                                                    ^
Z:\msys64\home\arpa2\tlspool\src\starttls.c:1557:178: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 fprintf (stderr, "DEBUG: clisrv_cert_retrieve() sets *pcert to 0x%lx (length %d)... {pubkey = 0x%lx, cert= {data = 0x%lx, size=%ld}, type=%ld}\n", (long) *pcert, *pcert_length, (long) (*pcert)->pubkey, (long) (*pcert)->cert.data, (long) (*pcert)->cert.size, (long) (*pcert)->type);
                                                                                                                                                                                  ^
Z:\msys64\home\arpa2\tlspool\src\starttls.c:1557:203: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 fprintf (stderr, "DEBUG: clisrv_cert_retrieve() sets *pcert to 0x%lx (length %d)... {pubkey = 0x%lx, cert= {data = 0x%lx, size=%ld}, type=%ld}\n", (long) *pcert, *pcert_length, (long) (*pcert)->pubkey, (long) (*pcert)->cert.data, (long) (*pcert)->cert.size, (long) (*pcert)->type);
                                                                                                                                                                                                           ^
[ 83%] Building C object src/CMakeFiles/tlspool.dir/trust.c.obj
[ 88%] Building C object src/CMakeFiles/tlspool.dir/validate.c.obj
[ 94%] Building C object src/CMakeFiles/tlspool.dir/windows/syslog.c.obj
[100%] Linking C executable tlspool.exe
[100%] Built target tlspool

Z:\msys64\home\arpa2\tlspool\build><b>copy src\tlspool.exe z:\msys64\mingw64\bin</b>

Z:\msys64\home\arpa2\tlspool\build><b>mingw32-make tlspool_shared</b>
Scanning dependencies of target _libtlspool
[ 20%] Building C object lib/CMakeFiles/_libtlspool.dir/libtlspool.c.obj
Z:\msys64\home\arpa2\tlspool\lib\libtlspool.c: In function 'tlspool_open_poolhandle':
Z:\msys64\home\arpa2\tlspool\lib\libtlspool.c:142:27: warning: implicit declaration of function 'time'; did you mean 'ftime'? [-Wimplicit-function-declaration]
    seed = ((unsigned int) time (NULL)) ^ (((unsigned int) me) << 16);
                           ^~~~
                           ftime
[ 40%] Building C object lib/CMakeFiles/_libtlspool.dir/libtlspool_configvar.c.obj
[ 60%] Building C object lib/CMakeFiles/_libtlspool.dir/windows/syslog.c.obj
[ 80%] Building C object lib/CMakeFiles/_libtlspool.dir/windows/socketpair.c.obj
[ 80%] Built target _libtlspool
Scanning dependencies of target tlspool_shared
[100%] Linking C shared library libtlspool.dll
[100%] Built target tlspool_shared

Z:\msys64\home\arpa2\tlspool\build><b>copy lib\libtlspool.dll   z:\msys64\mingw64\bin</b>
Z:\msys64\home\arpa2\tlspool\build><b>copy lib\libtlspool.dll.a z:\msys64\mingw64\lib</b>

Z:\msys64\home\arpa2\tlspool\build>
</pre>

## Running tlspool
<pre>
root@530226e28371:/# <b>wine cmd /c /msys64/home/tlspool/bin/server.bat</b>
000b:fixme:winediag:start_process Wine Staging 4.3 is a testing version containing experimental patches.
000b:fixme:winediag:start_process Please mention your exact version when filing bug reports on winehq.org.
libudev: udev_has_devtmpfs: name_to_handle_at on /dev: Operation not permitted
  
Z:\>cd \msys64\home\tlspool\bin
  
Z:\msys64\home\tlspool\bin>tlspool -c tlspool.conf.windows
The Winsock 2.2 dll was found okay
002b:fixme:ntdll:NtLockFile I/O completion on lock not implemented yet
002b:fixme:advapi:RegisterEventSourceA ((null),"SoftHSM"): stub
002b:fixme:advapi:RegisterEventSourceW (L"",L"SoftHSM"): stub
002b:fixme:advapi:ReportEventA (0xcafe4242,0x0002,0x0000,0x80000002,(nil),0x0001,0x00000000,0x32f060,(nil)): stub
002b:fixme:advapi:ReportEventW (0xcafe4242,0x0002,0x0000,0x80000002,(nil),0x0001,0x00000000,0x718e0,(nil)): stub
This version ignores all LDAP proxy servers
This version ignores all LDAP proxy servers
TLS Pool started
Compiled against GnuTLS version 3.6.6
Running against acceptable GnuTLS version 3.6.6
Setting server anonymous credentials
Setting client anonymous credentials
Setting client and server certificate credentials
GnuTLS: added 6 protocols, 35 ciphersuites, 18 sig algos and 9 groups into priority list
  
DEBUG: gtls_errno = 0, otfsigcrt == NULL, otfsigkey == NULL
DEBUG: When it matters, gtls_errno = 0, onthefly_issuercrt == NULL, onthefly_issuerkey == NULL
</pre>

On another terminal we run a server using tlspool
<pre>
henris-mbp:wine manson$ <b>docker exec -it winehq bash</b>
root@530226e28371:/# <b>wine /msys64/home/tlspool/bin/testsrvdll.exe</b>
</pre>

On yet another terminal we run a client using tlspool
<pre>
henris-mbp:wine manson$ <b>docker exec -it winehq bash</b>
root@530226e28371:/# <b>wine /msys64/home/tlspool/bin/testclidll.exe localhost</b>
DEBUG: Opening TLS Pool on socket path \\.\pipe\tlspool
GetNamedPipeServerProcessId: ServerProcessId = 42
DEBUG: pid = 42, cryptfd = 80
Sending 1028 byte cmd
0037:fixme:winsock:WS_EnterSingleProtocolW unknown Protocol <0x00000000>
Sending 1028 byte cmd
Bytes Sent: 15
Bytes received: 15, data: this is a test
</pre>

