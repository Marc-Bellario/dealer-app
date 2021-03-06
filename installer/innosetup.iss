; Inno Setup Script Auto generated by Cava Packager.
; DO NOT ALTER THIS SCRIPT. IT WILL BE OVERWRITTEN BY CAVA PACKAGER. TAKE A COPY TO USE AS A TEMPLATE!
; SEE THE INNO SETUP DOCUMENTATION FOR DETAILS ON ALTERING A COPY OF THIS SCRIPT!

[Setup]
AppID={{5AA5806E-6C03-1014-88E4-DC90ADE64201}
AppName=dealer_app
AppVersion=0.0.0.9
AppVerName=dealer_app 0.0.0.9
AppPublisher=will
DefaultDirName={pf}\MyApp
DisableDirPage=no
DefaultGroupName=My Application
DisableProgramGroupPage=no
LicenseFile=
OutputDir=C:\temp\faz3\installer
OutputBaseFilename=app-installer-msw-x86-0-0-0
SetupIconFile=C:\Program Files\Cava Packager 2.0\res\image\setup2.ico
Compression=lzma/Max
SolidCompression=true
AppCopyright=Copyright (C) 2013 will
TimeStampsInUTC=true
OutputManifestFile=C:\temp\faz3\installer\innosetup.manifest
InternalCompressLevel=Max
ShowLanguageDialog=no
UninstallDisplayName=dealer_app
VersionInfoVersion=0.0.0.9
VersionInfoCompany=will
VersionInfoDescription=dealer_app Installer
VersionInfoTextVersion=dealer_app Installer 0.0.0.9
VersionInfoCopyright=Copyright (C) 2013 will
VersionInfoProductName=dealer_app
VersionInfoProductVersion=0.0.0.9
UninstallFilesDir={app}\bin
MinVersion=,5.1.2600
PrivilegesRequired=lowest
UsePreviousSetupType=false
UsePreviousTasks=false
UsePreviousAppDir=false
UsePreviousGroup=false
UsePreviousUserInfo=false
UsePreviousLanguage=false

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";

[Files]
Source: C:\temp\faz3\release\MyApp\*; DestDir: {app}; Flags: ignoreversion recursesubdirs createallsubdirs restartreplace overwritereadonly uninsrestartdelete uninsremovereadonly replacesameversion 32bit; Excludes: do-install.exe; 
Source: C:\temp\faz3\release\MyApp\bin\do-install.exe; DestDir: {app}\bin; Flags: deleteafterinstall skipifsourcedoesntexist 32bit;

[Run]
Filename: {app}\bin\do-install.exe; WorkingDir: {app}\bin; Flags: RunHidden 32bit SkipIfDoesntExist; StatusMsg: "Running post installation tasks .... Please Wait"; 

[Icons]
Name: "{group}\{cm:UninstallProgram,dealer_app}"; Filename: "{uninstallexe}"

[Languages]
Name: en; MessagesFile: "compiler:Default.isl"
Name: eu_ES; MessagesFile: "compiler:Languages\Basque.isl"
Name: pt_BR; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: ca; MessagesFile: "compiler:Languages\Catalan.isl"
Name: cs; MessagesFile: "compiler:Languages\Czech.isl"
Name: da; MessagesFile: "compiler:Languages\Danish.isl"
Name: nl; MessagesFile: "compiler:Languages\Dutch.isl"
Name: fi; MessagesFile: "compiler:Languages\Finnish.isl"
Name: fr; MessagesFile: "compiler:Languages\French.isl"
Name: de; MessagesFile: "compiler:Languages\German.isl"
Name: he; MessagesFile: "compiler:Languages\Hebrew.isl"
Name: hu; MessagesFile: "compiler:Languages\Hungarian.isl"
Name: it; MessagesFile: "compiler:Languages\Italian.isl"
Name: ja; MessagesFile: "compiler:Languages\Japanese.isl"
Name: nn; MessagesFile: "compiler:Languages\Norwegian.isl"
Name: pl; MessagesFile: "compiler:Languages\Polish.isl"
Name: pt; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: ru; MessagesFile: "compiler:Languages\Russian.isl"
Name: sk; MessagesFile: "compiler:Languages\Slovak.isl"
Name: sl; MessagesFile: "compiler:Languages\Slovenian.isl"
Name: es; MessagesFile: "compiler:Languages\Spanish.isl"

