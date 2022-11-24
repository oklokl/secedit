@echo off
setlocal enabledelayedexpansion
chcp 65001 > nul

REM 전승환님 배치 파일
REM https://kin.naver.com/qna/detail.naver?d1id=1&dirId=104&docId=433227153

:loop
set /a "AA=%RANDOM% %% 8"
set /a "BB=0"
for  %%a in (Red Green Blue Black White Cyan Magenta) do set /a "BB=!BB!+1" && if "!AA!" EQU "!BB!" set "A=%%a"
set /a "AA=%RANDOM% %% 6"
set /a "BB=0"
for  %%a in (Red Yellow Blue Black White) do set /a "BB=!BB!+1" && if "!AA!" EQU "!BB!" set "B=%%a"
if "!A!" EQU "!B!" goto :loop
if "!A!" EQU "" goto :loop
if "!B!" EQU "" goto :loop
powershell write-host -fore !A! -back !B! {안녕하세요};
echo !AA!=!A!,  !BB!=!B!
goto :loop
