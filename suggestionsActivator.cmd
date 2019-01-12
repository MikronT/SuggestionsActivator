@echo off
chcp 65001>nul

net session>nul 2>nul
if %errorLevel% GEQ 1 goto :startAsAdmin





call :logo
echo.^(^i^) Suggestions Activator is running...
timeout /nobreak /t 1 >nul

echo.^(^?^) Are you sure^? ^(Enter or close^)
pause>nul





call :logo
set key1=no
set key2=00000000

:question
set /p answer=^(^?^) Turn on suggestions^? ^(y/n^) ^> 
if "%answer%" == "y" (
  set key1=yes
  set key2=00000001
) else if "%answer%" NEQ "n" goto :question
timeout /nobreak /t 1 >nul



echo.^(^i^) Updating the Windows Registry settings...
for /l %%i in (4,-1,1) do (
  reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete /v AutoSuggest         /t REG_SZ    /d %key1% /f
  reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete /v "Append Completion" /t REG_SZ    /d %key1% /f
  reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced     /v Start_TrackProgs    /t REG_DWORD /d %key2% /f
)
timeout /nobreak /t 1 >nul





call :logo
echo.^(^i^) The work is completed^!
echo.
timeout /nobreak /t 1 >nul

echo.^(^?^) Reload now^? ^(Enter or close^)
pause>nul

echo.^(^!^) Reboot^!
shutdown /r /t 5
timeout /t 4 >nul
exit







:logo
title [MikronT] Suggestions Activator
color 0b
cls
echo.
echo.
echo.    [MikronT] ==^> Suggestions Activator
echo.   =====================================
echo.     See other here:
echo.         github.com/MikronT
echo.
echo.
echo.
exit /b





:startAsAdmin
echo.^(^!^) Please, run as Admin^!
timeout /nobreak /t 3 >nul
exit