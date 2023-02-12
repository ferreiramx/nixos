{ pkgs, config, lib, outputs, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.users.aferreira = {
    isNormalUser = true;
    description = "Angel Ferreira";
    homeMode = "755";
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
    ]
    ++ ifTheyExist [
      "network"
      "docker"
      "git"
      "libvirtd"
    ];
    packages = [ pkgs.home-manager ];
  };

  home-manager.users.aferreira = import ../../../../home/${config.networking.hostName}.nix;
}