rem update application with psexec
rem sometimes its necesary to copy the executable (exe or msi) to the target machine first
rem you can use the copy script for this task

rem path to psexec				computer to install on 			/c = command		C:\path_to_file\app.msi  
C:\Path_to_pstools\PsExec.exe @C:\Path_to_file\computers.txt cmd /c (msiexec.exe /i C:\LibreOfficex.x.x.msi /quiet /norestart)