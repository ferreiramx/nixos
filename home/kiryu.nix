{ inputs, pkgs, ... }: {
  imports = [
    ./common
    ./desktop/wm/qtile
  ];
}