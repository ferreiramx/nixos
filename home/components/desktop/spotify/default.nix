{ inputs, lib, config, pkgs, ... }: {
  xdg.configFile."spicetify/Themes/nix-colors/color.ini".text = (import ./colorscheme.nix {inherit lib;});
  xdg.configFile."spicetify/Themes/nix-colors/user.css".source = ./user.css;
}