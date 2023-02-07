{ inputs, lib, config, pkgs, ... }: {
  services.xserver = {
    libinput = {
      enable = true;
      touchpad = {
        accelProfile = "adaptive";
      };
    };
  };
}
