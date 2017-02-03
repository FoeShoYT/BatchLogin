@echo off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

:AccountBin
cd %userprofile%\documents
if exist "AccountBin" goto profiles
if not exist "AccountBin" md "AccountBin"
goto profiles

:profiles
cd %userprofile%\documents\AccountBin
if exist "Profiles" goto home
if not exist "Profiles" md "Profiles"
goto home

:home
cls
color 0f
echo Please select an answer.
echo.
echo.
echo [1] Log-in
echo [2] Sign-up
echo [3] Exit
echo.
echo.
set /p answer=:

if %answer% == 1 goto login
if %answer% == 2 goto signup
if %answer% == 3 exit
goto home

:fail
color 0c
echo.
echo You fail, don't try to get into admin if you are't one!
pause >nul 
goto home

:login
cls
echo Sign-in: Please enter your username.
echo.
set /p loginuser=:

cd %userprofile%\documents\AccountBin\Profiles\%loginuser%
if not exist %loginuser%.txt goto loginerror

echo Sign-in: Please enter your password.
echo.
set /p loginpass=:

if not exist %loginpass%.bat goto loginerror
goto loginsuccess

:signup
cls
echo Sign-up: Please enter a username.
echo.
set /p username=:

echo Sign-up: Please enter a password.
echo.
set /p password=:

cd %userprofile%\documents\AccountBin\Profiles
if exist "%username%" goto signuperror
if not exist "%username%" md %username%
cd %userprofile%\documents\AccountBin\Profiles\%username%
if %password% == %username% goto nopassasuser
if not exist "%password%".bat echo %password%>>%password%.bat
if not exist "%username%".txt echo %username%>>%username%.txt
goto signupsuccess

:nopassasuser
echo.
echo You can't have your password as your username!
pause >nul
goto signup

:signuperror
echo.
color 0c
echo It seems this username has already been taken. Please choose another username or log-in.
pause >nul
goto home


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
pause >nul
goto setthisup

:loginerror
echo.
color 0c
echo It seems that you have put in an incorrect username or password. Have you registered?
pause >nul

:setthisup
cls
echo You need to set this part up your self. Just go into the coding and edit the 
echo code. You can add whatever you want.
pause >nul
goto home