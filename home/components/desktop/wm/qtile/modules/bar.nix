vars:
''
  import os
  import psutil
  import subprocess
  from modules.theme import theme
  from libqtile import bar, widget
  from libqtile.lazy import lazy

  home = os.path.expanduser("~")
  bar = bar.Bar(
      widgets=[
          # Left Side
          # Image/Logo
          widget.TextBox(
              text="",
              foreground=theme["colors"]["bg4"],
              font=theme["fonts"]["osicon"]["font"],
              fontsize=theme["fonts"]["osicon"]["size"],
              padding=theme["widgets"]["padding"]["x"] * 2,
              mouse_callbacks={
                  "Button1": lazy.spawn(f"{home}/.config/rofi/power/powermenu.sh")
              },
          ),
          # Workspaces
          widget.GroupBox(
              font=theme["fonts"]["icons"]["font"],
              fontsize=theme["fonts"]["icons"]["size"],
              hide_unused=True,
              highlight_method="text",
              active=theme["colors"]["bg4"],
              inactive=theme["colors"]["bg3"],
              this_current_screen_border=theme["colors"]["fg1"],
              urgent_text=theme["colors"]["highlight1"],
              urgent_alert_method="text",
              spacing=0,
              margin_x=theme["widgets"]["margin"]["x"],
              padding=0,
          ),
          widget.Spacer(length=theme["widgets"]["margin"]["x"]),
          # Screenshot button
          widget.TextBox(
              text="",
              foreground=theme["colors"]["bg4"],
              font=theme["fonts"]["icons"]["font"],
              fontsize=theme["fonts"]["icons"]["size"],
              mouse_callbacks={
                  "Button1": lazy.spawn(
                      "sleep 1; scrot -u 'Screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f ~/pictures ; viewnior ~/pictures/$f'",
                      shell=True,
                  ),
                  "Button2": lazy.spawn(
                      "sleep 1; scrot -s 'screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f ~/pictures ; viewnior ~/pictures/$f' ",
                      shell=True,
                  ),
                  "Button3": lazy.spawn(
                      "sleep 1; scrot 'screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f ~/pictures ; viewnior ~/pictures/$f'",
                      shell=True,
                  ),
              },
          ),
          # Launcher
          widget.TextBox(
              text="󱗼",
              foreground=theme["colors"]["bg4"],
              font=theme["fonts"]["icons"]["font"],
              fontsize=theme["fonts"]["icons"]["size"],
              mouse_callbacks={
                  "Button1": lazy.spawn(f"{home}/.config/rofi/launcher/launcher.sh")
              },
          ),
          # Volume control
          widget.Spacer(length=theme["widgets"]["margin"]["x"]),
          # Just the volume icon for dynamic color
          widget.Volume(
              foreground=theme["colors"]["bg4"],
              font=theme["fonts"]["icons"]["font"],
              fontsize=theme["fonts"]["icons"]["size"],
              emoji=False,
              fmt="",
              update_interval=0.15,
              get_volume_command=[f"{home}/.config/qtile/scripts/pamixer.sh", "get"],
              mute_command=f"{home}/.config/qtile/scripts/pamixer.sh mute",
              volume_up_command=f"{home}/.config/qtile/scripts/pamixer.sh up",
              volume_down_command=f"{home}/.config/qtile/scripts/pamixer.sh down",
          ),
          # The volume percentage
          widget.Volume(
              emoji=False,
              fmt="{}",
              update_interval=0.15,
              get_volume_command=[f"{home}/.config/qtile/scripts/pamixer.sh", "get"],
              mute_command=f"{home}/.config/qtile/scripts/pamixer.sh mute",
              volume_up_command=f"{home}/.config/qtile/scripts/pamixer.sh up",
              volume_down_command=f"{home}/.config/qtile/scripts/pamixer.sh down",
              padding=0,
          ),
          widget.Spacer(length=theme["widgets"]["margin"]["x"]),
          # Icon for the window name
          widget.TextBox(
              text="",
              foreground=theme["colors"]["bg4"],
              font=theme["fonts"]["icons"]["font"],
              fontsize=theme["fonts"]["icons"]["size"],
              padding=0,
              # padding_x=theme["widgets"]["padding"]["x"],
          ),
          widget.Prompt(
              font=f'{theme["fonts"]["mono"]["font"]} {theme["fonts"]["mono"]["style"]}',
              # foreground=theme["colors"]["accent1"],
              prompt="",
              fmt="[{}]",
              padding=1,
          ),
          # Window name
          widget.WindowName(
              max_chars=50,
              padding=theme["widgets"]["padding"]["x"],
              scroll=True,
              width=bar.CALCULATED,
          ),
          # Center
          widget.Spacer(),
          widget.Clock(
              format="%a, %d %b %Y   %H:%M",
              font=f'{theme["fonts"]["sans"]["font"]} Bold',
          ),
          widget.Spacer(),
          # Right Side
          # Spotify Control
          widget.TextBox(
              text="",
              foreground=theme["colors"]["bg4"],
              font=theme["fonts"]["icons3"]["font"],
              fontsize=theme["fonts"]["icons3"]["size"],
              mouse_callbacks={
                  "Button1": lazy.spawn(
                      'sh -c "if pgrep -x spotify > /dev/null; then playerctl -p spotify play-pause; else spotify 2> /dev/null & fi"'
                  ),
                  "Button3": lazy.spawn('sh -c "playerctl -p spotify stop"'),
                  "Button4": lazy.spawn('sh -c "playerctl -p spotify next"'),
                  "Button5": lazy.spawn('sh -c "playerctl -p spotify previous"'),
                  "Button6": lazy.spawn('sh -c "playerctl -p spotify position 5-"'),
                  "Button7": lazy.spawn('sh -c "playerctl -p spotify position 5+"'),
              },
          ),
          widget.GenPollText(
              update_interval=1,
              func=lambda: subprocess.check_output(
                  f"{home}/.config/qtile/scripts/playerctl.sh"
              )
              .decode("utf-8")
              .replace("\n", ""),
              mouse_callbacks={
                  "Button1": lazy.spawn('sh -c "playerctl -p spotify play-pause"'),
                  "Button3": lazy.spawn('sh -c "playerctl -p spotify stop"'),
                  "Button4": lazy.spawn('sh -c "playerctl -p spotify next"'),
                  "Button5": lazy.spawn('sh -c "playerctl -p spotify previous"'),
                  "Button6": lazy.spawn('sh -c "playerctl -p spotify position 5-"'),
                  "Button7": lazy.spawn('sh -c "playerctl -p spotify position 5+"'),
              },
          ),
          # CPU
          widget.Spacer(length=theme["widgets"]["margin"]["x"]),
          widget.TextBox(
              text="",
              foreground=theme["colors"]["bg4"],
              font=f'{theme["fonts"]["icons2"]["font"]} {theme["fonts"]["icons2"]["style"]}',
              fontsize=theme["fonts"]["icons2"]["size"],
          ),
          widget.CPU(
              format="{load_percent}%",
          ),
          # Memory
          widget.Spacer(length=theme["widgets"]["margin"]["x"]),
          widget.TextBox(
              text="",
              foreground=theme["colors"]["bg4"],
              font=f'{theme["fonts"]["icons2"]["font"]} {theme["fonts"]["icons2"]["style"]}',
              fontsize=theme["fonts"]["icons2"]["size"],
          ),
          widget.Memory(
              format="{MemUsed:.2f}GB",
              measure_mem="G",
          ),
          widget.Spacer(length=theme["widgets"]["margin"]["x"]),
      ]
      # Make a widget for each mounted filesystem
      + [
          widget
          for partition in [
              [
                  # Icon
                  widget.TextBox(
                      text="",
                      foreground=theme["colors"]["bg4"],
                      font=f'{theme["fonts"]["icons2"]["font"]} {theme["fonts"]["icons2"]["style"]}',
                      fontsize=theme["fonts"]["icons2"]["size"],
                  ),
                  widget.DF(
                      visible_on_warn=False,
                      partition=p.mountpoint,
                      format="{r:.0f}%",
                  ),
              ]
              for p in psutil.disk_partitions()
              if p.mountpoint not in ["/boot", "/nix/store"]
          ]
          for widget in partition
      ]
      + [
          # Network
          widget.Spacer(length=theme["widgets"]["margin"]["x"]),
          widget.TextBox(
              text="",
              foreground=theme["colors"]["bg4"],
              font=f'{theme["fonts"]["icons2"]["font"]} {theme["fonts"]["icons2"]["style"]}',
              fontsize=theme["fonts"]["icons2"]["size"],
          ),
          widget.Net(format="{down}", prefix="M", use_bits=True),
          widget.TextBox(
              text="",
              foreground=theme["colors"]["bg4"],
              font=f'{theme["fonts"]["icons2"]["font"]} {theme["fonts"]["icons2"]["style"]}',
              fontsize=theme["fonts"]["icons2"]["size"],
          ),
          widget.Net(format="{up}", prefix="M", use_bits=True),
          widget.Spacer(length=theme["widgets"]["margin"]["x"]),
          # CPU Temp
          widget.TextBox(
              text="",
              foreground=theme["colors"]["bg4"],
              font=f'{theme["fonts"]["icons2"]["font"]} {theme["fonts"]["icons2"]["style"]}',
              fontsize=theme["fonts"]["icons2"]["size"],
          ),
          widget.ThermalSensor(
              update_interval=1,
              threshold=theme["sensors"]["cpu"]["threshold"],
              tag_sensor=theme["sensors"]["cpu"]["tag"],
              foreground_alert=theme["colors"]["highlight1"],
              foreground=theme["colors"]["fg3"],
              format="CPU {temp:.0f}{unit}",
          ),
          # GPU Temp
          widget.TextBox(
              text="",
              foreground=theme["colors"]["bg4"],
              font=f'{theme["fonts"]["icons2"]["font"]} {theme["fonts"]["icons2"]["style"]}',
              fontsize=theme["fonts"]["icons2"]["size"],
          ),
          widget.ThermalSensor(
              update_interval=1,
              threshold=theme["sensors"]["gpu"]["threshold"],
              tag_sensor=theme["sensors"]["gpu"]["tag"],
              foreground_alert=theme["colors"]["highlight1"],
              foreground=theme["colors"]["fg3"],
              format="GPU {temp:.0f}{unit}",
          ),
          widget.Spacer(length=theme["widgets"]["margin"]["x"]),
''
+
(if (vars.class == "laptop")
then
        ''
        # Battery Indicator
          widget.TextBox(
              text="",
              foreground=theme["colors"]["bg4"],
              font=f'{theme["fonts"]["icons2"]["font"]} {theme["fonts"]["icons2"]["style"]}',
              fontsize=theme["fonts"]["icons2"]["size"],
          ),
        widget.Battery(
            update_interval=10,
            low_percentage=0.1,
            low_foreground=theme["colors"]["highlight1"],
            notify_below=0.1,
            foreground=theme["colors"]["fg3"],
            font=f'{theme["fonts"]["sans"]["font"]} Bold',
            #fontsize=theme["fonts"]["icons2"]["size"],
            format=' {percent:2.0%}',
        ),''
else
        ""
)
  +
''
          # Systray
          widget.Systray(icon_size=theme["fonts"]["icons2"]["size"]),
          widget.Spacer(length=theme["widgets"]["margin"]["x"]),
      ],
      size=int(theme["screen"]["height"] * 0.03),
      background=theme["colors"]["bg1"],
      margin=[
          5,
          theme["windows"]["margin"]["x"],
          0,
          theme["windows"]["margin"]["x"],
      ],
  )
''
