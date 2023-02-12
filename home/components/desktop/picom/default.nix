{ inputs, lib, config, pkgs, ... }: {
  imports = [];
  services.picom = {
    enable = true;
    activeOpacity = 1.0;
    backend = "glx";
    fade = true;
    fadeDelta = 8;
    fadeExclude = [ ];
    fadeSteps = [ 0.028 0.028 ];
    inactiveOpacity = 1.0;
    menuOpacity = 1.0;
    opacityRules = [
      "100:QTILE_INTERNAL:32c"
    ];
    shadow = true;
    shadowExclude = [
      "name = 'Notification'"
      "class_g ?= 'Notify-osd'"
      "_GTK_FRAME_EXTENTS@:c"
      "class_g = 'Dunst'"
      "class_g = 'scrot'"
      "class_g = 'Rofi'"
      "QTILE_INTERNAL:32c"
    ];
    shadowOffsets = [
      (-10)
      (-10)
    ];
    shadowOpacity = 0.75;
    vSync = false;
    wintypes = {
      tooltip = { fade = true; shadow = true; opacity = 0.75; focus = true; full-shadow = false; };
      dock = { shadow = false; clip-shadow-above = true; };
      dnd = { shadow = false; };
      popup_menu = { opacity = 0.8; };
      dropdown_menu = { opacity = 0.8; };
    };
    settings = {
      shadow-radius = 20;
      shadow-red = 0.02;
      shadow-green = 0.02;
      shadow-blue = 0.02;
      no-fading-openclose = false;
      focus-exclude = [
        "QTILE_INTERNAL:32c"
        "class_g = 'Rofi'"
      ];
      corner-radius = 12;
      round-borders = 1;
      rounded-corners-exclude = [ ];
      blur-method = "dual_kawase";
      blur-strength = 3;
      blur-background = true;
      blur-background-frame = false;
      blur-background-fixed = false;
      blur-background-exclude = [ ];
      mark-wmwin-focused = true;
      mark-ovredir-focused = false;
      detect-rounded-corners = true;
      detect-client-opacity = true;
      detect-transient = true;
      glx-no-stencil = true;
      glx-no-rebind-pixmap = true;
      use-damage = true;
      log-level = "warn";
    };
  };
}
