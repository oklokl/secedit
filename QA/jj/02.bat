@echo off
cd /d %~dp0
setlocal enabledelayedexpansion
chcp 65001 > nul

REM 전승화님 파워쉘
REM https://kin.naver.com/qna/detail.naver?d1id=1&dirId=104&docId=433227153

set "DropPath=%1 %2"
PowerShell -Command "& {Get-Content """!DropPath!""" -Encoding UTF8 | %%{$_ -replace \"MinimumPasswordAge = 0\",	 \"MinimumPasswordAge = 1\"} | %%{$_ -replace \"MinimumPasswordLength = 0\",	 \"MinimumPasswordLength = 14\"} | %%{$_ -replace \"AAA\",	 \"BBB\"}> cfgout.ini}"
pause
