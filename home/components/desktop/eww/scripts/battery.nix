{ config, inputs, vars, ... }: 
let
  colors = config.colorScheme.palette;
in
{
  xdg.configFile."eww/scripts/battery" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      icons=("" "" "" "" "" "" "" "")
      num_icons=$(bc <<<"100 / ''${#icons[@]}")

      geticon() {
        level=$(awk -v n="$CAPACITY" -v c="$num_icons" 'BEGIN{print int(n/c-1)}')
        if [[ "$level" -lt 0 ]]; then
          level=0
        fi
        echo "''${icons[$level]}"
      }

      status() {
        if [ "$STATE" = "Charging" ]; then
          echo -n "charging"

          if [ "$RATE" -gt 0 ]; then
            echo ", $(gettime) left"
          else
            echo ""
          fi
        elif [ "$STATE" = "Discharging" ]; then
          echo "$(gettime)h left"
        else
          echo "fully charged"
        fi
      }

      color() {
        if [ "$CAPACITY" -le 20 ]; then
          echo '#${colors.base0F}'
        else
          echo '#${colors.base07}'
        fi
      }

      wattage() {
        microwatts=1000000
        echo "$(bc -l <<<"scale=1; $RATE / $microwatts") W"
      }

      gettime() {
        FULL=$(cat /sys/class/power_supply/BAT0/energy_full)
        NOW=$(cat /sys/class/power_supply/BAT0/energy_now)

        if [ "$RATE" -gt 0 ]; then
          if [ "$STATE" = "Discharging" ]; then
            EX="$NOW / $RATE"
          else
            EX="($FULL - $NOW) / $RATE"
          fi
          date -u -d@"$(bc -l <<<"$EX * 3600")" +%H:%M
        fi
      }

      while true; do
        RATE=$(cat /sys/class/power_supply/BAT0/power_now)
        CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
        STATE=$(cat /sys/class/power_supply/BAT0/status)

        echo '{ "icon": "'"$(geticon)"'", "percent": '"$CAPACITY"', "wattage": "'"$(wattage)"'", "status": "'"$(status)"'", "color": "'"$(color)"'" }'
        sleep 3
      done
    '';
  };
}
