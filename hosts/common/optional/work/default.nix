{ inputs, lib, config, pkgs, ... }: {
  imports = [ ];
  environment.systemPackages = with pkgs; [
    snowsql
    insomnia
    slack
    zoom-us
  ];

  services.openvpn.servers = {
    boletia = {
      config = '' config /root/nixos/openvpn/boletia.conf'';
      autoStart = true;
    };
  };
}
