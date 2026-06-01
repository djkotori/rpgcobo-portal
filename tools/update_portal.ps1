Using Module  .\gettool.psm1

param(
    [string]$Gitpath,
    [string]$Tag,
	[int]$Procid
)

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

Write-Output "--------------------------------------------------------"
Write-Output "RPG-Cobo portal is updating to $Tag"


Write-Output "--------------------------------------------------------"
Write-Output "Waiting to exit RPG-Cobo portal process... pid=$Procid"

$ErrorActionPreference = "SilentlyContinue"
while ( 1) {
	$proc = Get-Process -Id $Procid
	if( $Error){
		break;
	}
	Start-Sleep -Milliseconds 200
}
$ErrorActionPreference = "Continue"

Write-Output ""
Write-Output "--------------------------------------------------------"
Write-Output "Checkouting git tag..."

&$Gitpath fetch origin tag $Tag
&$Gitpath reset --hard $Tag
&$Gitpath lfs pull

Write-Output ""
Write-Output "--------------------------------------------------------"
Write-Output "Update completed! restarting RPG-Cobo portal..."

Start-Sleep -Milliseconds 500

$proc = Start-Process -FilePath "rpgcobo-portal.exe" -ArgumentList "-nocheck" -PassThru
while ($proc.MainWindowHandle -eq 0) {
    Start-Sleep -Milliseconds 200
    $proc.Refresh()
}

Write-Output "bye"
Start-Sleep -Milliseconds 4000
exit 0