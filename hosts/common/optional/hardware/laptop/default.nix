{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    brightnessctl
    touchpad-toggle
  ];
  services.libinput = {
      enable = true;
      touchpad = {
        accelProfile = "adaptive";
      };
    };
}
