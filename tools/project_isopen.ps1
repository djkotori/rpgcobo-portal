param(
    [string]$ExePath
)

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

$escaped = $ExePath.Replace('\', '\\')

#$running = Get-Process | Where-Object { $_.Path -eq $ExePath }
# $running = Get-CimInstance Win32_Process -Filter "ExecutablePath='$escaped'"
# $running = Get-WmiObject Win32_Process -Filter "ExecutablePath='$escaped'"
$running = Get-CimInstance Win32_Process | Where-Object { $_.ExecutablePath -eq $ExePath }
# $running = wmic process where "ExecutablePath='$escaped'" get ProcessId

Write-Output $running
if ($running) {
    Write-Output "1"
} else {
    Write-Output "0"
}
