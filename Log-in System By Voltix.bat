@echo off

timeout 1 >nul /NOBREAK
color 0C
echo Created by: Voltix Gaming
timeout 1 >nul /NOBREAK
color 0C
echo YouTube: http://bit.ly/VoltixG
timeout 1 >nul /NOBREAK
echo Please subscribe for more.
timeout 1 >nul /NOBREAK
start http://bit.ly/VoltixSub
timeout 3 >nul /NOBREAK
cls
color 0f
echo Redirecting you to Log-in screen...
timeout 3 >nul /NOBREAK
cls
goto AccountBin

::This just makes sure you have the right files. Don't mess with this.

:AccountBin
cd %userprofile%\documents
if exist "AccountBin" goto profiles
if not exist "AccountBin" md "AccountBin"
goto profiles

:Profiles
cd %userprofile%\documents\AccountBin
if exist "Profiles" goto home
if not exist "Profiles" md "Profiles"
goto home

:home
cls
title Log-in or register!
color 0f
echo Please select an answer.
echo.
echo.
echo [1] Log-in
echo [2] Sign-up
echo [3] Exit
echo.
echo.
choice /c:123 /n >nul

if errorlevel 3 goto exit
if errorlevel 2 goto signup
if errorlevel 1 goto login
goto home

:login
cls
echo Sign-in: Please enter your username.
echo.
set /p loginuser=:
cd %userprofile%\documents\AccountBin\Profiles\
if not exist %loginuser% goto loginerror
goto lockcheck

:lockcheck
cls
cd %userprofile%\documents\AccountBin\Profiles\%loginuser%\LockedProfile
if exist "Yes".txt goto profilelocked
if not exist "Yes".txt goto continuelogging

:continuelogging

echo Sign-in: Please enter your password.
echo.
set /p loginpass=:
cd %userprofile%\documents\AccountBin\Profiles\%loginuser%
if not exist %loginpass%.bat goto loginerror
echo %date% %time%>>LoggedLogins.txt
goto loginsuccess

:signup
cls
echo Sign-up: Please enter a username.
echo.
set /p username=:

echo Sign-up: Please enter a password.
echo.
set /p password=:

if %password% == %username% goto nopassasuser
cd %userprofile%\documents\AccountBin\Profiles 
if exist "%username%" goto signuperror
if not exist "%username%" md %username%
cd %userprofile%\documents\AccountBin\Profiles\%username%
md LockedProfile
cd %userprofile%\documents\AccountBin\Profiles\%username%\LockedProfile
echo No>>No.txt
cd %userprofile%\documents\AccountBin\Profiles\%username%
echo %password%>>%password%.bat
echo %username%>>%username%.txt
echo Registered: %date% %time%>>LoggedLogins.txt
goto signupsuccess

:selection
cls
title %loginuser%
echo Please select an answer.					%date%
echo.
echo.
echo [1] Profile Settings
echo [2] Folder/File Locker and Unlock
echo [3] Calculator
echo [4] Logout
echo.
echo.
choice /c:1234 /n >nul

::The 1-4 is default and you can edit it to your liking. Make sure the numbering goes from highest to lowest.

if errorlevel 4 goto home
if errorlevel 3 goto calculator
if errorlevel 2 goto lockorunlock
if errorlevel 1 goto profilesettings
goto selection

:profilesettings
cls
echo Please select an answer.
echo.
echo.
echo [1] Change Username
echo [2] Change Password
echo.
echo.
choice /c:12 /n >nul

if errorlevel 2 goto changepassword
if errorlevel 1 goto changeusername

:changeusername
cls
echo Please enter your old username.
echo.
set /p olduser=:

if not %olduser% == %loginuser% goto userchangeerror2

cls
echo Please enter your new username.
echo.
set /p newuser=:

cd %userprofile%\documents\AccountBin\Profiles
if not exist %olduser% goto userchangeerror
if exist %newuser% goto userchangeerror3
if exist %olduser% rename "%olduser%" "%newuser%"
cd %userprofile%\documents\AccountBin\Profiles\%newuser%
rename "%olduser%.txt" "%newuser%.txt"
echo U.C: %date% %time%>>LoggedLogins.txt
goto userchangesuccess

:changepassword
cls
echo Please enter your username.
echo.
set /p passuser=:

cd %userprofile%\documents\AccountBin\Profiles\
if not exist %passuser% goto userchangeerror
if not %passuser% == %loginuser% goto userchangeerror2

cls
echo Please enter your old password.
echo.
set /p oldpass=:

if not %oldpass% == %loginpass% goto notthesame

cls
echo Please enter your new password.
echo.
set /p newpass=:

cd %userprofile%\documents\AccountBin\Profiles\%passuser%
if %loginuser% == %newpass% goto nopassasuser2
rename "%oldpass%.bat" "%newpass%.bat"
echo P.C: %date% %time%>>LoggedLogins.txt
goto passsuccess

:calculator
cls
echo Please type your problem.
echo.
echo.
set /p ans=:
set /a ans=%ans%
echo.
echo.
echo Answer: %ans%
pause >nul
goto selection

:lockorunlock
cls
echo Please select an answer.
echo.
echo [1] Lock
echo [2] Unlock
echo.
choice /c:12 /n >nul

if errorlevel 2 goto folderunlocker2
if errorlevel 1 goto folderlocker2
goto lockorunlock

:folderlocker2
cls
echo Lock: Enter the folder destination.(Exclude the folder name) Ex. C:\Users\YourName\Desktop
echo.
set /p fd=:

:folderlocker
cls
echo Lock: Enter the folder Name. If it is a file; you must add the extension.
echo.
set /p fn=:

cd %fd%
if exist %fn% goto folderlocker3
if not exist %fn% goto folderlockerror

:folderlocker3
cls
cacls %fd%\%fn% /E /P everyone:N
cls
echo Your folder has been locked successfully.
pause >nul
goto selection

:folderunlocker2
cls
echo Unock: Enter the folder destination.(Exclude the folder name) Ex. C:\Users\YourName\Desktop
echo.
set /p fd1=:

:folderunlocker
cls
echo Unlock: Enter the folder Name. If it is a file; you must add the extension.
echo.
set /p fn1=:

cd %fd1%
if exist %fn1% goto folderunlocker3
if not exist %fn1% goto folderunlockerror

:folderunlocker3
cls
cacls %fd1%\%fn1% /E /P everyone:F
cls
echo Your folder has been unlocked successfully.
pause >nul
goto selection

::Error Edit to your liking.
:nopassasuser
echo.
echo You can't have your password as your username.
pause >nul
goto signup

:signuperror
echo.
color 0c
echo It seems this username has already been taken. Please choose another username or log-in.
pause >nul
goto home

:loginerror
echo.
color 0c
echo It seems that you have put in an incorrect username or password. Have you registered?
pause >nul
goto home

:userchangeerror
cls
echo The username you have provided does not exist.
pause >nul
goto selection

:userchangeerror2
cls
echo You cannot change the username or password of someone else's account.
pause >nul
goto selection

:userchangeerror3
cls
echo The username you have provided is already in use.
pause >nul
goto selection


:profilelocked
cls
echo Your profile has been locked. Please contact the computer Administrator.
pause >nul
goto home

:nopassasuser2
echo.
echo You can't have your password as your username.
pause >nul
goto changepassword

:notthesame
cls
echo The old password is not correct.
pause >nul
goto selection

:folderlockerror
cls
echo The folder name you have provided was not found.
pause >nul
goto selection

:folderunlockerror
cls
echo The folder name you have provided was not found.
pause >nul
goto selection


::Success Edit to your liking.
:signupsuccess
echo.
color 0f
echo You have successfully created an account!
pause >nul
goto home

:loginsuccess
echo.
color 0f
echo You have successfully logged in.
timout 2 >nul /NOBREAK
cls
echo Redirecting you to the Selection screen...
timeout 3 >nul
goto selection

:userchangesuccess
cls
echo You have successfully changed your username.
pause >nul
goto home

:passsuccess
cls
echo You have successfully changed your password.
pause >nul
goto home
