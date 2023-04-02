{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ../../desktop/x11
  ];
  hardware = {
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        # nvidia-vaapi-driver
      ];
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      modesetting.enable = true;
      prime = {
        offload.enable = true;
      };
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
