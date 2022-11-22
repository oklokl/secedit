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
type %temp%\6.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\7.txt
IF ERRORLEVEL 1 goto end
type %temp%\7.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\8.txt
IF ERRORLEVEL 1 goto end
type %temp%\8.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\9.txt
IF ERRORLEVEL 1 goto end
type %temp%\9.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\10.txt
IF ERRORLEVEL 1 goto end
type %temp%\10.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\11.txt
IF ERRORLEVEL 1 goto end
type %temp%\11.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\12.txt
IF ERRORLEVEL 1 goto end
type %temp%\12.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\13.txt
IF ERRORLEVEL 1 goto end
type %temp%\13.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\14.txt
IF ERRORLEVEL 1 goto end
type %temp%\14.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\15.txt
IF ERRORLEVEL 1 goto end
type %temp%\15.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\16.txt
IF ERRORLEVEL 1 goto end
type %temp%\16.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\17.txt
IF ERRORLEVEL 1 goto end
type %temp%\17.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\18.txt
IF ERRORLEVEL 1 goto end
type %temp%\18.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\19.txt
IF ERRORLEVEL 1 goto end
type %temp%\19.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\20.txt
IF ERRORLEVEL 1 goto end
type %temp%\20.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\21.txt
IF ERRORLEVEL 1 goto end
type %temp%\21.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\22.txt
IF ERRORLEVEL 1 goto end
type %temp%\22.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\23.txt
IF ERRORLEVEL 1 goto end
type %temp%\23.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\24.txt
IF ERRORLEVEL 1 goto end
type %temp%\24.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\25.txt
IF ERRORLEVEL 1 goto end
type %temp%\25.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\26.txt
IF ERRORLEVEL 1 goto end
type %temp%\26.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\27.txt
IF ERRORLEVEL 1 goto end
type %temp%\27.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\28.txt
IF ERRORLEVEL 1 goto end
type %temp%\28.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\29.txt
IF ERRORLEVEL 1 goto end
type %temp%\29.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > cfgout.ini

:end

endlocal
pause
