{ inputs, pkgs, ... }: {
  imports = [
    ./common
    ./configs/desktop/wm/qtile
  ];
}