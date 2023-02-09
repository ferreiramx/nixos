{ lib, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    discord
    betterdiscord-installer
  ];
}
