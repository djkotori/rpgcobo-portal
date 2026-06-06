param(
    [string]$GitPath,
    [string]$RepoPath
)

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = "Stop"

Set-Location "$RepoPath"

$cdir = Get-Location
Write-Output "GIT HARD-RESET BEGIN AT : $cdir"

&"$GitPath" reset --hard;
if( $LASTEXITCODE -ne 0) { exit $LASTEXITCODE };

&"$GitPath" lfs checkout;
exit $LASTEXITCODE


