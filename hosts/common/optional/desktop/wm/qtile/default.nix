{ inputs, lib, config, pkgs, ... }: {
  services.xserver.windowManager.qtile.enable = true;
}
