{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./vivaldi.nix
    ./firefox.nix
    ./discord.nix
    ./qbittorrent.nix
    ./whatsapp.nix
  ];
}
