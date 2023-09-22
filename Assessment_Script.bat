echo
cls

echo --------------- R.E.M Batch  ---------------------------------

md %systemdrive%\%computername%-RiskAssessment
cd %systemdrive%\%computername%-RiskAssessment\

rem reg export hklm %systemdrive%\%computername%-RiskAssessment\Reg_HKLM.txt
reg export hklm\software\microsoft\windows %systemdrive%\%computername%-RiskAssessment\Reg_Software.txt
reg export hklm\system\currentcontrolset\services\usbstor %systemdrive%\%computername%-RiskAssessment\Reg_USBStor.txt
reg export "hkey_users\.default\control panel\desktop" %systemdrive%\%computername%-RiskAssessment\Reg_ScreenSaver.txt
net accounts > %systemdrive%\%computername%-RiskAssessment\Password_Policy.csv
move /Y %windir%\security\logs\scesrv.log %systemdrive%\%computername%-RiskAssessment
gpresult /Z > %systemdrive%\%computername%-RiskAssessment\gpresult.txt
net share > %systemdrive%\%computername%-RiskAssessment\Shares.txt
systeminfo > %systemdrive%\%computername%-RiskAssessment\SystemInfo.csv
route print > %systemdrive%\%computername%-RiskAssessment\RoutePrint.txt
net localgroup administrators >> %systemdrive%\%computername%-RiskAssessment\Local_Administrators.txt
net localgroup "power users" >> %systemdrive%\%computername%-RiskAssessment\Local_Power_Users.txt
if exist "%systemroot%\ntds\ntds.dit" (
dsquery group -name "Domain Admins" | dsget group -members -expand >> %systemdrive%\%computername%-RiskAssessment\Domain_Admins.txt
dsquery group -name "Enterprise Admins" | dsget group -members -expand >> %systemdrive%\%computername%-RiskAssessment\Enterprise_Admins.txt
csvde -r "(objectClass=user)" -f %systemdrive%\%computername%-RiskAssessment\reemdc.csv -l cn,givenName,sn,n,ou,lastLogon
)
secedit /export /cfg %systemdrive%\%computername%-RiskAssessment\Secedit.txt
ver | find "6."
if %ERRORLEVEL% == 0 (auditpol /backup /file:%systemdrive%\%computername%-RiskAssessment\Audit.csv)



echo ----------------  Starting WMIC Queries  ---------------------

wmic computersystem list > %systemdrive%\%computername%-RiskAssessment\ComputerSystem.txt
wmic useraccount list > %systemdrive%\%computername%-RiskAssessment\UserAccount.csv
wmic group list > %systemdrive%\%computername%-RiskAssessment\Groups.csv
wmic service get name,startmode,state > %systemdrive%\%computername%-RiskAssessment\Services.csv
wmic volume list brief > %systemdrive%\%computername%-RiskAssessment\Volume.txt
wmic process list > %systemdrive%\%computername%-RiskAssessment\Processes.csv
wmic startup list brief > %systemdrive%\%computername%-RiskAssessment\StartUp.csv
wmic rdtoggle list > %systemdrive%\%computername%-RiskAssessment\Remote_Desktop.txt
wmic qfe > %systemdrive%\%computername%-RiskAssessment\Quick_Fix_Engineering.csv
wmic logicaldisk get description,filesystem,name,size > %systemdrive%\%computername%-RiskAssessment\LogicalDisk.csv
wmic logicaldisk get description,name,freespace,size >> %systemdrive%\%computername%-RiskAssessment\LogicalDisk.txt
wmic volume get lable,freespace,filesystem,capacity,driveletter > %systemdrive%\%computername%-RiskAssessment\Volume.txt
wmic netlogin get name,lastlogon > %systemdrive%\%computername%-RiskAssessment\NetLogon.txt
wmic netlogin get name,badpasswordcount >> %systemdrive%\%computername%-RiskAssessment\NetLogon.txt
wmic desktop get screensaver,screensavertimeout > %systemdrive%\%computername%-RiskAssessment\ScreenSaver.txt
wmic logon get authenticationpackage > %systemdrive%\%computername%-RiskAssessment\Logon.txt
wmic netclient get name > %systemdrive%\%computername%-RiskAssessment\Network_Client_Management.txt
wmic netuse get name,username,connectiontype,localname > %systemdrive%\%computername%-RiskAssessment\Netuse.txt
wmic nteventlog get LogfileName,MaxFileSize,OverWritePolicy > %systemdrive%\%computername%-RiskAssessment\EventLog.csv
wmic os get Version,name,servicepackmajorversion > %systemdrive%\%computername%-RiskAssessment\OS.csv
wmic product get name,Vendor,version > %systemdrive%\%computername%-RiskAssessment\Products.csv

echo ----------------  Part 3  ---------------------

netsh interface ip show config > IP_Configuration.txt
netsh firewall show config > %systemdrive%\%computername%-RiskAssessment\FW_Config.txt
netsh firewall show state >> %systemdrive%\%computername%-RiskAssessment\FW_Config.txt

reg export hklm\system\currentcontrolset\conntrol\lsa %systemdrive%\%computername%-RiskAssessment\Reg_NullSession.txt
reg save HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet %systemdrive%\%computername%-RiskAssessment\usb

netstat -an > %systemdrive%\%computername%-RiskAssessment\Netstat.csv

cacls %windir%\system32\at.exe > %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\ftp.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\append.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\arp.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\attrib.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\bootcfg.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\cacls.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\change.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\chcp.com >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\chglogon.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\chgport.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\chgusr.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\chkdsk.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\chkntfs.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\choice.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\cipher.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\clip.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\cluster.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\cmd.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\command.com >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\shutdown.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\rexec.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\regedt32.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\regedit.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\reg.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\systeminfo.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\wmic.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\usrmgr.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\runas.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt
cacls %windir%\system32\mmc.exe >> %systemdrive%\%computername%-RiskAssessment\FilePermissions.txt


echo ----------------  Results are in "%systemdrive%\%computername%-RiskAssessment" folder  ----------------------