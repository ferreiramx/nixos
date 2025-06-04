{ lib, ... }: {
  i18n = {
    extraLocaleSettings = {
      LC_TIME = lib.mkDefault "es_MX.UTF-8";
    };
    defaultLocale = "en_US.UTF-8";
    extraLocales = [ "es_MX.UTF-8/UTF-8" ];

  };
  time.timeZone = lib.mkDefault "America/Mexico_City";
}
