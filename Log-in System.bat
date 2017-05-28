@echo off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

timeout 1 >nul
color 0C
echo Created by: Voltix Gaming
timeout 1 >nul
color 0C
echo YouTube: http://bit.ly/VoltixG
timeout 1 >nul
echo Please subscribe for more.
timeout 3 >nul
cls
color 0f
echo Redirecting you to Log-in screen...
timeout 3 >nul
cls
goto AccountBin


::This just makes sure you have the right files.

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
set /p answer=:

if %answer% == 1 goto login
if %answer% == 2 goto signup
if %answer% == 3 exit
if %answer% == admin goto selection
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


:signupsuccess
echo.
color 0f
echo You have successfully created an account!
pause >nul
goto selection

:loginsuccess
echo.
color 0f
echo You have successfully logged in.
pause >nul
goto selection

:loginerror
echo.
color 0c
echo It seems that you have put in an incorrect username or password. Have you registered?
pause >nul
goto home

:profilelocked
cls
echo Your profile has been locked. Please contact the computer Administrator.
pause >nul
goto home


:selection
cls
title %loginuser%
echo Please select an answer.					%date%
echo.
echo.
echo [1] Change Username
echo [2] Change Password
echo [3] Calculator
echo [4] TicTacToe(Created by Coderztuts)
echo [5] Logout
echo.
echo.
set/p answer2=:

::The 1-4 is default and you can edit it to your liking.

if %answer2% == 1 goto changeusername
if %answer2% == 2 goto changepassword
if %answer2% == 3 goto calculator
if %answer2% == 4 goto tictactoe
if %answer2% == 5 goto home
goto selection

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
if not %olduser% == %loginuser% goto userchangeerror2
if not exist %olduser% goto userchangeerror
if exist %newuser% goto userchangeerror3
if exist %olduser% rename "%olduser%" "%newuser%"
cd %userprofile%\documents\AccountBin\Profiles\%newuser%
rename "%olduser%.txt" "%newuser%.txt"
echo U.C: %date% %time%>>LoggedLogins.txt
goto userchangesuccess

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

:userchangesuccess
cls
echo You have successfully changed your username.
pause >nul
goto home

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

:passsuccess
cls
echo You have successfully changed your password.
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

:adminpass
cls
echo Please enter the password.
echo.
set /p adminpass=:

if not %adminpass% == admin1 goto home
if %adminpass% == admin1 goto admin

:admin
cls
title %loginuser%
echo Please select an answer.					%date%
echo.
echo.
echo [1] Change Username
echo [2] Change Password
echo [3] Calculator
echo [4] Logout
echo.
echo.
set/p answer2=:

::The 1-4 is default and you can edit it to your liking.

if %answer2% == 1 goto changeusername
if %answer2% == 2 goto changepassword
if %answer2% == 3 goto calculator
if %answer2% == 4 goto home
goto selection

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

:tictactoe
set a1=1
set a2=2
set a3=3
set a4=4
set a5=5
set a6=6
set a7=7
set a8=8
set a9=9
 
set s1=A
set s2=A
set s3=A
set s4=A
set s5=A
set s6=A
set s7=A
set s8=A
set s9=A
 
set attack=0
set cycle=0
set moves=0
 
:Start
cls
echo %a1% %a2% %a3%
echo %a4% %a5% %a6%
echo %a7% %a8% %a9%
echo.
echo Enter a number.
echo.
set /p input=:
if %input% EQU 1 goto d1
if %input% EQU 2 goto d2
if %input% EQU 3 goto d3
if %input% EQU 4 goto d4
if %input% EQU 5 goto d5
if %input% EQU 6 goto d6
if %input% EQU 7 goto d7
if %input% EQU 8 goto d8
if %input% EQU 9 goto d9
goto Start
 
:d1
if %s1% EQU N goto Start
set a1=X
set s1=N
set /a moves=%moves%+1
goto check
 
:d2
if %s2% EQU N goto Start
set a2=X
set s2=N
set /a moves=%moves%+1
goto check
 
:d3
if %s3% EQU N goto Start
set a3=X
set s3=N
set /a moves=%moves%+1
goto check
 
:d4
if %s4% EQU N goto Start
set a4=X
set s4=N
set /a moves=%moves%+1
goto check
 
:d5
if %s5% EQU N goto Start
set a5=X
set s5=N
set /a moves=%moves%+1
goto check
 
:d6
if %s6% EQU N goto Start
set a6=X
set s6=N
set /a moves=%moves%+1
goto check
 
:d7
if %s7% EQU N goto Start
set a7=X
set s7=N
set /a moves=%moves%+1
goto check
 
:d8
if %s8% EQU N goto Start
set a8=X
set s8=N
set /a moves=%moves%+1
goto check
 
:d9
if %s9% EQU N goto Start
set a9=X
set s9=N
set /a moves=%moves%+1
goto check
 
:check
::Horizontal
if %a1%+%a2%+%a3% EQU X+X+X goto win
if %a4%+%a5%+%a6% EQU X+X+X goto win
if %a7%+%a8%+%a9% EQU X+X+X goto win
::Vertical
if %a1%+%a4%+%a7% EQU X+X+X goto win
if %a2%+%a5%+%a8% EQU X+X+X goto win
if %a3%+%a6%+%a9% EQU X+X+X goto win
::Diagonal
if %a1%+%a5%+%a9% EQU X+X+X goto win
if %a3%+%a5%+%a7% EQU X+X+X goto win
if %moves% EQU 9 goto draw
goto middle
 
:middle
if %s5% EQU N goto mon
set a5=O
set s5=N
set /a moves=%moves%+1
goto moncheck
 
:mon
if %moves% GEQ 1 goto Offence
if %moves% EQU 9 goto draw
 
:Offence
::First Line Horizontal
if %a1%+%a2%+%a3% EQU O+O+3 goto a3set
if %a1%+%a2%+%a3% EQU 1+O+O goto a1set
if %a1%+%a2%+%a3% EQU O+2+O goto a2set
 
::Second Line Horizontal
if %a4%+%a5%+%a6% EQU O+O+6 goto a6set
if %a4%+%a5%+%a6% EQU O+5+O goto a5set
if %a4%+%a5%+%a6% EQU 4+O+O goto a4set
 
::Third Line Horizontal
if %a7%+%a8%+%a9% EQU O+O+9 goto a9set
if %a7%+%a8%+%a9% EQU 7+O+O goto a7set
if %a7%+%a8%+%a9% EQU O+8+O goto a8set
 
::First Line Vertical
if %a1%+%a4%+%a7% EQU 1+O+O goto a1set
if %a1%+%a4%+%a7% EQU O+4+O goto a4set
if %a1%+%a4%+%a7% EQU O+O+7 goto a7set
 
::Second Line Vertical 
if %a2%+%a5%+%a8% EQU 2+O+O goto a2set
if %a2%+%a5%+%a8% EQU O+5+O goto a5set
if %a2%+%a5%+%a8% EQU O+O+8 goto a8set
 
::Third Line Vertical
if %a3%+%a6%+%a9% EQU O+O+9 goto a9set
if %a3%+%a6%+%a9% EQU 3+O+O goto a3set
if %a3%+%a6%+%a9% EQU O+6+O goto a6set
 
::Left to Right
if %a1%+%a5%+%a9% EQU O+5+O goto a5set
if %a1%+%a5%+%a9% EQU O+O+9 goto a9set
if %a1%+%a5%+%a9% EQU 1+O+O goto a1set
 
::Right to Left
if %a3%+%a5%+%a7% EQU O+O+7 goto a7set
if %a3%+%a5%+%a7% EQU O+5+O goto a5set
if %a3%+%a5%+%a7% EQU 3+O+O goto a3set
goto Defence
 
:Defence
::First Line Horizontal
if %a1%+%a2%+%a3% EQU X+X+3 goto a3set
if %a1%+%a2%+%a3% EQU 1+X+X goto a1set
if %a1%+%a2%+%a3% EQU X+2+X goto a2set
 
::Second Line Horizontal
if %a4%+%a5%+%a6% EQU X+X+6 goto a6set
if %a4%+%a5%+%a6% EQU X+5+X goto a5set
if %a4%+%a5%+%a6% EQU 4+X+X goto a4set
 
::Third Line Horizontal
if %a7%+%a8%+%a9% EQU X+X+9 goto a9set
if %a7%+%a8%+%a9% EQU 7+X+X goto a7set
if %a7%+%a8%+%a9% EQU X+8+X goto a8set
 
::First Line Vertical
if %a1%+%a4%+%a7% EQU 1+X+X goto a1set
if %a1%+%a4%+%a7% EQU X+4+X goto a4set
if %a1%+%a4%+%a7% EQU X+X+7 goto a7set
 
::Second Line Vertical 
if %a2%+%a5%+%a8% EQU 2+X+X goto a2set
if %a2%+%a5%+%a8% EQU X+5+X goto a5set
if %a2%+%a5%+%a8% EQU X+X+8 goto a8set
 
::Third Line Vertical
if %a3%+%a6%+%a9% EQU X+X+9 goto a9set
if %a3%+%a6%+%a9% EQU 3+X+X goto a3set
if %a3%+%a6%+%a9% EQU X+6+X goto a6set
 
::Left to Right
if %a1%+%a5%+%a9% EQU X+5+X goto a5set
if %a1%+%a5%+%a9% EQU X+X+9 goto a9set
if %a1%+%a5%+%a9% EQU 1+X+X goto a1set
 
::Right to Left
if %a3%+%a5%+%a7% EQU X+X+7 goto a7set
if %a3%+%a5%+%a7% EQU X+5+X goto a5set
if %a3%+%a5%+%a7% EQU 3+X+X goto a3set
goto Random
 
:Random
set /a attack=%Random% * 9 / 32768 +1
set /a cycle=%cycle%+1
if %cycle% LEQ 1 goto Random
if %attack% EQU 1 goto a1set
if %attack% EQU 2 goto a2set
if %attack% EQU 3 goto a3set
if %attack% EQU 4 goto a4set
if %attack% EQU 5 goto a5set
if %attack% EQU 6 goto a6set
if %attack% EQU 7 goto a7set
if %attack% EQU 8 goto a8set
if %attack% EQU 9 goto a9set
goto Random
 
:a1set
if %s1% EQU N goto Random
set a1=O
set s1=N
set /a moves=%moves%+1
goto moncheck
 
:a2set
if %s2% EQU N goto Random
set a2=O
set s2=N
set /a moves=%moves%+1
goto moncheck
 
:a3set
if %s3% EQU N goto Random
set a3=O
set s3=N
set /a moves=%moves%+1
goto moncheck
 
:a4set
if %s4% EQU N goto Random
set a4=O
set s4=N
set /a moves=%moves%+1
goto moncheck
 
:a5set
if %s5% EQU N goto Random
set a5=O
set s5=N
set /a moves=%moves%+1
goto moncheck
 
:a6set
if %s6% EQU N goto Random
set a6=O
set s6=N
set /a moves=%moves%+1
goto moncheck
 
:a7set
if %s7% EQU N goto Random
set a7=O
set s7=N
set /a moves=%moves%+1
goto moncheck
 
:a8set
if %s8% EQU N goto Random
set a8=O
set s8=N
set /a moves=%moves%+1
goto moncheck
 
:a9set
if %s9% EQU N goto Random
set a9=O
set s9=N
set /a moves=%moves%+1
goto moncheck
 
:moncheck
::Horizontal
if %a1%+%a2%+%a3% EQU O+O+O goto lose
if %a4%+%a5%+%a6% EQU O+O+O goto lose
if %a7%+%a8%+%a9% EQU O+O+O goto lose
::Vertical
if %a1%+%a4%+%a7% EQU O+O+O goto lose
if %a2%+%a5%+%a8% EQU O+O+O goto lose
if %a3%+%a6%+%a9% EQU O+O+O goto lose
::Diagonal
if %a1%+%a5%+%a9% EQU O+O+O goto lose
if %a3%+%a5%+%a7% EQU O+O+O goto lose
if %moves% EQU 9 goto draw
goto Start
 
:win
echo You Won
pause >nul
goto selection
 
:lose
echo You Lost
pause >nul
goto selection
 
:draw
echo It Was A Draw
pause >nul
goto selection
