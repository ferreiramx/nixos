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
}