{inputs, lib, config, pkgs, ... }: {
  xdg.configFile."qtile/scripts" = {
    "autostart.sh" = {
      text = ''
#!/bin/sh
picom --experimental-backends &
dunst &
mpris-proxy &
nm-applet &
      '';
      executable = true;
    };
    "pamixer.sh" = {
      text = ''
#!/bin/bash
# Temp script to output pamixer volume in [ddd%] format while the qtile volume widget is fixed

case $1 in
    get)
        echo "[$(pamixer --get-volume-human)]"
    ;;
    up)
        pamixer --increase 2
    ;;
    down)
        pamixer --decrease 2
    ;;
    mute)
        pamixer --toggle-mute
    ;;
esac
'';
    executable = true;
    };
    "playerctl.sh" = {
      text = ''
#!/bin/bash
if [ "$(playerctl -p spotify status 2>/dev/null)" != "" ]; then 
    echo $(playerctl -p spotify metadata artist) "-" $(playerctl -p spotify metadata title)
else 
    echo "Not Playing"
fi
      '';
      executable = true;
    };
    "nixos-rebuild.sh" = {
    text = ''
      #!/bin/sh
      rm -rf ~/.config/qtile/modules/__pycache__
      rm -rf ~/.config/qtile/__pycache__
      sudo nixos-rebuild switch --flake ~/.config/nixos/
      home-manager switch --flake ~/.config/nixos/
    '';
    executable = true;
    };
  };
}