@echo off
if "%1" == "--vendor" (echo Massachusetts Institute of Technology)
if "%1" == "--version" (echo Kerberos 5 release 1.18)
if "%1" == "--libs" (echo -lkrb5 -lcom_err)
