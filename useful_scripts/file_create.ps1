param (
    [string]$fileName,
    [string]$subDirectory = ""  # Varsayılan olarak boş, eğer dizin verilirse eklenir
)

$baseDirectory = "C:\Users\Admin\Desktop\dey"

$finalDirectory = if ($subDirectory) { Join-Path -Path $baseDirectory -ChildPath $subDirectory } else { $baseDirectory }

$filePath = Join-Path -Path $finalDirectory -ChildPath "$fileName.txt"


if (-not (Test-Path -Path $filePath)) {
    New-Item -Path $filePath -ItemType File
    Write-Host "Dosya oluşturuldu: $filePath"
} else {
    Write-Host "Dosya zaten mevcut: $filePath"
}
Set-Variable -Name filePath -Value $filePath -Scope Global
