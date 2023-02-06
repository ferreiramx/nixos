{ inputs, pkgs, ... }: {
  imports = [
    ./common
    ./components/desktop/wm/qtile
    ./components/desktop/vscode
    ./components/desktop/spotify
    ./components/term/kitty
    ./components/cli/neofetch
  ];
}