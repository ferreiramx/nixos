{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    brightnessctl
    touchpad-toggle
  ];
  services.xserver = {
    libinput = {
      enable = true;
      touchpad = {
        accelProfile = "adaptive";
      };
    };
  };
}
