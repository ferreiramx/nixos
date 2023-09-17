{
    imports = [
        ../bluetooth
    ];
  services.home-assistant = {
    enable = true;
    extraComponents = [
      "wled"
      "esphome"
      "met"
      "radio_browser"
      "netgear"
      "google_translate"
      "hue"
      "ibeacon"
      "harmony"
      "samsungtv"
      "roomba"
      "spotify"
    ];
    config = {
      default_config = {};
      http = {
        server_host = "::1";
        trusted_proxies = [ "::1" ];
        use_x_forwarded_for = true;
      };
      "automation manual" = [];
      "automation ui" = "!include automations.yaml";
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
  # security.acme.acceptTerms = true;
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    virtualHosts."proyectosatan.org" = {
      # forceSSL = true;
      # enableACME = true;
      extraConfig = ''
        proxy_buffering off;
      '';
      locations."/" = {
        proxyPass = "http://[::1]:8123";
        proxyWebsockets = true;
      };
    };
  };
}
