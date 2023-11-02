uses
  LicenseManager;

// When generating a license key, save it to the configuration file
function GenerateAndSaveLicenseKey(const productName, productKey: string; expirationDate: TDateTime; encryptionKey: string): string;
var
  licenseKey: string;
begin
  licenseKey := GenerateLicenseKey(productName, productKey, expirationDate, encryptionKey);
  SaveLicenseKey(licenseKey);
  Result := licenseKey;
end;

// When your program starts, load the license key from the configuration file
function CheckLicense: Boolean;
var
  licenseKey: string;
  productName: string;
  productKey: string;
  encryptionKey: string;
begin
  productName := 'YourProduct';
  productKey := 'YourProductKey';
  encryptionKey := 'YourEncryptionKey';

  licenseKey := LoadLicenseKey;

  if not ValidateLicenseKey(licenseKey, productName, productKey, encryptionKey) then
  begin
    // Invalid license, take appropriate action (e.g., show an error message and exit)
    Result := False;
  end
  else
  begin
    // Valid license, continue running the application
    Result := True;
  end;
end;
