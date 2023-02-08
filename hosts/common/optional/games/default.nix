{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./lutris.nix
    ./retroarch.nix
    ./runelite.nix
    ./steam.nix
  ];
}
