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
        if [ "$STATUS" = "no" ]; then
          rfkill block all
          notify-send --urgency=normal -i airplane-mode-symbolic "Airplane Mode" "Airplane mode has been turned on!"
        else
          rfkill unblock all
          notify-send --urgency=normal -i airplane-mode-disabled-symbolic "Airplane Mode" "Airplane mode has been turned off!"
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
          echo '#f38ba8'
        else
          echo '#a6e3a1'
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

  xdg.configFile."eww/scripts/bluetooth" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      toggle() {
        status=$(rfkill -J | jaq -r '.rfkilldevices[] | select(.type == "bluetooth") | .soft' | head -1)

        if [ "$status" = "unblocked" ]; then
          rfkill block bluetooth
        else
          rfkill unblock bluetooth
        fi
      }

      if [ "$1" = "toggle" ]; then
        toggle
      else
        while true; do
          powered=$(bluetoothctl show | rg Powered | cut -f 2- -d ' ')
          status=$(bluetoothctl info)
          name=$(echo "$status" | rg Name | cut -f 2- -d ' ')
          mac=$(echo "$status" | head -1 | awk '{print $2}' | tr ':' '_')

          if [[ "$(echo "$status" | rg Percentage)" != "" ]]; then
            battery="$(upower -i /org/freedesktop/UPower/devices/headset_dev_"$mac" | rg percentage | awk '{print $2}' | cut -f 1 -d '%')%"
          else
            battery=""
          fi

          if [ "$powered" = "yes" ]; then
            if [ "$status" != "Missing device address argument" ]; then
              text="$name"
              icon=""
              color="#89b4fa"
              class="bt-connected"
            else
              icon=""
              text="Disconnected"
              color="#45475a"
              class=""
            fi
          else
            icon=""
            text="Bluetooth off"
            color="#45475a"
            class=""
          fi

          echo '{ "icon": "'"$icon"'", "battery": "'"$battery"'", "text": "'"$text"'", "color": "'"$color"'", "class": "'"$class"'" }'

          sleep 3
        done
      fi
    '';
  };

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

  xdg.configFile."eww/scripts/memory" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      while true; do
        # human-readable
        freeH=$(free -h --si | rg "Mem:")
        # non-human-readable
        freeN=$(free --mega | rg "Mem:")

        total="$(echo "$freeH" | awk '{ print $2 }')"
        used="$(echo "$freeH" | awk '{ print $3 }')"
        t="$(echo "$freeN" | awk '{ print $2 }')"
        u="$(echo "$freeN" | awk '{ print $3 }')"

        free=$(printf '%.1fG' "$(bc -l <<<"($t - $u) / 1000")")
        perc=$(printf '%.1f' "$(free -m | rg Mem | awk '{print ($3/$2)*100}')")

        echo '{ "total": "'"$total"'", "used": "'"$used"'", "free": "'"$free"'", "percent": '"$perc"' }'

        sleep 3
      done'';
  };

  xdg.configFile."eww/scripts/music" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      get_status() {
        s=$1
        if [ "$s" = "Playing" ]; then
          echo ""
        else
          echo ""
        fi
      }

      get_length_sec() {
        len=$1
        if [ -z "$len" ]; then
          echo 0
        else
          bc <<<"$len / 1000000"
        fi
      }

      get_length_time() {
        len=$1
        if [ -n "$len" ]; then
          len=$(bc <<<"$len / 1000000 + 1")
          date -d@"$len" +%M:%S
        else
          echo ""
        fi
      }

      get_position() {
        pos=$1
        len=$2
        if [ -n "$pos" ]; then
          bc -l <<<"$pos / $len * 100"
        else
          echo 0
        fi
      }

      get_position_time() {
        pos=$1
        len=$2
        if [ -n "$pos" ]; then
          date -d@"$(bc <<<"$pos / 1000000")" +%M:%S
        else
          echo ""
        fi
      }

      get_cover() {
        if [ ! "$XDG_CACHE_HOME" ]; then
          XDG_CACHE_HOME="/home/aferreira/.local/cache"
        fi
        mkdir -p "$XDG_CACHE_HOME/eww_covers"
        cd "$XDG_CACHE_HOME/eww_covers" || exit

        IMGPATH="$XDG_CACHE_HOME/eww_covers/cover_art.png"

        COVER_URL="$1"

        if [[ "$COVER_URL" = https* ]]; then
          if [ ! -e "$XDG_CACHE_HOME/eww_covers/$(basename "$COVER_URL")" ]; then
            wget -N "$COVER_URL" -o /dev/null
          fi

          rm "$IMGPATH"
          ln -s "$(basename "$COVER_URL")" "$IMGPATH"

          IMG="''${IMGPATH}"
        elif [ "$COVER_URL" = "" ]; then
          IMG=""
        else
          IMG="$COVER_URL"
        fi

        echo "$IMG"
      }

      sanitize() {
        echo "$1" | sed 's/"/\"/g'
      }

      prevCover='''

      playerctl -F metadata -f '{{title}}\{{artist}}\{{status}}\{{position}}\{{mpris:length}}\{{mpris:artUrl}}' 2>/dev/null | while IFS="$(printf '\')" read -r title artist status position len cover; do
        if [[ "$cover" != "$prevCover" ]]; then
          COVER=$(get_cover "$cover")

          if [ "$COVER" != "" ]; then
            cols=$(convert "$COVER" -colors 2 -format "%c" histogram:info: | awk '{print $3}')
            color1=$(echo "$cols" | head -1)
            color1=$(printf "rgba(%d, %d, %d, 0.6)" ${color1:1:2} ${color1:3:2} ${color1:5:2})
            color2=$(echo "$cols" | tail -1)
          else
            color1="#1e1e2e"
            color2="#28283d"
          fi
        fi

        jaq --null-input -r -c \
          --arg artist "$(sanitize "$artist")" \
          --arg title "$(sanitize "$title")" \
          --arg status "$(get_status "$status")" \
          --arg pos "$(get_position "$position" "$len")" \
          --arg pos_time "$(get_position_time "$position" "$len")" \
          --arg length "$(get_length_time "$len")" \
          --arg cover "$COVER" \
          --arg color1 "$color1" \
          --arg color2 "$color2" \
          '{"artist": $artist, "title": $title, "status": $status, "position": $pos, "position_time": $pos_time, "length": $length, "cover": $cover, "color1": $color1, "color2": $color2}'

        prevCover=$cover
      done
    '';
  };

  xdg.configFile."eww/scripts/net" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      toggle() {
        status=$(rfkill -J | jaq -r '.rfkilldevices[] | select(.type == "wlan") | .soft' | head -1)

        if [ "$status" = "unblocked" ]; then
          rfkill block wlan
        else
          rfkill unblock wlan
        fi
      }

      if [ "$1" = "toggle" ]; then
        toggle
      else
        while true; do
          status=$(nmcli -f state g | tail -1)
          wifistatus=$(nmcli -t -f in-use,ssid,signal dev wifi | rg '\*' | sed 's/\"/\\"/g')
          signal=$(echo "$wifistatus" | awk -F: '{print $3}')
          essid=$(echo "$wifistatus" | awk -F: '{print $2}')

          icons=("" "" "" "" "")

          if [ "$status" = "disconnected" ]; then
            icon=""
            color="#988ba2"
            class=""
          else
            level=$(awk -v n="$signal" 'BEGIN{print int((n-1)/20)}')
            if [ "$level" -gt 4 ]; then
              level=4
            fi

            icon=''${icons[$level]}
            color="#cba6f7"
            class="wifi-connected"
          fi

          echo '{ "essid": "'"$essid"'", "icon": "'"$icon"'", "color": "'"$color"'", "class": "'"$class"'" }'

          sleep 3
        done
      fi
    '';
  };

  xdg.configFile."eww/scripts/volume" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      volicons=("" "" "")
      if [ ! "$XDG_CACHE_HOME" ]; then
        XDG_CACHE_HOME="/home/aferreira/.local/cache"
      fi
      date="$XDG_CACHE_HOME/eww/osd_vol.date"

      vol() {
        wpctl get-volume @DEFAULT_AUDIO_"$1"@ | awk '{print int($2*100)}'
      }
      ismuted() {
        wpctl get-volume @DEFAULT_AUDIO_"$1"@ | rg -i muted
        echo $?
      }
      setvol() {
        wpctl set-volume @DEFAULT_AUDIO_"$1"@ "$(awk -v n="$2" 'BEGIN{print (n / 100)}')"
      }
      setmute() {
        wpctl set-mute @DEFAULT_AUDIO_"$1"@ toggle
      }

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
            eww update osd-volume=true
            lock=1
          elif [ "$((currentdate - rundate))" = "2" ] && [ "$lock" -eq 1 ]; then
            eww update osd-volume=false
            lock=0
            if [ "$(eww get osd-volume)" = "false" ] && [ "$(eww get osd-brightness)" = "false" ]; then
              eww close osd
            fi
          fi

          sleep 0.1
        done

        eww close osd
      }

      if [ "$1" = "mute" ]; then
        if [ "$2" != "SOURCE" ] && [ "$2" != "SINK" ]; then
          echo "Can only mute SINK or SOURCE"
          exit 1
        fi
        setmute "$2"
      elif [ "$1" = "setvol" ]; then
        if [ "$2" != "SOURCE" ] && [ "$2" != "SINK" ]; then
          echo "Can only set volume for SINK or SOURCE"
          exit 1
        elif [ "$3" -lt 1 ] || [ "$3" -gt 100 ]; then
          echo "Volume must be between 1 and 100"
          exit 1
        fi
        setvol "$2" "$3"
      elif [ "$1" = "osd" ]; then
        osd
      else
        # initial values
        lvl=$(awk -v n="$(vol "SINK")" 'BEGIN{print int(n/34)}')
        ismuted=$(ismuted "SINK")

        if [ "$ismuted" = 1 ]; then
          icon="''${volicons[$lvl]}"
        else
          icon=""
        fi
        echo '{ "icon": "'"$icon"'", "percent": "'"$(vol "SINK")"'", "microphone": "'"$(vol "SOURCE")"'" }'

        osd_handler &

        # event loop
        pactl subscribe | rg --line-buffered "change" | while read -r _; do
          lvl=$(awk -v n="$(vol "SINK")" 'BEGIN{print int(n/34)}')
          ismuted=$(ismuted "SINK")

          if [ "$ismuted" = 1 ]; then
            icon="''${volicons[$lvl]}"
          else
            icon=""
          fi
          echo '{ "icon": "'"$icon"'", "percent": "'"$(vol "SINK")"'", "microphone": "'"$(vol "SOURCE")"'" }'
        done
      fi
    '';
  };

  xdg.configFile."eww/scripts/workspaces" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      # define colors
      #        red       peach     green     blue
      colors=("#f38ba8" "#fab387" "#a6e3a1" "#89b4fa")
      #        pink      yellow    teal      lavender
      dimmed=("#f5c2e7" "#f9e2af" "#94e2d5" "#b4befe")
      empty="#313244"

      # get initial focused workspace
      focusedws=$(hyprctl -j monitors | jaq -r '.[] | select(.focused == true) | .activeWorkspace.id')

      declare -A o=([1]=0 [2]=0 [3]=0 [4]=0 [5]=0 [6]=0 [7]=0 [8]=0 [9]=0 [10]=0)
      declare -A monitormap
      declare -A workspaces

      # set color for each workspace
      status() {
        if [ "''${o[$1]}" -eq 1 ]; then
          mon=''${monitormap[''${workspaces[$1]}]}

          if [ "$focusedws" -eq "$1" ]; then
            echo -n "''${colors[$mon]}"
          else
            echo -n "''${dimmed[$mon]}"
          fi
        else
          echo -n "$empty"
        fi
      }

      # handle workspace create/destroy
      workspace_event() {
        o[$1]=$2
        while read -r k v; do workspaces[$k]="$v"; done < <(hyprctl -j workspaces | gojq -r '.[]|"\(.id) \(.monitor)"')
      }
      # handle monitor (dis)connects
      monitor_event() {
        while read -r k v; do monitormap["$k"]=$v; done < <(hyprctl -j monitors | gojq -r '.[]|"\(.name) \(.id) "')
      }

      # get all apps titles in a workspace
      applist() {
        ws="$1"

        apps=$(hyprctl -j clients | jaq -jr '.[] | select(.workspace.id == '"$ws"') | .title + "\\n"')
        echo -En "''${apps%"\n"}"
      }

      # generate the json for eww
      generate() {
        echo -n '['

        for i in {1..10}; do
          echo -n '''"$([ "$i" -eq 1 ] || echo ,)" '{ "number": "'"$i"'", "color": "'"$(status "$i")"'" }' #, "tooltip": "'$(applist "$i")'" }'
        done

        echo ']'
      }

      # setup

      # add monitors
      monitor_event

      # add workspaces
      while read -r k v; do workspaces[$k]="$v"; done < <(hyprctl -j workspaces | gojq -r '.[]|"\(.id) \(.monitor)"')

      # check occupied workspaces
      for num in "''${!workspaces[@]}"; do
        o[$num]=1
      done
      # generate initial widget
      generate

      # main loop
      socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | rg --line-buffered "workspace|mon(itor)?" | while read -r line; do
        case ''${line%>>*} in
        "workspace")
          focusedws=''${line#*>>}
          ;;
        "focusedmon")
          focusedws=''${line#*,}
          ;;
        "createworkspace")
          workspace_event "''${line#*>>}" 1
          ;;
        "destroyworkspace")
          workspace_event "''${line#*>>}" 0
          ;;
        "monitor"*)
          monitor_event
          ;;
        esac
        generate
      done
    '';
  };
}
