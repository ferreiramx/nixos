{ inputs, lib, config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    lm_sensors
    hddtemp
    hdparm
    smartmontools
  ]; 
  services.udisks2.enable = true;
}