{ inputs, lib, config, pkgs, ... }: {
programs.kitty = {
    enable = true;
    font = {
      name = "SauceCodeProNerdFontComplete-Semibold";
      size = 16;
    };
    environment = {
      "TERM" = "xterm-kitty";
    };

    settings = {
      window_padding_width = 20;
      foreground = "#c0c0bc";
      background = "#151515";
      selection_foreground = "#151515";
      selection_background = "#c0c0bc";
      color0 = "#151515";
      color8 = "#3c3c3c";
      #: black
      color1 = "#6d3636";
      color9 = "#773e26";
      #: red
      color2 = "#458260";
      color10 = "#458260";
      #: green
      color3 = "#9f792c";
      color11 = "#9f792c";
      #: yellow
      color4 = "#444d6e";
      color12 = "#404049";
      #: blue
      color13 = "#5a446e";
      color5 = "#5a446e";
      #: magenta
      color6 = "#3d646d";
      color14 = "#4c5758";
      #: cyan
      color7 = "#e0e0dc";
      color15 = "#d0d0cc";
      #: white
    };
  };
}