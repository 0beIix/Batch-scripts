@echo off

rem --  set variable 
set /p ComputerName="Enter target IP or HOSTNAME: "

rem --  create .txt with target ip because psexec wont accept variables
echo %ComputerName%>pc.txt
rem --  create trimmer.ps1 to trimm empty spaces -- does not work well in batch
rem (gc \info\pc_info.txt) | ? {$_.trim() -ne "" } | set-content \info\pc_info.txt > C:\info\trimmer.ps1


rem -- psexec command to get info 
REM -- !! specify your hostname or ip at the end of this command //HOSTNAME/info/pc_info.txt !!
PsExec.exe \\@pc.txt cmd /c (echo --- USER --- ^& query user ^& echo --- HOSTNAME --- ^& hostname ^& echo --- RAM ---  ^& wmic memorychip get capacity ^& echo --- CPU --- ^& wmic cpu get name ^& echo --- DISK --- ^& wmic diskdrive get model,size ^& echo --- MAC --- ^& getmac.exe ^& echo --- MOTHERBOARD --- ^& wmic baseboard get manufacturer,serialnumber,product >> //HOSTNAME/info/pc_info.txt )


rem --  call the powershell script to trimm empty lines
powershell -File C:\info\trimmer.ps1


pause


