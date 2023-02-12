{ inputs, pkgs, config, ... }: {
  imports = [
    ./common

    ./components/cli

    ./components/term/kitty
    
    ./components/desktop
    ./components/desktop/wm/qtile
    ./components/desktop/vscode
    ./components/desktop/spotify
  ];
  home.file.".face".source = ./common/assets/img/face.png;
  home.file.".wp".source = ./common/assets/wp/black.png;
}