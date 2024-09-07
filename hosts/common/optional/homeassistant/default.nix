{ pkgs, ... }:

{
    imports = [
        ../bluetooth
        ./zc-lp01.nix
    ];
  networking.firewall.enable = false;
  services.avahi.enable = true;
  services.mosquitto = {
  enable = true;
  listeners = [
    {
      acl = [ "pattern readwrite #" ];
      omitPasswordAuth = true;
      settings.allow_anonymous = true;
    }
  ];
};

  services.zigbee2mqtt = {
    enable = true;
    settings = {
      frontend = true;
      homeassistant = true;
      permit_join = true;
      mqtt = {
        server = "mqtt://localhost:1883";
      };
      serial = {
        port = "/dev/ttyACM0";
      };
      advanced = {
        channel = 20;
        log_level = "debug";
      };
      external_converters = [
        "ZC-LP01.js"
      ];
    };
  };
  

  virtualisation.oci-containers = {
    containers.homeassistant = {
      volumes = [ "home-assistant:/config" "/var/run/dbus:/var/run/dbus" "/var/run/avahi-daemon/socket:/var/run/avahi-daemon/socket" "/run/dbus:/run/dbus:ro"];
      environment.TZ = "America/Mexico_City";
      image = "ghcr.io/home-assistant/home-assistant:stable";
      extraOptions = [ 
        "--network=host" 
      ];
    };
  };
  services.home-assistant = {
    enable = false;
    openFirewall = true;
    # configDir = /var/lib/hass;
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
      "homekit"
      "homekit_controller"
      "bluetooth_adapters"
      "zeroconf"
    ];
    extraPackages = python3Packages: with python3Packages; [
      # cowayaio
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
            python312Packages.aiohttp
            python312Packages.beautifulsoup4
          ];
        }
      )
    # libdyson
      (
        buildPythonPackage rec {
          pname = "libdyson";
          version = "0.8.11";
          src = fetchPypi {
            inherit pname version;
            sha256 = "caf1f313a41ce3abe29d1755e577e0f80d008560a1fb258eb43cab43fc42d97b";
          };
          doCheck = false;
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

  networking.firewall.allowedTCPPorts = [ 80 443 5006 8123 ];
  # services.nginx = {
  #   enable = true;
  #   recommendedProxySettings = true;
  #   virtualHosts."homeassistant" = {
  #     serverName = "home.proyectosatan.org";
  #     # forceSSL = true;
  #     # enableACME = true;
  #     extraConfig = ''
  #       proxy_buffering off;
  #     '';
  #     listen = [{port = 80;  addr="0.0.0.0"; ssl=false;}];
  #     locations."/" = {
  #       proxyPass = "http://[::1]:8123";
  #       proxyWebsockets = true;
  #     };
  #   };
  # };

  system.activationScripts.coway.text = ''
    mkdir -p "/var/lib/hass/custom_components"
    ln -sfn "${(pkgs.callPackage ../../../../pkgs/home-assistant/coway {})}" "/var/lib/hass/custom_components/coway"
  '';  

  system.activationScripts.dyson.text = ''
    mkdir -p "/var/lib/hass/custom_components"
    ln -sfn "${(pkgs.callPackage ../../../../pkgs/home-assistant/dyson/local {})}" "/var/lib/hass/custom_components/dyson_local"
  '';  

  system.activationScripts.dyson_cloud.text = ''
    mkdir -p "/var/lib/hass/custom_components"
    ln -sfn "${(pkgs.callPackage ../../../../pkgs/home-assistant/dyson/cloud {})}" "/var/lib/hass/custom_components/dyson_cloud"
  ''; 
}
