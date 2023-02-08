{ inputs, lib, config, pkgs, ... }: {
  services.syncthing = {
    enable = true;
    user = "aferreira";
  };
}
