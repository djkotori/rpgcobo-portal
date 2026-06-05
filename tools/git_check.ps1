Using Module  .\gettool.psm1

param()

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = "Stop"

$GIT_DIR = Join-Path $env:LOCALAPPDATA "rpgcobo\tools\git"

if( $gitpath){
	Write-Output "RESULT:$gitpath"
} else {
	Write-Output "RESULT:"
}
