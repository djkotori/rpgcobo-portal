; RPG-Cobo インストーラー

[Setup]
AppId=RPG-Cobo
AppName=RPG-Cobo
AppVerName=RPG-Cobo
AppVersion=
AppPublisher=djkotori/SuperShark.KK
DefaultDirName={localappdata}\RPG-Cobo Portal
SetupIconFile=portal.ico
UninstallDisplayIcon={app}\work\portal.ico
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
Type: filesandordirs; Name: "{app}"

[Files]
Source: "rpgcobo-portal\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs; Excludes: "tmp\*; log\*; *.ws; *.local *.pdb *_d.*";
Source: "rpgcobo-portal\.git\*"; DestDir: "{app}\.git"; Flags: recursesubdirs createallsubdirs;
Source: "mingit\*"; DestDir: "{localappdata}\rpgcobo\tools\git"; Flags: recursesubdirs createallsubdirs;

[Run]
Filename: "{app}\rpgcobo-portal.exe"; Description: "{cm:RunApp}"; Flags: nowait postinstall skipifsilent

[Icons]
Name: "{group}\RPG-Cobo"; Filename: "{app}\rpgcobo-portal.exe"; IconFilename: "{app}\work\portal.ico"
Name: "{userdesktop}\RPG-Cobo"; Filename: "{app}\rpgcobo-portal.exe"; IconFilename: "{app}\work\portal.ico"
