Using Module  .\gettool.psm1

param()

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = "Stop"

$gitpath = (&where.exe git.exe)

if( $gitpath){
	Write-Output "RESULT:$gitpath"
} else {
	Write-Output "RESULT:"
}
