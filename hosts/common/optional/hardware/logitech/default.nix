{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    logiops
  ];
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;
}
