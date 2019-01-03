::::::::::::::::::::::::::::::::::::::::::::
:: Elevate.cmd - Version 2
:: Automatically check & get admin rights
::::::::::::::::::::::::::::::::::::::::::::
@echo off
CLS

::=============================
::Running Admin shell
::=============================

:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)

::**************************************
::Invoking UAC for Privilege Escalation
::*************************************

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

::::::::::::::::::::::::::::
::START
::::::::::::::::::::::::::::
REM Run shell as admin (example) - put here code as you like
:choice
choice /C IRC /M "Do you want to [I]nstall or [R]emove or [C]ancel? Please press the button." /T 30 /D C
if errorlevel 3 exit
if errorlevel 2 goto remove
if errorlevel 1 goto install
pause
exit

:install
reg add HKEY_CLASSES_ROOT\Directory\Background\shell\powershellmenu /ve /t REG_SZ /d "Powershell Here"
reg add HKEY_CLASSES_ROOT\Directory\Background\shell\powershellmenu /v Icon /t REG_SZ /d "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
reg add HKEY_CLASSES_ROOT\Directory\Background\shell\powershellmenu\command /ve /t REG_SZ /d "powershell.exe -noexit -command Set-Location -literalPath '%%V'"
pause
exit

:remove
reg delete HKEY_CLASSES_ROOT\Directory\Background\shell\powershellmenu /f
pause
exit
