{ pkgs, ... }: {
  services.actkbd = {
    enable = true;
    bindings = [
      # Everything involving audio does not work with actkbd. Will let WM handle them.
      # Volume Down
      # {
      #   keys = [ 114 ];
      #   events = [ "key" ];
      #   command = "pamixer -d 5";
      # }
      # # Volume Up
      # {
      #   keys = [ 115 ];
      #   events = [ "key" ];
      #   command = "pamixer -i 5";
      # }
      # Mic Mute
      # {
      #   keys = [ ];
      #   events = [ ];
      #   command = "";
      # }
      # # ROG Key | Change dGPU mode
      # {
      #   keys = [ ];
      #   events = [ ];
      #   command = "";
      # }
      # # F1 | Mute
      # {
      #   keys = [ ];
      #   events = [ ];
      #   command = "";
      # }
      # F2 | Keyboard backlight down
      {
        keys = [ 229 ];
        events = [ "key" ];
        command = "/run/current-system/sw/bin/asusctl -p";
      }
      # F3 | Keyboard backlight up
      {
        keys = [ 230 ];
        events = [ "key" ];
        command = "/run/current-system/sw/bin/asusctl -n";
      }
      # # F4 | AURA Key | Change keyboard backlight mode
      #       {
      #   keys = [ ];
      #   events = [ ];
      #   command = "";
      # }
      # # F5 | Fan Control
      #       {
      #   keys = [ ];
      #   events = [ ];
      #   command = "";
      # }
      # # F6 | ??? (Unused)
      # # F7 | Screen brightness down
      #       {
      #   keys = [ ];
      #   events = [ ];
      #   command = "";
      # }
      # # F8 | Screen brightness up
      #       {
      #   keys = [ ];
      #   events = [ ];
      #   command = "";
      # }
      # # F9 | Display Control (Unused)
      # # F10 | Touchpad Enable/Disable
      #       {
      #   keys = [ ];
      #   events = [ ];
      #   command = "";
      # }
      # # F11 | Suspend
      #       {
      #   keys = [ ];
      #   events = [ ];
      #   command = "";
      # }
      # # F12 | Airplane Mode (Works out of the box)
    ];
  };
}
