{ config, vars, pkgs, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
  xdg.configFile."rofi" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };
  xdg.configFile."rofi/launcher/launcher.rasi" = {
    text = import ./scripts/launcher/launcher.nix { inherit config vars; };
  };
  xdg.configFile."rofi/theme.rasi" = {
    text = import ./colorscheme.nix { inherit config; };
  };
}
