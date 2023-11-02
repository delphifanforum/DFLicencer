unit LicenseValidator;

interface

uses
  SysUtils, DateUtils, EncdDecd;

function ValidateLicenseKey(const licenseKey, productName, productKey, encryptionKey: string): Boolean;

implementation

function ValidateLicenseKey(const licenseKey, productName, productKey, encryptionKey: string): Boolean;
var
  rawKey: string;
  expirationDate: TDateTime;
begin
  // Decrypt the license key
  rawKey := DecodeString(encryptionKey, licenseKey);

  if ContainsStr(rawKey, productName) and ContainsStr(rawKey, productKey) then
  begin
    // Extract and check expiration date
    Delete(rawKey, 1, Length(productName) + 1 + Length(productKey) + 1);
    expirationDate := StrToDateDef(rawKey, 0);
    Result := (expirationDate > Now);
  end
  else
    Result := False;
end;

end.
