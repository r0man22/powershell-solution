$securityEvents = Get-WinEvent -LogName Security -MaxEvents 100

$loginEvents = $securityEvents | Where-Object { $_.Id -eq 4624 }

$loginEvents | ForEach-Object {
    $eventTime = $_.TimeCreated
    $username = $_.Properties[5].Value
    Write-Output "Kullanıcı: $username, Oturum Açma Zamanı: $eventTime"
}
