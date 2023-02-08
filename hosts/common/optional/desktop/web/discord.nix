{ inputs, lib, config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    discord
    betterdiscord-installer
  ];
}
