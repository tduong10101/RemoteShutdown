#
# Script: rmtServersShutdown.ps1
# Requirements:  Admin credentials, csv file with DeviceName as header
# Description:  Remote shut down servers base on csv list 
#
# Author: Terry D
# Version 1 - Inital version
#################################################################### 

$serverList = Read-Host -Prompt "List location"

$list = get-content $serverList | convertfrom-csv

$username = Read-Host -Prompt "Username"
$password = Read-Host -Prompt "Password" -AsSecureString

$mycreds = New-Object System.Management.Automation.PSCredential ($username, $password)

#(Get-WmiObject -Class Win32_OperatingSystem -ComputerName "DTAUDA1405KZ" -Credential $mycreds).InvokeMethod("Win32Shutdown",5)

foreach ($s in $serverList){
    (Get-WmiObject -Class Win32_OperatingSystem -ComputerName $s.DeviceName -Credential $mycreds).InvokeMethod("Win32Shutdown",5)
}
