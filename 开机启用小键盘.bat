@echo off

rem 获取管理员权限
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

wmic os get Caption | find "Windows xp" > NUL &&  goto Win7orOlder
wmic os get Caption | find "Windows 2003" > NUL &&  goto Win7orOlder
wmic os get Caption | find "Windows Vista" > NUL &&  goto Win7orOlder
wmic os get Caption | find "Windows 7" > NUL &&  goto Win7orOlder
wmic os get Caption | find "Windows 8" > NUL &&  goto Win8orNewer
wmic os get Caption | find "Windows 10" > NUL &&  goto Win8orNewer

:Win7orOlder
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /d 2 /t REG_SZ /f

:Win8orNewer
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /d 80000002 /t REG_SZ /f