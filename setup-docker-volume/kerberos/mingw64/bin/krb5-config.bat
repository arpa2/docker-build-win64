@echo off
if "%1" == "--vendor" (echo Massachusetts Institute of Technology)
if "%1" == "--version" (echo Kerberos for Windows 4.1)
if "%1" == "--libs" (echo -LC:/msys64/mingw64/lib/mit-krb5 -lkrb5 -lcom_err)
if "%1" == "--cflags" (echo -isystem /usr/include/mit-krb5)
