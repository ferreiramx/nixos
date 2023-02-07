{ inputs, lib, config, pkgs, ... }: {
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
}
