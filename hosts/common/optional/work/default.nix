{ config, pkgs, ... }: {
  imports = [
    ./hosts.nix
  ];
  environment.systemPackages = with pkgs; [
    insomnia
    slack
    zoom-us
    deepchannel
    dbeaver-bin
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
    "openvpn/boletia/staging/ca" = {
      owner = "aferreira";
    };
    "openvpn/boletia/staging/cert" = {
      owner = "aferreira";
    };
    "openvpn/boletia/staging/key" = {
      owner = "aferreira";
    };
  };

  services.openvpn.servers = {
    boletia = {
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
      autoStart = false;
    };
    staging = {
      config = ''
        client
        dev tun
        proto udp
        remote  vpn.plupets.com
        resolv-retry infinite
        nobind
        persist-key
        persist-tun
        ca ${config.sops.secrets."openvpn/boletia/staging/ca".path}
        cert ${config.sops.secrets."openvpn/boletia/staging/cert".path}
        key ${config.sops.secrets."openvpn/boletia/staging/key".path}
        remote-cert-tls server
        cipher AES-256-CBC
        comp-lzo
        verb 3
      '';
      autoStart = false;
    };
  };
}
