$appSizes = @()

$applications = Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" | Select-Object DisplayName, InstallLocation

foreach ($app in $applications) {
    if ($app.InstallLocation -and (Test-Path $app.InstallLocation)) {
        $size = (Get-ChildItem -Path $app.InstallLocation -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
        $appSize = [PSCustomObject]@{
            Name = $app.DisplayName
            Size = [math]::Round($size / 1MB, 2)
        }
        $appSizes += $appSize
    }
}

$appSizes | ConvertTo-Html -Property Name, Size -Title "Uygulama Boyutları" -PreContent "<h1>Uygulama Boyutları Raporu</h1>" | Out-File "C:\Applications.html"
