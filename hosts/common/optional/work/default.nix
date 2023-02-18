{ inputs, lib, config, pkgs, ... }: {
  imports = [ ];
  environment.systemPackages = with pkgs; [
    insomnia
    slack
    zoom-us
  ];

  sops.secrets = {
    "openvpn/boletia/prod/auth-user-pass" = {
      owner = "aferreira";
    };
    "openvpn/boletia/prod/ca" = {
      owner = "aferreira";
    };
    "openvpn/boletia/prod/cert" = {
      owner = "aferreira";
    };
    "openvpn/boletia/prod/key" = {
      owner = "aferreira";
    };
    "openvpn/boletia/prod/tls-auth" = {
      owner = "aferreira";
    };
  };

  services.openvpn.servers = {
    boletia = {
      # config = '' config /root/nixos/openvpn/boletia.conf'';
      config = ''
                cipher AES-256-CBC
                client
                setenv FORWARD_COMPATIBLE 1
                client
                server-poll-timeout 4
                nobind
                remote 18.214.204.73 1194 udp
                remote 18.214.204.73 1194 udp
                remote 18.214.204.73 443 tcp
                remote 18.214.204.73 1194 udp
                remote 18.214.204.73 1194 udp
                remote 18.214.204.73 1194 udp
                remote 18.214.204.73 1194 udp
                remote 18.214.204.73 1194 udp
                dev tun
                dev-type tun
                ns-cert-type server
                setenv opt tls-version-min 1.0 or-highest
                reneg-sec 604800
                sndbuf 0
                rcvbuf 0
                auth-user-pass ${config.sops.secrets."openvpn/boletia/prod/auth-user-pass".path}
                comp-lzo no
                verb 3
                setenv PUSH_PEER_INFO
                ca ${config.sops.secrets."openvpn/boletia/prod/ca".path}
                cert ${config.sops.secrets."openvpn/boletia/prod/cert".path}
                key ${config.sops.secrets."openvpn/boletia/prod/key".path}
                key-direction 1
                tls-auth ${config.sops.secrets."openvpn/boletia/prod/tls-auth".path}
      '';
      autoStart = true;
    };
  };
}
