@echo off
setlocal
cd /d "%~dp0"
if "%1" equ "" goto :end
set z_files=%~n1_2.ini

REM https://kin.naver.com/qna/detail.naver?d1id=1&dirId=104&docId=433227153
REM 모모니께서 만들어 주셨음 ㅎㅎ 

copy "%~dpnx1" ".\%z_files%"
set comspec=powershell.exe
rem type 1
for %%i in (
"MinimumPasswordAge,0,3",
"MaximumPasswordAge,42,44"
"ClearTextPassword,0,2"
"EnableGuestAccount,0,1"
) do (
for /f "tokens=1,2,3 delims=, " %%o in ("%%~i") do (
for /f "delims=" %%f in ('^
$in^=get-content .\%z_files% -raw^; [regex]$pz^='%%~o ^= %%~p'^;^
foreach^-object^{$pz.replace^($in^,'%%~o ^= %%~q'^) ^|set-content %z_files%^}^;'
) do (
echo %%f
)))
