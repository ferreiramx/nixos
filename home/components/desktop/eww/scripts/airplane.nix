{ inputs, vars, ... }: {
  xdg.configFile."eww/scripts/airplane" = {
    executable = true;
    text = ''
      #!/bin/sh

      icon() {
        if [ "$STATUS" = "no" ]; then
          echo ""
        else
          echo ""
        fi
      }

      toggle() {
        STATUS="$(rfkill list | sed -n 2p | awk '{print $3}')"
        if [ "$STATUS" = "no" ]; then
          rfkill block all
          dunstify --urgency=normal -i airplane-mode-symbolic "Airplane Mode" "Airplane mode has been turned on!"
        else
          rfkill unblock all
          dunstify --urgency=normal -i airplane-mode-disabled-symbolic "Airplane Mode" "Airplane mode has been turned off!"
        fi
      }

      if [ "$1" = "toggle" ]; then
        toggle
      else
        while true; do
          STATUS="$(rfkill list | sed -n 2p | awk '{print $3}')"
          icon
          sleep 3
        done
      fi
    '';
  };
}
