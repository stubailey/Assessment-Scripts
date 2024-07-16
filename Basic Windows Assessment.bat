OPENFILES >NUL 2>&1

IF ERRORLEVEL 1 (

                ECHO This batch file requires elevated privileges

                EXIT /B 1

)

@echo --------- BASIC WINDOWS RECON ---------  > %computername%report.txt

timeout 1

net config Workstation  >> %computername%report.txt

timeout 1

systeminfo >> %computername%systeminfo.txt

timeout 1

hostname >> %computername%report.txt

timeout 1

@echo --------- net users ---------  >> %computername%report.txt

net users >> %computername%report.txt

timeout 1

@echo --------- ipconfig /all ---------  >> %computername%report.txt

ipconfig /all >> %computername%report.txt

timeout 1

@echo --------- route print ---------  >> %computername%report.txt

route print >> %computername%report.txt

timeout 1

@echo ---------  arp -A ---------  >> %computername%report.txt

arp -A >> %computername%report.txt

timeout 1

@echo ---------  netstat -ano ---------  >> %computername%report.txt

netstat -ano >> %computername%report.txt

timeout 1

@echo --------- netsh firewall show state ---------  >> %computername%report.txt

netsh firewall show state >> %computername%report.txt            

timeout 1

@echo ---------  netsh firewall show config ---------  >> %computername%report.txt

netsh firewall show config >> %computername%report.txt

timeout 1

@echo --------- schtasks /query /fo LIST /v ---------  >> %computername%report.txt

schtasks /query /fo LIST /v >> %computername%report.txt

timeout 1

@echo ---------  tasklist /SVC ---------  >> %computername%report.txt

tasklist /SVC >> %computername%report.txt

timeout 1

@echo ---------  net start ---------  >> %computername%report.txt

net start >> %computername%report.txt

timeout 1

@echo ---------  DRIVERQUERY ---------  >> %computername%report.txt

DRIVERQUERY >> %computername%report.txt

timeout 1

:: @echo --------- reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated ---------  >> %computername%report.txt

:: reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated >> %computername%report.txt

:: timeout 1

:: @echo --------- reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated  ---------  >> %computername%report.txt

:: reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated >> %computername%report.txt

:: timeout 1

@echo --------- dir /s *pass* == *cred* == *vnc* == *.config* ---------  >> %computername%report.txt

dir /s *pass* == *cred* == *vnc* == *.config* >> %computername%report.txt

timeout 1

@echo --------- findstr /si password *.xml *.ini *.txt ---------  >> %computername%report.txt

findstr /si password *.xml *.ini *.txt >> %computername%report.txt

timeout 1

:: @echo --------- reg query HKLM /f password /t REG_SZ /s ---------  >> %computername%report.txt

:: reg query HKLM /f password /t REG_SZ /s >> %computername%report.txt

:: timeout 1

:: @echo --------- reg query HKCU /f password /t REG_SZ /s ---------  >> %computername%report.txt

:: reg query HKCU /f password /t REG_SZ /s >> %computername%report.txt

 :: timeout 1

@echo --------- dir "C:\" ---------  >> %computername%report.txt

dir "C:\" >> %computername%report.txt

timeout 1

@echo --------- dir "C:\Program Files\" ---------  >> %computername%report.txt

dir "C:\Program Files\" >> %computername%report.txt

timeout 1

@echo --------- dir "C:\Program Files (x86)\" ---------  >> %computername%report.txt

dir "C:\Program Files (x86)\" >> %computername%report.txt

timeout 1

@echo --------- dir "C:\Users\" --------- >> %computername%report.txt

dir "C:\Users\" >> %computername%report.txt

timeout 1

@echo --------- C:\Users\Public\ ---------  >> %computername%report.txt

dir "C:\Users\Public\" >> %computername%report.txt

timeout 1

 

echo %computername%report COMPLETE!