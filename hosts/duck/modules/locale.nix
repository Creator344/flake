let
  nz = "en_NZ.UTF-8";
in
{
  time.timeZone = "Pacific/Auckland";

  i18n.defaultLocale = nz;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = nz;
    LC_IDENTIFICATION = nz;
    LC_MEASUREMENT = nz;
    LC_MONETARY = nz;
    LC_NAME = nz;
    LC_NUMERIC = nz;
    LC_PAPER = nz;
    LC_TELEPHONE = nz;
    LC_TIME = nz;
  };
}
