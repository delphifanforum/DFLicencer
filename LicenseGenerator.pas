unit LicenseGenerator;

interface

uses
  SysUtils, DateUtils, EncdDecd;

function GenerateLicenseKey(const productName, productKey: string; expirationDate: TDateTime; encryptionKey: string): string;

implementation

function GenerateLicenseKey(const productName, productKey: string; expirationDate: TDateTime; encryptionKey: string): string;
var
  rawKey: string;
  encodedKey: string;
begin
  // Create a raw key containing product name, product key, and expiration date
  rawKey := productName + '|' + productKey + '|' + FormatDateTime('yyyy-mm-dd', expirationDate);

  // Encrypt the raw key
  encodedKey := EncodeString(encryptionKey, rawKey);

  Result := encodedKey;
end;

end.
