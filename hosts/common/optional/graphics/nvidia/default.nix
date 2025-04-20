{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ../../desktop/x11
  ];
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
      ];
    };
    nvidia = {
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      powerManagement = {
        enable = true;
        finegrained = true;
      };
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
