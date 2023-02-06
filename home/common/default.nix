# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, config, pkgs, ... }:

{
  imports = [ ];

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";

  # Shell
  programs.bash.enable = true;

  # Git
  programs.git = {
    enable = true;
    userName = "ferreiramx";
    userEmail = "angel@ferreira.mx";
  };

  home = {
    username = "aferreira";
    homeDirectory = "/home/aferreira";
  };

  home.stateVersion = "22.05";
}


