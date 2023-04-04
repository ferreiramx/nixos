{ pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland = {
      enable = true;
      hidpi = true;
    };
  };
  services.dbus.enable = true;
  security.pam.services.swaylock = { };
  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    # GDK_BACKEND="wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    # GBM_BACKEND="nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
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
  ];

  systemd.user.services.eww = {
    description = "eww daemon";
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      Environment = "PATH=/run/wrappers/bin";
      ExecStart = "${pkgs.eww-wayland}/bin/eww daemon --no-daemonize";
      Restart = "on-failure";
    };
    wantedBy = [ "graphical-session.target" ];
  };
}
