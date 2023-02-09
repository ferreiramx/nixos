{ pkgs, config, lib, outputs, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  # users.mutableUsers = false;
  users.users.aferreira = {
    isNormalUser = true;
    description = "Angel Ferreira";
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "networkmanager"
    ] ++ ifTheyExist [
      "network"
      "docker"
      "git"
      "libvirtd"
    ];
    packages = [ pkgs.home-manager ];
  };

  # home-manager.users.aferreira = import ../../../../home/${config.networking.hostName}.nix;
}