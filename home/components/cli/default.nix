{ inputs, pkgs, ... }: {
  imports = [
    ./neofetch
    ./fish.nix
  ];
  programs.direnv.enable = true;
}