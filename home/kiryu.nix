{ inputs, pkgs, ... }: {
  imports = [
    ./common

    ./components/cli

    ./components/term/kitty
    
    ./components/desktop
    ./components/desktop/wm/qtile
    ./components/desktop/vscode
    ./components/desktop/spotify
  ];
  colorScheme = inputs.nix-colors.colorschemes.black-metal-khold;
  home.file.".face".source = ./common/assets/img/face.png;
  home.file.".wp".source = ./common/assets/wp/black.png;
}