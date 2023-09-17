{ pkgs, ... }:
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
    extraPackages = python3Packages: with python3Packages; [
      (
        buildPythonPackage rec {
          pname = "cowayaio";
          version = "0.1.8";
          src = fetchPypi {
            inherit pname version;
            sha256 = "39a2b0bd6cbad0619572ffc41785b4a5464c815081b682c882c3515cc1380462";
          };
          doCheck = false;
          propagatedBuildInputs = with pkgs; [
            python311Packages.aiohttp
            python311Packages.beautifulsoup4
          ];
        }
      )
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

  system.activationScripts.coway.text = ''
    mkdir -p "/var/lib/hass/custom_components"
    ln -sfn "${(pkgs.callPackage ../../../../pkgs/home-assistant/coway {})}" "/var/lib/hass/custom_components/coway"
  '';  
}
