{ inputs, outputs, config, pkgs, lib, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModule
    inputs.spicetify-nix.homeManagerModules.default
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";

  programs.git = {
    enable = true;
    userName = "ferreiramx";
    userEmail = "angel@ferreira.mx";
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  home = {
    username = lib.mkDefault "aferreira";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "22.05";
  };
}


