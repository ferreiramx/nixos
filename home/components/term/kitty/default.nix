{ config, pkgs, vars, ... }:
let
  colors = config.colorScheme.colors;
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
      background = "#${colors.base01}";
      foreground = "#${colors.base05}";
      selection_foreground = "#${colors.base09}";
      selection_background = "#${colors.base0F}";
      color0 = "#${colors.base00}";
      color8 = "#${colors.base03}";
      #: black
      color1 = "#${colors.base08}";
      color9 = "#${colors.base08}";
      #: red
      color2 = "#${colors.base0B}";
      color10 = "#${colors.base0B}";
      #: green
      color3 = "#${colors.base0A}";
      color11 = "#${colors.base0A}";
      #: yellow
      color4 = "#${colors.base0D}";
      color12 = "#${colors.base0D}";
      #: blue
      color13 = "#${colors.base0E}";
      color5 = "#${colors.base0E}";
      #: magenta
      color6 = "#${colors.base0C}";
      color14 = "#${colors.base0C}";
      #: cyan
      color7 = "#${colors.base05}";
      color15 = "#${colors.base07}";
      #: white
    };
  };
}
