{ inputs, lib, config, pkgs, ... }: {
  imports = [];
  programs.rofi.enable = true;
  xdg.configFile."rofi" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };
  xdg.configFile."rofi/theme.rasi" = {
    text = (import ./colorscheme.nix {inherit lib;});
  };
}