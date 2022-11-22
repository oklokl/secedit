@echo off
cd /d %~dp0
setlocal enabledelayedexpansion
chcp 65001 > nul
set "DropPath=%1 %2 %3"
BCDEDIT > nul 

type %DropPath% | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\1.txt
type %temp%\1.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\2.txt
type %temp%\2.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\3.txt
type %temp%\3.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\4.txt
type %temp%\4.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\5.txt
type %temp%\5.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\6.txt
type %temp%\6.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\7.txt
type %temp%\7.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\8.txt
type %temp%\8.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\9.txt
type %temp%\9.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\10.txt
type %temp%\10.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\11.txt
type %temp%\11.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\12.txt
type %temp%\12.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\13.txt
type %temp%\13.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\14.txt
type %temp%\14.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\15.txt
type %temp%\15.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\16.txt
type %temp%\16.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\17.txt
type %temp%\17.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\18.txt
type %temp%\18.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\19.txt
type %temp%\19.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\20.txt
type %temp%\20.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\21.txt
type %temp%\21.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\22.txt
type %temp%\22.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\23.txt
type %temp%\23.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\24.txt
type %temp%\24.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\25.txt
type %temp%\25.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\26.txt
type %temp%\26.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\27.txt
type %temp%\27.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\28.txt
type %temp%\28.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\29.txt
type %temp%\29.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > cfgout.ini
