{ pkgs, ... }: {
  imports = [
    ../../desktop/x11
  ];
  environment.systemPackages = with pkgs; [
    radeontop
  ];
  hardware.graphics = {
    enable = true;
    # driSupport = true;
    enable32Bit = true;
  };
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
}
