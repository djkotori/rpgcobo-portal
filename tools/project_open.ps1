param(
    [string]$ProjDir
)

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

Write-Output "---------"
Write-Output "SK-OUTPUT popen_launch"

$ErrorActionPreference = "Stop"
Set-Location -Path $ProjDir

$proc = Start-Process -FilePath "$ProjDir\rpgcobo.exe" -ArgumentList "none" -PassThru
while ($proc.MainWindowHandle -eq 0) {
    Start-Sleep -Milliseconds 200
    $proc.Refresh()
}

Write-Output "SK-OUTPUT popen_done"
