{ config, pkgs, vars, ... }:
let
  colors = config.colorScheme.palette;
in
{
  programs.kitty = {
    enable = true;
    font = {
      name = "SauceCodePro Nerd Font Semibold";
      size = vars.fonts.mono;
    };
    environment = {
      "TERM" = "xterm-kitty";
    };

    settings = {
      window_padding_width = 20;
      background = "#${colors.base00}";
      foreground = "#${colors.base05}";
      selection_foreground = "#${colors.base05}";
      selection_background = "#${colors.base02}";
      color0 = "#${colors.base00}";
      color1 = "#${colors.base01}";
      color2 = "#${colors.base02}";
      color3 = "#${colors.base03}";
      color4 = "#${colors.base04}";
      color5 = "#${colors.base05}";
      color6 = "#${colors.base06}";
      color7 = "#${colors.base07}";
      color8 = "#${colors.base08}";
      color9 = "#${colors.base09}";
      color10 = "#${colors.base0A}";
      color11 = "#${colors.base0B}";
      color12 = "#${colors.base0C}";
      color13 = "#${colors.base0D}";
      color14 = "#${colors.base0E}";
      color15 = "#${colors.base0F}";
    };
  };
}
