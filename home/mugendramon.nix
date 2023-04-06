{ inputs, config, pkgs, vars, ... }:
let
  nix-colors-lib = inputs.nix-colors.lib-contrib { inherit pkgs; };

in
{
  imports = [
    ./common

    ./components/cli

    ./components/term/kitty

    ./components/desktop
    ./components/desktop/wm/hyprland
    ./components/desktop/vscode
    ./components/desktop/spotify

  ];

  # colorScheme = inputs.nix-colors.colorschemes.black-metal-immortal;
  # colorScheme = inputs.nix-colors.colorschemes.gigavolt;
  # colorScheme = inputs.nix-colors.colorschemes.harmonic16-dark;
  # colorScheme = inputs.nix-colors.colorschemes.kanagawa;
  # colorScheme = inputs.nix-colors.colorschemes.nebula;
  # colorScheme = inputs.nix-colors.colorschemes.nord;
  # colorScheme = inputs.nix-colors.colorschemes.nova;
  # colorScheme = inputs.nix-colors.colorschemes.sandcastle;
  # colorScheme = inputs.nix-colors.colorschemes.vulcan;

  colorScheme = {
    slug = "power-metal";
    name = "Power Metal";
    author = "me";
    colors = {
      base00 = "#161819";
      base01 = "#262829";
      base02 = "#363839";
      base03 = "#464849";
      base04 = "#A6A8A9";
      base05 = "#B8BBB9";
      base06 = "#E0E0E0";
      base07 = "#345667";
      base08 = "#586C7D";
      base09 = "#87664C";
      base0A = "#98884a";
      base0B = "#4F684E";
      base0C = "#45585B";
      base0D = "#3C495A";
      base0E = "#486764";
      base0F = "#70413C";
    };
  };

  home.file.".face".source = ./common/assets/img/face.png;
  home.file.".wp.png".source = nix-colors-lib.nixWallpaperFromScheme {
    scheme = config.colorScheme;
    width = vars.screen.width;
    height = vars.screen.height;
    logoScale = 5.0;
  };

}
