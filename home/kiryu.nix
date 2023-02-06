{ inputs, pkgs, ... }: {
  imports = [
    ./global
    ./desktop/wm/qtile
  ];
}