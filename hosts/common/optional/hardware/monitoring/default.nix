{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    lm_sensors
    hddtemp
    hdparm
    smartmontools
    usbutils
  ];
  services.udisks2.enable = true;
}
