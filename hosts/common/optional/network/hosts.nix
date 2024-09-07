{
  networking.hosts = {
    "10.0.0.19" = [ "proyectosatan.org" ];
  };
  # networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
  services.resolved.enable = true;
}
