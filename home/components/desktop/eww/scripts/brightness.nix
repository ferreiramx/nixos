{ inputs, vars, ... }: {
  xdg.configFile."eww/scripts/brightness" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      icons=("" "" "")
      if [ ! "$XDG_CACHE_HOME" ]; then
        XDG_CACHE_HOME="/home/aferreira/.local/cache"
      fi
      date="$XDG_CACHE_HOME/eww/osd_brightness.date"

      osd() {
        if [ ! -f "$date" ]; then
          mkdir -p "$XDG_CACHE_HOME/eww"
        fi
        date +%s >"$date"
      }

      osd_handler() {
        lock=0
        rundate=0
        if [ ! -f "$date" ]; then
          mkdir -p "$XDG_CACHE_HOME/eww"
          echo 0 >"$date"
        fi

        while true; do
          # get dates
          rundate=$(cat "$date")
          currentdate=$(date +%s)

          # handle showing
          if [ "$rundate" = "$currentdate" ] && [ "$lock" -eq 0 ]; then
            eww open osd
            eww update osd-brightness=true
            lock=1
          elif [ "$((currentdate - rundate))" = "2" ] && [ "$lock" -eq 1 ]; then
            eww update osd-brightness=false
            lock=0
            if [ "$(eww get osd-brightness)" = "false" ] && [ "$(eww get osd-volume)" = "false" ]; then
              eww close osd
            fi
          fi

          sleep 0.1
        done

        eww close osd
      }

      if [ "$1" = "osd" ]; then
        osd
      else
        # initial
        icon=''${icons[$(awk -v n="$(light)" 'BEGIN{print int(n/34)}')]}
        echo '{ "percent": '"$(light)"', "icon": "'"$icon"'" }'

        osd_handler &

        udevadm monitor | rg --line-buffered "backlight" | while read -r _; do
          icon="''${icons[$(awk -v n="$(light)" 'BEGIN{print int(n/34)}')]}"

          echo '{ "percent": '"$(light)"', "icon": "'"$icon"'" }'
        done
      fi
    '';
  };
}
