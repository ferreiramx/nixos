{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./qemu.nix
    ./wine.nix
  ];
}
