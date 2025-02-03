$cpuUsage = Get-WmiObject -Class Win32_Processor | Select-Object Name, LoadPercentage
$memoryUsage = Get-WmiObject -Class Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory

$diskUsage = Get-PSDrive -PSProvider FileSystem | Select-Object Name, Used, Free

$networkAdapters = Get-NetAdapter | Select-Object Name, Status
$internetConnection = Test-NetConnection -ComputerName www.google.com | Select-Object PingSucceeded

$installedSoftware = Get-WmiObject -Query "SELECT * FROM Win32_Product" | Select-Object Name, Version

$report = @"
System status report
=====================

CPU Usage:
--------------
$($cpuUsage | Out-String)

Memory usage:
-----------------
$($memoryUsage | Out-String)

Disk status:
------------
$($diskUsage | Out-String)

Network:
----------------
$($networkAdapters | Out-String)
Internet Connection: $($internetConnection.PingSucceeded)

Installed app:
-----------------
$($installedSoftware | Out-String)
"@

$reportPath = "C:\SystemStatusReport.txt"
$report | Out-File -FilePath $reportPath

Write-Output "Report created:" $reportPath"
