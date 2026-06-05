Using Module  .\gettool.psm1

param()

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8
$ErrorActionPreference = "Stop"

$GIT_DIR = Join-Path $env:LOCALAPPDATA "rpgcobo\tools\git"
$GIT_URL = "https://github.com/git-for-windows/git/releases/download/v2.50.1.windows.1/MinGit-2.50.1-64-bit.zip"
if( -not (Test-Path "$GIT_DIR")) {
	$TMP_ZIP = Join-Path $env:TEMP "mingit_tmp.zip"
	$TMP_DIR = Join-Path $env:TEMP "mingit_tmp"
	Invoke-WebRequest $GIT_URL -OutFile $TMP_ZIP
	if( Test-Path "$TMP_DIR"){
		Remove-Item -Path $TMP_DIR -Recurse -Force
	}
	Expand-Archive -Path $TMP_ZIP -DestinationPath $TMP_DIR
	$TOOLS_DIR = (Join-Path $env:LOCALAPPDATA "rpgcobo\tools")
	if( -not (Test-Path "$TOOLS_DIR")){
		mkdir (Join-Path "$TOOLS_DIR")
	}
	Move-Item -Path $TMP_DIR -Destination $GIT_DIR
}
Write-Output "RESULT:$GIT_DIR\cmd\git.exe"
