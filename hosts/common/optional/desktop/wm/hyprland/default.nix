{ pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
  };
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [];
  };
  programs.xwayland.enable = true;

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND="1";
    # GDK_BACKEND="wayland";
    WLR_NO_HARDWARE_CURSORS="1";
    LIBVA_DRIVER_NAME="nvidia";
    XDG_SESSION_TYPE="wayland";
    # GBM_BACKEND="nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME="nvidia";
  };

  environment.systemPackages = with pkgs; [
    qt5ct
    libva
  ];
}