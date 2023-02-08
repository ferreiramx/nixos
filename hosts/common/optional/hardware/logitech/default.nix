{ inputs, lib, config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    logiops
    logitech-udev-rules
    solaar
  ];
}
