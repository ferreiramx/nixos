{ config, inputs, vars, ... }: 
let
  colors = config.colorScheme.palette;
in
{
  xdg.configFile."eww/scripts/workspaces" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      
      colors=("#${colors.base0C}" "#${colors.base05}" "#${colors.base08}" "#${colors.base0A}")
      dimmed=("#${colors.base04}" "#${colors.base06}" "#${colors.base09}" "#${colors.base0B}")
      empty="#${colors.base03}"

      # get initial focused workspace
      focusedws=$(hyprctl -j monitors | jaq -r '.[] | select(.focused == true) | .activeWorkspace.id')

      declare -A o=([1]=0 [2]=0 [3]=0 [4]=0 [5]=0 [6]=0 [7]=0 [8]=0 [9]=0)
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

        for i in {1..9}; do
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
