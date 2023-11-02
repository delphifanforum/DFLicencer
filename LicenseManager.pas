unit LicenseManager;

interface

uses
  SysUtils, IniFiles;

function SaveLicenseKey(const licenseKey: string): Boolean;
function LoadLicenseKey: string;

implementation

const
  LicenseIniFileName = 'MyAppLicense.ini';
  LicenseSection = 'License';

function SaveLicenseKey(const licenseKey: string): Boolean;
var
  iniFile: TIniFile;
begin
  try
    iniFile := TIniFile.Create(LicenseIniFileName);
    try
      iniFile.WriteString(LicenseSection, 'Key', licenseKey);
    finally
      iniFile.Free;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

function LoadLicenseKey: string;
var
  iniFile: TIniFile;
begin
  try
    iniFile := TIniFile.Create(LicenseIniFileName);
    try
      Result := iniFile.ReadString(LicenseSection, 'Key', '');
    finally
      iniFile.Free;
    end;
  except
    Result := '';
  end;
end;

end.
