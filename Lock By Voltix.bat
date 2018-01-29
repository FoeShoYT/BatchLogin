@echo off

timeout 1 >nul
color 0C
echo Created by: Voltix Gaming
timeout 1 >nul
color 0C
echo YouTube: http://bit.ly/VoltixG
timeout 1 >nul
echo Please subscribe for more.
timeout 1 >nul
start https://www.youtube.com/channel/UCZ6T3dyOeSUY3GpUM0OqhXw?sub_confirmation=1
timeout 3 >nul
cls
color 0f
echo Redirecting you to Password screen...
timeout 3 >nul
cls

:AccountBin
cd %userprofile%\documents
if exist "AccountBin" goto profiles
if not exist "AccountBin" md "AccountBin"
goto profiles

:profiles
cd %userprofile%\documents\AccountBin
if exist "Profiles" goto passwordneeded
if not exist "Profiles" md "Profiles"

:passwordneeded
cls
echo Please enter the password.
echo.
set /p enterpass=:

if not %enterpass% == VoltixG goto passwordfail
if %enterpass% == VoltixG goto home

:home
cls
color 0f
echo Please select an answer.
echo.
echo.
echo [1] Lock Profile
echo [2] Unlock Profile
echo.
echo.
set /p answer=:

if %answer% == 1 goto lockprofile
if %answer% == 2 goto unlockprofile
goto home

:lockprofile
cls
echo Enter the account username:
echo.
set /p lock=:
cd %userprofile%\documents\AccountBin\Profiles\
if exist "%lock%" goto lockcheck
if not exist "%lock%" goto lockerror
goto lockcheck

:lockcheck
cls
cd %userprofile%\documents\AccountBin\Profiles\%lock%\LockedProfile
if exist "Yes".txt goto lockerror2
if not exist "Yes".txt rename "No.txt" "Yes.txt"
cd %userprofile%\documents\AccountBin\Profiles\%lock%
echo Locked: %date% %time%>>LoggedLogins.txt
goto locksuccess

:unlockprofile
cls
echo Enter the account username:
echo.
set /p unlock=:
cd %userprofile%\documents\AccountBin\Profiles\
if not exist %unlock% goto lockerror
cd %userprofile%\documents\AccountBin\Profiles\%unlock%\LockedProfile
if exist "No".txt goto unlockerror
if not exist "No".txt rename "Yes.txt" "No.txt"
cd %userprofile%\documents\AccountBin\Profiles\%unlock%
echo Unlocked: %date% %time%>>LoggedLogins.txt
goto unlocksuccess

::Error
:passwordfail
cls
echo You have entered the wrong password.
pause >nul
goto passwordneeded

:lockerror
cls
echo The username you have provided does not exist.
pause >nul
goto home

:lockerror2
cls
echo The username you have provided is already locked.
pause >nul
goto home

:unlockerror
cls
echo The username you have provided is not locked.
goto home

::Success
:locksuccess
cls
echo The username you have provided has successfully been locked.
pause >nul
goto home

:unlocksuccess
cls
echo The username you have provided has successfully been unlocked.
pause >nul
goto home
