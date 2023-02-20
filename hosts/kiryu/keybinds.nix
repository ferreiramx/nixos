{ pkgs, ... }: {
  services.actkbd = {
    enable = true;
    bindings = [
      # Everything involving audio does not work with actkbd. Will let WM handle it.
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
      # ROG Key | Change dGPU mode
      # Does not work via actkbd either. Handling via WM.
      # {
      #   keys = [ 148 ];
      #   events = [ "key" ];
      #   command = "/run/current-system/sw/bin/switch-gfx-mode";
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
      # F4 | AURA Key | Change keyboard backlight mode
      {
        keys = [ 202 ];
        events = [ "key" ];
        command = "/run/current-system/sw/bin/asusctl led-mode -n";
      }
      # F5 | Fan Control
      {
        keys = [ 203 ];
        events = [ "key" ];
        command = "/run/current-system/sw/bin/asusctl profile -n";
      }
      # F6 | Screenshot
      # Handling via WM
      # F7 | Screen brightness down
      {
        keys = [ 224 ];
        events = [ "key" ];
        command = "/run/current-system/sw/bin/brightnessctl set 26-";
      }
      # F8 | Screen brightness up
      {
        keys = [ 225 ];
        events = [ "key" ];
        command = "/run/current-system/sw/bin/brightnessctl set 26+";
      }
      # F9 | Display Control 
      # Currently unused.
      # F10 | Touchpad Enable/Disable
      # Does not currently work with actkbd. Handling via WM.
      # {
      #   keys = [ 191 ];
      #   events = [ "key" ];
      #   command = "/run/current-system/sw/bin/touchpad-toggle";
      # }
      # F11 | Suspend
      # Works out of the box.
      # F12 | Airplane Mode 
      # Works out of the box.
    ];
  };
}
