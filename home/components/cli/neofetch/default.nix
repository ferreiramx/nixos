{ inputs, lib, config, pkgs, ... }: {
  home.packages = with pkgs; [ neofetch ];
  xdg.configFile."neofetch/config.conf".text = (import ./config.nix {inherit lib;});
}