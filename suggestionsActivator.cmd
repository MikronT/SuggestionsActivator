@echo off
chcp 65001
set key1=no
set key2=00000000



call :logo
echo.^(^?^) Ви впевнені^? ^(Enter або закрийте вікно^)
pause>nul

call :logo
echo.^(^!^) Запуск [ADSI] Suggestions Activator...
>nul timeout /nobreak /t 1





:question
set /p answer=^(^?^) Увімкнути підказки^? (y/n) ^> 
if "%answer%" == "y" (
  set key1=yes
  set key2=00000001
) else if "%answer%" NEQ "n" goto :question
>nul timeout /nobreak /t 1

echo.^(^!^) Оновлення параметрів Реєстра Windows...
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete /v AutoSuggest         /t REG_SZ    /d %key1% /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete /v "Append Completion" /t REG_SZ    /d %key1% /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced     /v Start_TrackProgs    /t REG_DWORD /d %key2% /f





call :logo
echo.^(^!^) Роботу завершено^!
>nul timeout /t 10
exit





:logo
title [ADSI] Suggestions Activator
color 0b
cls
echo.
echo.    [ADSI] ==^> Suggestions Activator
echo.
exit /b
