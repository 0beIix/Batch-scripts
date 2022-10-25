@echo off
rem replace all Path with your path

rem --  create .ps1 with the folowing line to trimm empty spaces -- does not work well in batch
rem "(gc \Path\pc_info.txt) | ? {$_.trim() -ne "" } | set-content \Path\pc_info.txt > C:\Path\trimmer.ps1"

rem -- psexec command to get info 
PsExec.exe \\@C:\Path_to_file\pc.txt cmd /c (echo --- USER --- ^& query user ^& echo --- HOSTNAME --- ^& hostname ^& echo --- RAM ---  ^& wmic memorychip get capacity ^& echo --- CPU --- ^& wmic cpu get name ^& echo --- DISK --- ^& wmic diskdrive get model,size ^& echo --- MAC --- ^& getmac.exe ^& echo --- MOTHERBOARD --- ^& wmic baseboard get manufacturer,serialnumber,product >> //HOSTNAME/Path/pc_info.txt )


rem --  call the powershell script to trimm empty lines
powershell -File C:\Path\trimmer.ps1

type C:\Path\pc_info.txt

pause
