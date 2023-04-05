{ inputs, config, pkgs, vars, ... }: 
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
}
