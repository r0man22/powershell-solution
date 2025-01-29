# CPU ve Bellek Kullanımı
$cpuUsage = Get-WmiObject -Class Win32_Processor | Select-Object Name, LoadPercentage
$memoryUsage = Get-WmiObject -Class Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory

# Disk Durumu
$diskUsage = Get-PSDrive -PSProvider FileSystem | Select-Object Name, Used, Free

# Ağ Bağlantıları
$networkAdapters = Get-NetAdapter | Select-Object Name, Status
$internetConnection = Test-NetConnection -ComputerName www.google.com | Select-Object PingSucceeded

# Yüklü Yazılımlar
$installedSoftware = Get-WmiObject -Query "SELECT * FROM Win32_Product" | Select-Object Name, Version

# Raporu Oluşturma
$report = @"
Sistem Durumu Raporu
=====================

CPU Kullanımı:
--------------
$($cpuUsage | Out-String)

Bellek Kullanımı:
-----------------
$($memoryUsage | Out-String)

Disk Durumu:
------------
$($diskUsage | Out-String)

Ağ Bağlantıları:
----------------
$($networkAdapters | Out-String)
Internet Connection: $($internetConnection.PingSucceeded)

Yüklü Yazılımlar:
-----------------
$($installedSoftware | Out-String)
"@

# Raporu Kaydetme
$reportPath = "C:\SistemDurumuRaporu.txt"
$report | Out-File -FilePath $reportPath

Write-Output "Rapor oluşturuldu: $reportPath"
