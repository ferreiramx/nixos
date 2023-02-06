{ inputs, pkgs, ... }: {
  imports = [
    ./common
    ./components/desktop/wm/qtile
    ./components/desktop/vscode
  ];
}