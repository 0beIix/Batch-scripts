@echo off
psexec @C:\Path_to_file\computer.txt cmd /c (netsh interface ip set dns "Ethernet" static 192.168.**.** ^& netsh interface ip add dns name="Ethernet" 192.168.**.** index=2)


rem set primary dns
rem netsh interface ip set dns "Ethernet" static 192.168.**.** 
rem set secondary dns
rem netsh interface ip add dns name="Ethernet" 192.168.**.** index=2

rem show config
rem netsh interface ip show config

rem some network interfaces are called different like "Ethernet 2" or "WIFI"
rem change details in acordingly 
