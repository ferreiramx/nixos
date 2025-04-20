{
  networking.hosts = {
    "10.0.0.19" = [ "proyectosatan.org" ];
  };
  # networking.nameservers = [ "172.16.0.24" ];
  services.resolved.enable = true;
}
