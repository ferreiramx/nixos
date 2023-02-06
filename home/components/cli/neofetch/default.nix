{ inputs, lib, config, pkgs, ... }: {
  xdg.configFile."neofetch/config.conf".text = (import ./config.nix {inherit lib;});
}