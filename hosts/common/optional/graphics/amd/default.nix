{ pkgs, ... }: {
  imports = [
    ../../desktop/x11
  ];
  environment.systemPackages = with pkgs; [
    radeontop
  ];
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
}
