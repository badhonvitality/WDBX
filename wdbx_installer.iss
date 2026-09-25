[Setup]
AppName=WDBX Engine
AppVersion=1.0.0
DefaultDirName={pf}\WDBX
DefaultGroupName=WDBX
OutputBaseFilename=wdbx_installer_win64
Compression=lzma2
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64

[Files]
Source: "wdbx_engine\dist\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\WDBX Command Line"; Filename: "{app}\bin\wdbx.exe"; Parameters: "postgres"
Name: "{group}\Uninstall WDBX"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\bin\wdbx-init.exe"; Parameters: "-D ""{app}\data"" -U postgres"; Description: "Initialize Default Database Cluster"; Flags: postinstall waituntilterminated
