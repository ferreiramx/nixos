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
  colorScheme = inputs.nix-colors.colorschemes.black-metal-immortal;
  # colorScheme = inputs.nix-colors.colorschemes.gigavolt;
  # colorScheme = inputs.nix-colors.colorschemes.harmonic16-dark;
  # colorScheme = inputs.nix-colors.colorschemes.kanagawa;
  # colorScheme = inputs.nix-colors.colorschemes.nebula;
  # colorScheme = inputs.nix-colors.colorschemes.nord;
  # colorScheme = inputs.nix-colors.colorschemes.nova;
  # colorScheme = inputs.nix-colors.colorschemes.sandcastle;
  # colorScheme = inputs.nix-colors.colorschemes.vulcan;

  home.file.".face".source = ./common/assets/img/face.png;
  # home.file.".wp.png".source = ./common/assets/wp/black-uw.png;
  home.file.".wp.png".source = nix-colors-lib.nixWallpaperFromScheme {
    scheme = config.colorScheme;
    width = vars.screen.width;
    height = vars.screen.height;
    logoScale = 5.0;
  };

}
