{ config, inputs, vars, ... }: 
let
  colors = config.colorScheme.palette;
in
{
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
          color1="#${colors.base01}"
          color2="#${colors.base00}"
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
}
