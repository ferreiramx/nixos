{ lib, ... }: {
  i18n = {
    defaultLocale = lib.mkDefault "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = lib.mkDefault "es_MX.UTF-8";
    };
    supportedLocales = lib.mkDefault [
      "en_US.UTF-8/UTF-8"
      "es_MX.UTF-8/UTF-8"
    ];
  };
  time.timeZone = lib.mkDefault "America/Mexico_City";
}