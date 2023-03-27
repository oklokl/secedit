@echo off
cd /d %~dp0
setlocal enabledelayedexpansion
chcp 65001 > nul
set "DropPath=%1 %2 %3"
BCDEDIT > nul 

type %DropPath% | powershell -Command "$input | ForEach-Object { $_ -replace \"MinimumPasswordAge = 0\",	 \"MinimumPasswordAge = 1\" }" > %temp%\1.txt
IF ERRORLEVEL 1 goto end

REM 입력 중복될 단어 미리 걸러내기 
findstr /v "ResetLockoutCount LockoutDuration AllowAdministratorLockout FilterAdministratorToken MaxDevicePasswordFailedAttempts SeDenyRemoteInteractiveLogonRight" %temp%\1.txt > %temp%\02.txt
findstr /v "NoConnectedUser ForceKeyProtection RestrictReceivingNTLMTraffic AllowOnlineID SubmitControl UseMachineId MinimumPasswordLengthAudit SmbServerNameHardeningLevel" %temp%\02.txt > %temp%\03.txt
findstr /v "RestrictNTLMInDomain LdapEnforceChannelBinding LDAPServerIntegrity SeDenyBatchLogonRight SeDenyServiceLogonRight LmCompatibilityLevel allownullsessionfallback" %temp%\03.txt > %temp%\04.txt
IF ERRORLEVEL 1 goto end

type %temp%\04.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"MinimumPasswordLength = [ -~]*\",	 \"MinimumPasswordLength = 14\" }" > %temp%\2.txt
IF ERRORLEVEL 1 goto end
type %temp%\2.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"PasswordComplexity = [ -~]*\",	 \"PasswordComplexity = 1\" }" > %temp%\3.txt
IF ERRORLEVEL 1 goto end
type %temp%\3.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"LockoutBadCount = [ -~]*\",	 \"LockoutBadCount = 5`nResetLockoutCount = 60`nLockoutDuration = 60`nAllowAdministratorLockout = 1\" }" > %temp%\4.txt
IF ERRORLEVEL 1 goto end

type %temp%\4.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"ForceLogoffWhenHourExpire = [ -~]*\",	 \"ForceLogoffWhenHourExpire = 1\" }" > %temp%\5.txt
IF ERRORLEVEL 1 goto end
type %temp%\5.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"CachedLogonsCount=[ -~]*\",	 \"CachedLogonsCount=1,0\" }" > %temp%\6.txt
IF ERRORLEVEL 1 goto end
type %temp%\6.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"ForceUnlockLogon=[ -~]*\",	 \"ForceUnlockLogon=4,1\" }" > %temp%\7.txt
IF ERRORLEVEL 1 goto end
type %temp%\7.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"ConsentPromptBehaviorAdmin=[ -~]*\",	 \"ConsentPromptBehaviorAdmin=4,2\" }" > %temp%\8.txt
IF ERRORLEVEL 1 goto end
type %temp%\8.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"EnableVirtualization=[ -~]*\",	 \"EnableVirtualization=4,1`nMACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\FilterAdministratorToken=4,0\" }" > %temp%\9.txt
IF ERRORLEVEL 1 goto end
type %temp%\9.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"LegalNoticeText=[ -~]*\",	 \"LegalNoticeText=7,`nMACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\MaxDevicePasswordFailedAttempts=4,4`nMACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoConnectedUser=4,1\" }" > %temp%\10.txt
IF ERRORLEVEL 1 goto end
type %temp%\10.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"ValidateAdminCodeSignatures=[ -~]*\",	 \"ValidateAdminCodeSignatures=4,1`nMACHINE\Software\Policies\Microsoft\Cryptography\ForceKeyProtection=4,2\" }" > %temp%\11.txt
IF ERRORLEVEL 1 goto end
type %temp%\11.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"FIPSAlgorithmPolicy\\Enabled=[ -~]*\",	 \"FIPSAlgorithmPolicy\Enabled=4,1\" }" > %temp%\12.txt
IF ERRORLEVEL 1 goto end

type %temp%\12.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\13.txt
IF ERRORLEVEL 1 goto end

type %temp%\13.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"NTLMMinClientSec=[ -~]*\",	 \"NTLMMinClientSec=4,537395200\" }" > %temp%\14.txt
IF ERRORLEVEL 1 goto end
type %temp%\14.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"NTLMMinServerSec=[ -~]*\",	 \"NTLMMinServerSec=4,537395200`nMACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\RestrictReceivingNTLMTraffic=4,2\" }" > %temp%\15.txt
IF ERRORLEVEL 1 goto end
type %temp%\15.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"NoLMHash=[ -~]*\",	 \"NoLMHash=4,1`nMACHINE\System\CurrentControlSet\Control\Lsa\pku2u\AllowOnlineID=4,0\" }" > %temp%\16.txt
IF ERRORLEVEL 1 goto end
type %temp%\16.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"RestrictAnonymousSAM=[ -~]*\",	 \"RestrictAnonymousSAM=4,1`nMACHINE\System\CurrentControlSet\Control\Lsa\SubmitControl=4,0`nMACHINE\System\CurrentControlSet\Control\Lsa\UseMachineId=4,1\" }" > %temp%\17.txt
IF ERRORLEVEL 1 goto end
type %temp%\17.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AddPrinterDrivers=[ -~]*\",	 \"AddPrinterDrivers=4,0`nMACHINE\System\CurrentControlSet\Control\SAM\MinimumPasswordLengthAudit=4,7\" }" > %temp%\18.txt
IF ERRORLEVEL 1 goto end
type %temp%\18.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"EnableSecuritySignature=[ -~]*\",	 \"EnableSecuritySignature=4,1\" }" > %temp%\19.txt
IF ERRORLEVEL 1 goto end
type %temp%\19.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"RequireSecuritySignature=[ -~]*\",	 \"RequireSecuritySignature=4,1\" }" > %temp%\20.txt
IF ERRORLEVEL 1 goto end
type %temp%\20.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"RestrictNullSessAccess=[ -~]*\",	 \"RestrictNullSessAccess=4,1`nMACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\SmbServerNameHardeningLevel=4,2\" }" > %temp%\21.txt
IF ERRORLEVEL 1 goto end
type %temp%\21.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"RequireStrongKey=[ -~]*\",	 \"RequireStrongKey=4,1`nMACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\RestrictNTLMInDomain=4,7\" }" > %temp%\22.txt
IF ERRORLEVEL 1 goto end
type %temp%\22.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"SignSecureChannel=[ -~]*\",	 \"SignSecureChannel=4,1`nMACHINE\System\CurrentControlSet\Services\NTDS\Parameters\LdapEnforceChannelBinding=4,2`nMACHINE\System\CurrentControlSet\Services\NTDS\Parameters\LDAPServerIntegrity=4,2\" }" > %temp%\23.txt
IF ERRORLEVEL 1 goto end
type %temp%\23.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"SeNetworkLogonRight = [ -~]*\",	 \"SeNetworkLogonRight = *S-1-5-32-544,*S-1-5-32-545\" }" > %temp%\24.txt
IF ERRORLEVEL 1 goto end
type %temp%\24.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"SeChangeNotifyPrivilege = [ -~]*\",	 \"SeChangeNotifyPrivilege = *S-1-5-19,*S-1-5-20,*S-1-5-32-544,*S-1-5-32-545,*S-1-5-32-551\" }" > %temp%\25.txt
IF ERRORLEVEL 1 goto end
type %temp%\25.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"SeServiceLogonRight = [ -~]*\",	 \"SeServiceLogonRight = *S-1-5-20\" }" > %temp%\26.txt
IF ERRORLEVEL 1 goto end
type %temp%\26.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"SeInteractiveLogonRight = [ -~]*\",	 \"SeInteractiveLogonRight = *S-1-5-32-544,*S-1-5-32-545,*S-1-5-32-551\" }" > %temp%\27.txt
IF ERRORLEVEL 1 goto end
type %temp%\27.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"SeDenyNetworkLogonRight = [ -~]*\",	 \"SeDenyNetworkLogonRight = *S-1-0-0,*S-1-5-113,*S-1-5-14,*S-1-5-17,Guest,*S-1-5-32-546,*S-1-5-32-555,*S-1-5-32-568,*S-1-5-32-575,*S-1-5-32-576,*S-1-5-32-577,*S-1-5-7,*S-1-5-80-0,*S-1-5-9,*S-1-5-32-553,*S-1-5-32-571,*S-1-5-32-580,*S-1-5-32-549,*S-1-5-32-547,*S-1-5-1`nSeDenyBatchLogonRight = *S-1-0-0,*S-1-5-14,*S-1-5-17,Guest,*S-1-5-32-546,*S-1-5-32-555,*S-1-5-32-568,*S-1-5-32-575,*S-1-5-32-576,*S-1-5-32-577,*S-1-5-7,*S-1-5-9,*S-1-5-32-553,*S-1-5-32-571,*S-1-5-32-580,*S-1-5-32-549,*S-1-5-32-547,*S-1-5-32-547,*S-1-5-1`nSeDenyServiceLogonRight = *S-1-0-0,*S-1-5-14,*S-1-5-17,Guest,*S-1-5-32-546,*S-1-5-32-555,*S-1-5-32-568,*S-1-5-32-575,*S-1-5-32-576,*S-1-5-32-577,*S-1-5-7,*S-1-5-9,*S-1-5-32-553,*S-1-5-32-571,*S-1-5-32-580,*S-1-5-32-549,*S-1-5-32-547,*S-1-5-1,*S-1-5-13,*S-1-5-32-549\" }" > %temp%\28.txt
IF ERRORLEVEL 1 goto end
type %temp%\28.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"SeRemoteInteractiveLogonRight = [ -~]*\",	 \"SeRemoteInteractiveLogonRight = Administrator`nSeDenyRemoteInteractiveLogonRight = *S-1-0-0,*S-1-1-0,*S-1-2-0,*S-1-2-1,*S-1-5-113,*S-1-5-14,*S-1-5-17,Guest,*S-1-5-32-544,*S-1-5-32-546,*S-1-5-32-555,*S-1-5-32-568,*S-1-5-32-575,*S-1-5-32-576,*S-1-5-32-577,*S-1-5-7,*S-1-5-80-0,*S-1-5-9,*S-1-5-32-553,*S-1-5-32-571,*S-1-5-32-580,*S-1-5-32-549,*S-1-5-32-547,*S-1-5-1\" }" > %temp%\29.txt
IF ERRORLEVEL 1 goto end

type %temp%\29.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"LimitBlankPasswordUse=[ -~]*\",	 \"LimitBlankPasswordUse=4,1`nMACHINE\System\CurrentControlSet\Control\Lsa\LmCompatibilityLevel=4,5`nMACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\allownullsessionfallback=4,0\" }" > %temp%\30.txt
IF ERRORLEVEL 1 goto end

type %temp%\30.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"SeDenyInteractiveLogonRight = [ -~]*\",	 \"SeDenyInteractiveLogonRight = *S-1-0-0,*S-1-5-14,*S-1-5-17,Guest,*S-1-5-32-546,*S-1-5-32-555,*S-1-5-32-568,*S-1-5-32-575,*S-1-5-32-576,*S-1-5-32-577,*S-1-5-7,*S-1-5-9,*S-1-5-32-553,*S-1-5-32-571,*S-1-5-32-580,*S-1-5-32-549,*S-1-5-32-547,*S-1-5-1\" }" > %temp%\31.txt
IF ERRORLEVEL 1 goto end

type %temp%\31.txt | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > cfgout.ini

REM "20230325 서버 차단 SeDenyServiceLogonRight = *S-1-5-32-558" 
:end

endlocal
pause
