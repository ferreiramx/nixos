{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./appimage.nix
    ./gparted.nix
    ./gvfs.nix
    ./ntfs.nix
  ];
  services.devmon.enable = true;
}