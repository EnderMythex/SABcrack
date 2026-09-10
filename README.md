`StartAllBackCrack.ps1` | Patch the free version of StartAllBack by editing the regedit

`SABcrack.bat` Content to run on hidden window (Place this script into shell:startup for auto patch at every restart) : 
`powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -File "C:\script.ps1"`
