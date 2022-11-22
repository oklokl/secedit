@echo off
cd /d %~dp0
setlocal enabledelayedexpansion
chcp 65001 > nul
set "DropPath=%1 %2 %3"
BCDEDIT > nul 

type %DropPath% | powershell -Command "$input | ForEach-Object { $_ -replace \"MinimumPasswordAge = 0\",	 \"MinimumPasswordAge = 1\" }" > %temp%\1.txt
IF ERRORLEVEL 1 goto end
type %temp%\1.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"MinimumPasswordLength = 0\",	 \"MinimumPasswordLength = 14\" }" > %temp%\2.txt
IF ERRORLEVEL 1 goto end
type %temp%\2.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"PasswordComplexity = 0\",	 \"PasswordComplexity = 1\" }" > %temp%\3.txt
IF ERRORLEVEL 1 goto end
type %temp%\3.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"ConsentPromptBehaviorAdmin=4,5\",	 \"ConsentPromptBehaviorAdmin=4,2\" }" > %temp%\4.txt
IF ERRORLEVEL 1 goto end
type %temp%\4.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"EnableVirtualization=4,1\",	 \"EnableVirtualization=4,1`nMACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\FilterAdministratorToken=4,0`nMACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\FilterAdministratorToken=4,0\" }" > %temp%\5.txt
IF ERRORLEVEL 1 goto end
type %temp%\5.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"SeNetworkLogonRight = \*S-1-1-0,*S-1-5-32-544,\*S-1-5-32-545,\*S-1-5-32-551\",	 \"SeNetworkLogonRight = *S-1-5-32-544,*S-1-5-32-545\" }" > %temp%\6.txt
IF ERRORLEVEL 1 goto end
type %temp%\6.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"SeDenyNetworkLogonRight = Guest\",	 \"SeDenyNetworkLogonRight = Guest,*S-1-5-32-546,*S-1-0-0,*S-1-5-7,*S-1-5-14,*S-1-5-17,*S-1-5-32-555,*S-1-5-32-568,*S-1-5-32-575,*S-1-5-32-576,*S-1-5-32-577,*S-1-5-9,*S-1-5-113,*S-1-5-80-0,*S-1-5-2,*S-1-5-32-546,*S-1-0-0,*S-1-5-7,*S-1-5-14,*S-1-5-17,*S-1-5-32-555,*S-1-5-32-568,*S-1-5-32-575,*S-1-5-32-576,*S-1-5-32-577,*S-1-5-9,*S-1-5-113,*S-1-5-80-0,*S-1-5-2\" }" > %temp%\7.txt
IF ERRORLEVEL 1 goto end
type %temp%\7.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"SeDenyInteractiveLogonRight = Guest\",	 \"SeDenyInteractiveLogonRight = Guest,*S-1-5-32-546,*S-1-0-0,*S-1-5-7,*S-1-5-14,*S-1-5-17,*S-1-5-32-555,*S-1-5-32-568,*S-1-5-32-575,*S-1-5-32-576,*S-1-5-32-577,*S-1-5-9,*S-1-5-2`nSeDenyBatchLogonRight = Guest,*S-1-5-32-546,*S-1-0-0,*S-1-5-7,*S-1-5-14,*S-1-5-17,*S-1-5-32-555,*S-1-5-32-568,*S-1-5-32-575,*S-1-5-32-576,*S-1-5-32-577,*S-1-5-9,*S-1-5-2`nSeDenyServiceLogonRight = Guest,*S-1-5-32-546,*S-1-0-0,*S-1-5-7,*S-1-5-14,*S-1-5-17,*S-1-5-32-555,*S-1-5-32-568,*S-1-5-32-575,*S-1-5-32-576,*S-1-5-32-577,*S-1-5-9,*S-1-5-2`nSeDenyRemoteInteractiveLogonRight = Guest,*S-1-5-32-546,*S-1-0-0,*S-1-5-7,*S-1-5-113,*S-1-5-14,*S-1-5-17,*S-1-5-32-555,*S-1-5-32-568,*S-1-5-32-575,*S-1-5-32-576,*S-1-5-32-577,*S-1-5-9,*S-1-5-32-544,*S-1-1-0,*S-1-2-0,*S-1-2-1,*S-1-5-80-0,*S-1-5-2,*S-1-5-32-546,*S-1-0-0,*S-1-5-7,*S-1-5-14,*S-1-5-17,*S-1-5-32-555,*S-1-5-32-568,*S-1-5-32-575,*S-1-5-32-576,*S-1-5-32-577,*S-1-5-9,*S-1-5-2`nSeDenyBatchLogonRight = Guest,*S-1-5-32-546,*S-1-0-0,*S-1-5-7,*S-1-5-14,*S-1-5-17,*S-1-5-32-555,*S-1-5-32-568,*S-1-5-32-575,*S-1-5-32-576,*S-1-5-32-577,*S-1-5-9,*S-1-5-2`nSeDenyServiceLogonRight = Guest,*S-1-5-32-546,*S-1-0-0,*S-1-5-7,*S-1-5-14,*S-1-5-17,*S-1-5-32-555,*S-1-5-32-568,*S-1-5-32-575,*S-1-5-32-576,*S-1-5-32-577,*S-1-5-9,*S-1-5-2`nSeDenyRemoteInteractiveLogonRight = Guest,*S-1-5-32-546,*S-1-0-0,*S-1-5-7,*S-1-5-113,*S-1-5-14,*S-1-5-17,*S-1-5-32-555,*S-1-5-32-568,*S-1-5-32-575,*S-1-5-32-576,*S-1-5-32-577,*S-1-5-9,*S-1-5-32-544,*S-1-1-0,*S-1-2-0,*S-1-2-1,*S-1-5-80-0,*S-1-5-2\" }" > %temp%\8.txt
IF ERRORLEVEL 1 goto end
type %temp%\8.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"SeRemoteInteractiveLogonRight = \*S-1-5-32-544,\*S-1-5-32-555\",	 \"SeRemoteInteractiveLogonRight = Administrator\" }" > %temp%\9.txt
IF ERRORLEVEL 1 goto end
type %temp%\9.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > cfgout.ini

:end

endlocal
pause
