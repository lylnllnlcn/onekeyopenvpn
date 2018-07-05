@ECHO OFF 

taskkill /im speederv2.exe /f
taskkill /im udp2raw.exe /f

ping -n 3 127.1 >nul