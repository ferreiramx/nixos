{ pkgs }:

pkgs.writeShellScriptBin "touchpad-toggle" ''
  device=$(xinput list --name-only | grep Touchpad)
  status=$(xinput --list-props "$device" | grep "Device Enabled" | awk '{print $4}')
  if [ "$status" == "1" ]; then
    xinput disable "$device"
    dunstify "Touchpad" "Touchpad disabled."
  elif [ "$status" == "0" ]; then
    xinput enable "$device"
    dunstify "Touchpad" "Touchpad enabled."
  else
    echo "Unknown status: $status"
  fi
''
