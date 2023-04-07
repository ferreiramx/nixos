{ pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.dbus.enable = true;
  security.pam.services.swaylock = { };
  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    GDK_BACKEND="wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
    # GBM_BACKEND="nvidia-drm";
  };

  environment.systemPackages = with pkgs; [
    qt5ct
    libva
    hyprpaper
    swaylock
    grim
    slurp
    eww-wayland
    jaq
    gojq
    ripgrep
    socat
    bc
    light
    wget
    imagemagick
  ];
}
