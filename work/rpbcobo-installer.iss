; RPG-Cobo インストーラー

[Setup]
AppId=RPG-Cobo
AppName=RPG-Cobo
AppVerName=RPG-Cobo
AppVersion=
AppPublisher=djkotori/SuperShark.KK
DefaultDirName={localappdata}\RPG-Cobo Portal
SetupIconFile=installer.ico
UninstallDisplayIcon={app}\work\installer.ico
DefaultGroupName=RPG-Cobo
OutputBaseFilename=RPG-Cobo-Setup
OutputDir=Output
Compression=lzma
SolidCompression=no
DisableDirPage=no
ArchitecturesInstallIn64BitMode=x64

ShowLanguageDialog=auto

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "ja"; MessagesFile: "compiler:Languages\Japanese.isl"

[CustomMessages]
en.RunApp=Launch RPG-Cobo
ja.RunApp=RPG-Cobo を起動

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[InstallDelete]
Type: filesandordirs; Name: "{app}\.git";
Type: filesandordirs; Name: "{app}\addon";
Type: filesandordirs; Name: "{app}\project";
Type: filesandordirs; Name: "{app}\tools";
Type: filesandordirs; Name: "{app}\util";

[Files]
Source: "setup\.portal.ws"; DestDir: "{app}"; Flags: onlyifdoesntexist
Source: "rpgcobo-portal\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs; Excludes: "tmp\*; log\*; *.ws; *.local *.pdb *_d.*";
Source: "rpgcobo-portal\.git\*"; DestDir: "{app}\.git"; Flags: recursesubdirs createallsubdirs;
Source: "PortableGit-2.54.0-64-bit.7z.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall;

[Run]
Filename: "{app}\rpgcobo-portal.exe"; Description: "{cm:RunApp}"; Flags: nowait postinstall skipifsilent
Filename: "{tmp}\PortableGit-2.54.0-64-bit.7z.exe"; \
  Parameters: "-y -o""{localappdata}\rpgcobo\tools\git_po2540"""; \
  Flags: waituntilterminated; \
  Check: not GitExists

[Icons]
Name: "{group}\RPG-Cobo"; Filename: "{app}\rpgcobo-portal.exe"; IconFilename: "{app}\work\portal.ico"
Name: "{userdesktop}\RPG-Cobo"; Filename: "{app}\rpgcobo-portal.exe"; IconFilename: "{app}\work\portal.ico"; Tasks: desktopicon

[Code]
function GitExists(): Boolean;
var
  ResultCode: Integer;
begin
  // 公式 Git が PATH にあるか確認
  if FileExists(ExpandConstant('C:\Program Files\Git\cmd\git.exe')) then
  begin
    Result := True;
    exit;
  end;
  // RPG-Cobo 専用 Git が既にインストールされているか確認
  if FileExists(ExpandConstant('{localappdata}\rpgcobo\tools\git_po2540\cmd\git.exe')) then
  begin
    Result := True;
    exit;
  end;
  Result := False;
end;
