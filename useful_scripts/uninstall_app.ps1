param(
    [string]$app_name
)

$app = Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" | Where-Object { $_.DisplayName -like "*$app_name*" }

if ($app) {
        Write-Host "Application found: $($app.DisplayName)"
        Write-Host "Starting the uninstall process..."

        Start-Process $app.UninstallString
} else {
        Write-Host "The specifield application could not be found."
}
