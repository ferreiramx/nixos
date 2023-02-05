# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, config, pkgs, ... }:

{
  imports = [ ];

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";

  # Shell
  programs.bash.enable = true;

  # Git
  programs.git = {
    enable = true;
    userName = "ferreiramx";
    userEmail = "angel@ferreira.mx";
  };

  # Picom
  services.picom = {
    enable = true;
    activeOpacity = 1.0;
    backend = "glx";
    experimentalBackends = true;
    fade = true;
    fadeDelta = 8;
    fadeExclude = [ ];
    fadeSteps = [ 0.028 0.028 ];
    inactiveOpacity = 1.0;
    menuOpacity = 1.0;
    opacityRules = [
      "100:QTILE_INTERNAL:32c"
    ];
    shadow = true;
    shadowExclude = [
      "name = 'Notification'"
      "class_g ?= 'Notify-osd'"
      "_GTK_FRAME_EXTENTS@:c"
      "class_g = 'Dunst'"
      "class_g = 'scrot'"
      "class_g = 'Rofi'"
      "QTILE_INTERNAL:32c"
    ];
    shadowOffsets = [
      (-10)
      (-10)
    ];
    shadowOpacity = 0.75;
    vSync = false;
    wintypes = {
      tooltip = { fade = true; shadow = true; opacity = 0.75; focus = true; full-shadow = false; };
      dock = { shadow = false; clip-shadow-above = true; };
      dnd = { shadow = false; };
      popup_menu = { opacity = 0.8; };
      dropdown_menu = { opacity = 0.8; };
    };
    settings = {
      shadow-radius = 20;
      shadow-red = 0.02;
      shadow-green = 0.02;
      shadow-blue = 0.02;
      no-fading-openclose = false;
      focus-exclude = [
        "QTILE_INTERNAL:32c"
        "class_g = 'Rofi'"
      ];
      corner-radius = 12;
      round-borders = 1;
      rounded-corners-exclude = [ ];
      blur-method = "dual_kawase";
      blur-strength = 3;
      blur-background = true;
      blur-background-frame = false;
      blur-background-fixed = false;
      blur-background-exclude = [ ];
      mark-wmwin-focused = true;
      mark-ovredir-focused = false;
      detect-rounded-corners = true;
      detect-client-opacity = true;
      detect-transient = true;
      glx-no-stencil = true;
      glx-no-rebind-pixmap = true;
      use-damage = true;
      log-level = "warn";
    };
  };

  # Qtile
  xdg.configFile."qtile/config.py" = {
    text = ''
      # Theme
      from modules.theme import theme

      # Hooks
      from modules.hooks import autostart

      # Keys
      from modules.keys import keys, mouse, mod

      # Groups
      from modules.groups import groups

      # Layouts
      from modules.layouts import layouts, floating_layout

      # Screens
      from modules.screens import screens

      # Vars
      widget_defaults = dict(
          font=f'{theme["fonts"]["sans"]["font"]} {theme["fonts"]["sans"]["style"]}',
          foreground=theme["colors"]["fg3"],
          fontsize=theme["fonts"]["sans"]["size"],
          padding=theme["widgets"]["padding"]["x"],
      )
      extension_defaults = widget_defaults.copy()
      dgroups_key_binder = None
      dgroups_app_rules = []
      follow_mouse_focus = True
      bring_front_click = False
      cursor_warp = True
      auto_fullscreen = False
      focus_on_window_activation = "smart"
      reconfigure_screens = True
      auto_minimize = True
      wmname = "LG3D"
    '';
  };

  xdg.configFile."qtile/modules/bar.py" = {
    text = ''
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
                  font=theme["fonts"]["sans"]["font"],
                  foreground=theme["colors"]["fg1"],
                  fontsize=theme["fonts"]["icons"]["size"] * 2,
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
                  if p.mountpoint not in ["/boot"]
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
              # Systray
              widget.Systray(icon_size=16),
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
    '';
  };

  xdg.configFile."qtile/modules/groups.py" = {
    text = ''
      from libqtile.config import Group, Key
      from modules.keys import keys, mod
      from libqtile.lazy import lazy

      group_labels = ["󰎤", "󰎧", "󰎪", "󰎭", "󰎱", "󰎳", "󰎶", "󰎹", "󰎼"]
      groups = [Group(name=i, label=group_labels[int(i) - 1]) for i in "123456789"]

      for i in groups:
          keys.extend(
              [
                  # mod1 + letter of group = switch to group
                  Key(
                      [mod],
                      i.name,
                      lazy.group[i.name].toscreen(),
                      desc=f"Switch to group {i.name}",
                  ),
                  # mod1 + shift + letter of group = switch to & move focused window to group
                  Key(
                      [mod, "shift"],
                      i.name,
                      lazy.window.togroup(i.name, switch_group=True),
                      desc=f"Switch to & move focused window to group {i.name}",
                  ),
              ]
          )

    '';
  };

  xdg.configFile."qtile/modules/hooks.py" = {
    text = ''
      import os
      import subprocess
      from libqtile import hook

      home = os.path.expanduser("~")

      @hook.subscribe.startup_once
      def autostart():
          subprocess.run(f"{home}/.config/qtile/scripts/autostart.sh")
    '';
  };

  xdg.configFile."qtile/modules/keys.py" = {
    text = ''
      import os
      from libqtile.lazy import lazy
      from libqtile.config import Key, Click, Drag
      from libqtile.utils import guess_terminal

      home = os.path.expanduser("~")
      mod = "mod4"
      terminal = guess_terminal()
      keys = [
          # Switch between windows
          Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
          Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
          Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
          Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
          Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
          # Move windows between left/right columns or move up/down in current stack.
          # Moving out of range in Columns layout will create new column.
          Key(
              [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
          ),
          Key(
              [mod, "shift"],
              "l",
              lazy.layout.shuffle_right(),
              desc="Move window to the right",
          ),
          Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
          Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
          # Grow windows. If current window is on the edge of screen and direction
          # will be to screen edge - window would shrink.
          Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
          Key(
              [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
          ),
          Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
          Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
          Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
          # Toggle between split and unsplit sides of stack.
          # Split = all windows displayed
          # Unsplit = 1 window displayed, like Max layout, but still with
          # multiple stack panes
          Key(
              [mod, "shift"],
              "Return",
              lazy.layout.toggle_split(),
              desc="Toggle between split and unsplit sides of stack",
          ),
          Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
          # Toggle between different layouts as defined below
          Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
          Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
          Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
          Key(
              [mod, "control"],
              "r",
              lazy.spawn(f"{home}/.config/qtile/scripts/nixos-rebuild.sh"),
              desc="Rebuild NixOS Flake",
          ),
          Key(
              [mod],
              "escape",
              lazy.spawn(f"{home}/.config/rofi/power/powermenu.sh"),
              desc="Show menu",
          ),
          Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
          # Floating windows
          Key(
              [mod],
              "f",
              lazy.window.toggle_floating(),
              desc="Toggle floating",
          ),
          # Launcher
          Key(
              [mod],
              "d",
              lazy.spawn(f"{home}/.config/rofi/launcher/launcher.sh"),
              desc="App Launcher",
          ),
      ]

      # Drag floating layouts.
      mouse = [
          Drag(
              [mod],
              "Button1",
              lazy.window.set_position_floating(),
              start=lazy.window.get_position(),
          ),
          Drag(
              [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
          ),
          Click([mod], "Button2", lazy.window.bring_to_front()),
          Click([mod], "Button9", lazy.spawn(f"{home}/.config/qtile/eww_vol.sh up")),
          Click([mod], "Button8", lazy.spawn(f"{home}/.config/qtile/eww_vol.sh down")),
      ]
    '';
  };

  xdg.configFile."qtile/modules/layouts.py" = {
    text = ''
      from libqtile import layout
      from libqtile.config import Match
      from modules.theme import theme

      layouts = [
          layout.MonadThreeCol(
              ratio=0.5,
              max_ratio=0.5,
              new_client_position="bottom",
              margin=theme["windows"]["margin"]["x"],
              #single_margin=[
              #    theme["windows"]["margin"]["y"],
              #    int(theme["screen"]["width"] / 4),
              #    theme["windows"]["margin"]["y"],
              #    int(theme["screen"]["width"] / 4),
              #],
              single_margin = None,
              border_width=theme["windows"]["borders"]["width"],
              border_focus=theme["colors"]["bg4"],
              border_normal=theme["colors"]["bg3"],
          ),
          layout.MonadTall(
              ratio=0.7,
              max_ratio=0.75,
              min_ratio=0.5,
              new_client_position="bottom",
              margin=theme["windows"]["margin"]["x"],
              border_width=theme["windows"]["borders"]["width"],
              singel_margin=theme["windows"]["margin"]["x"],
              singel_border_width=theme["windows"]["borders"]["width"],
              border_focus=theme["colors"]["bg4"],
              border_normal=theme["colors"]["bg3"],
          ),
          layout.Columns(
              margin=[
                  theme["windows"]["margin"]["y"],
                  theme["windows"]["margin"]["x"],
                  theme["windows"]["margin"]["y"],
                  theme["windows"]["margin"]["x"],
              ],
              num_stacks=3,
              border_width=theme["windows"]["borders"]["width"],
              border_focus=theme["colors"]["bg4"],
              border_normal=theme["colors"]["bg3"],
              num_columns=3,
              split=True,
              fair=False,
          ),
          layout.Stack(
              margin=[
                  theme["windows"]["margin"]["y"],
                  theme["windows"]["margin"]["x"],
                  theme["windows"]["margin"]["y"],
                  theme["windows"]["margin"]["x"],
              ],
              num_stacks=3,
              border_width=theme["windows"]["borders"]["width"],
              border_focus=theme["colors"]["bg4"],
              border_normal=theme["colors"]["bg3"],
          ),
          layout.Max(),
      ]


      floating_layout = layout.Floating(
          float_rules=[
              # Run the utility of `xprop` to see the wm class and name of an X client.
              *layout.Floating.default_float_rules,
              Match(wm_class="confirmreset"),  # gitk
              Match(wm_class="makebranch"),  # gitk
              Match(wm_class="maketag"),  # gitk
              Match(wm_class="ssh-askpass"),  # ssh-askpass
              Match(title="branchdialog"),  # gitk
              Match(title="pinentry"),  # GPG key password entry
          ],
          border_width=theme["windows"]["borders"]["width"],
          border_focus=theme["colors"]["bg4"],
          border_normal=theme["colors"]["bg3"],
      )
    '';
  };

  xdg.configFile."qtile/modules/screens.py" = {
    text = ''
      from libqtile.config import Screen
      from modules.bar import bar
      from modules.theme import theme

      screens = [
          Screen(
              top=bar,
              wallpaper=theme["screen"]["wallpaper"]["file"],
              wallpaper_mode=theme["screen"]["wallpaper"]["mode"],
          )
      ]
    '';
  };

  xdg.configFile."qtile/modules/theme.py" = {
    text = ''
      theme = {
          "screen": {
              "width": 2560,
              "height": 1440,
              "wallpaper": {
                  "file": "/home/aferreira/pictures/wallpapers/black.png",
                  "mode": "stretch",
              },
          },
          "colors": {
              "bg1": "#151515",
              "bg2": "#1c1c1c",
              "bg3": "#202020",
              "bg4": "#3c3c3c",
              "fg1": "#c0c0bc",
              "fg2": "#d0d0cc",
              "fg3": "#e0e0dc",
              "accent1": "#404049",
              "accent2": "#4c5758",
              "accent3": "#444d6e",
              "accent4": "#3d646d",
              "highlight1": "#6d3636",
              "highlight2": "#773e26",
              "highlight3": "#9f792c",
              "highlight4": "#458260",
              "highlight5": "#5a446e",
          },
          "windows": {
              "borders": {"width": 3, "radius": 12},
              "padding": {"x": 0, "y": 0},
              "margin": {"x": 5, "y": 5},
          },
          "widgets": {
              "borders": {"width": 0, "radBieius": 12},
              "padding": {"x": 5, "y": 0},
              "margin": {"x": 10, "y": 10},
          },
          "fonts": {
              "sans": {
                  "font": "Source Sans Pro",
                  "style": "Semibold",
                  "size": 18,
              },
              "mono": {
                  "font": "Source Code Pro",
                  "style": "Bold",
                  "size": 18,
              },
              "icons": {
                  "font": "Material Design Icons",
                  "style": "",
                  "size": 25,
              },
              "icons2": {
                  "font": "Font Awesome 6 Free",
                  "style": "Solid",
                  "size": 20,
              },
              "icons3": {
                  "font": "Font Awesome 6 Brands",
                  "style": "Solid",
                  "size": 20,
              },
          },
          "sensors": {
              "cpu": {
                  "tag": "Tctl",
                  "threshold": 70,
              },
              "gpu": {
                  "tag": "edge",
                  "threshold": 70,
              },
          },
          "transparency": {"alpha": 1, "blur": 10},
      }
    '';
  };

  xdg.configFile."qtile/modules/utils.py" = {
    text = ''
      import subprocess


      def get_volume():
          p = subprocess.run(
              ["pamixer", "--get-volume"], stdout=subprocess.PIPE, universal_newlines=True
          )
          return int(p.stdout.replace("\n", ""))


      def get_mute():
          p = subprocess.run(
              ["pamixer", "--get-mute"], stdout=subprocess.PIPE, universal_newlines=True
          )
          return p.stdout.replace("\n", "")

    '';
  };

  # Qtile scripts
  xdg.configFile."qtile/scripts/pamixer.sh" = {
    text = ''
      #! /bin/sh
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

  xdg.configFile."qtile/scripts/autostart.sh" = {
    text = ''
      #!/bin/sh
      picom --experimental-backends &
      dunst &
      mpris-proxy &
    '';
    executable = true;
  };

  xdg.configFile."qtile/scripts/playerctl.sh" = {
    text = ''
      #!/bin/sh
      if [ "$(playerctl -p spotify status 2>/dev/null)" != "" ]; then 
          echo $(playerctl -p spotify metadata artist) "-" $(playerctl -p spotify metadata title)
      else 
          echo "Not Playing"
      fi
    '';
    executable = true;
  };

  xdg.configFile."qtile/scripts/nixos-rebuild.sh" = {
    text = ''
      #!/bin/sh
      rm -rf ~/.config/qtile/modules/__pycache__
      rm -rf ~/.config/qtile/__pycache__
      sudo nixos-rebuild switch --flake ~/.config/nixos/
      home-manager switch --flake ~/.config/nixos/
    '';
    executable = true;
  };


  # Rofi
  programs.rofi.enable = true;
  xdg.configFile."rofi" = {
    source = dotfiles/rofi;
    recursive = true;
  };
  xdg.configFile."rofi/power/powermenu.sh" = {
    text = ''
      #!/bin/sh
      style="full_rounded"

      rofi_command="rofi -theme power/$style.rasi"

      uptime=$(uptime -p | sed -e 's/up //g')

      # Options
      shutdown=""
      reboot=""
      lock=""
      suspend=""
      logout=""
      dir="$HOME/.config/rofi/power"

      # Variable passed to rofi
      options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

      chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
      case $chosen in
          $shutdown)
              systemctl poweroff
              ;;
          $reboot)
              systemctl reboot
              ;;
          $lock)
              ~/.config/i3/lock.sh
              ;;
          $suspend)
              playerctl -p spotify pause
              pamixer -m
              systemctl suspend
              ;;
          $logout)
              qtile cmd-obj -o cmd -f shutdown
              ;;
      esac
    '';
    executable = true;
  };

  # VSCode 
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    userSettings = {
      "editor.fontSize" = 18;
      "workbench.colorTheme" = "Nord";
      "terminal.integrated.fontSize" = 18;
      "window.zoomLevel" = 1;
    };
    extensions = with pkgs.vscode-extensions;
      [
        ms-python.python
        arcticicestudio.nord-visual-studio-code
        ms-toolsai.jupyter
        ms-toolsai.jupyter-renderers
        jnoortheen.nix-ide
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace
        [
          {
            name = "prettier-sql-vscode";
            publisher = "inferrinizzard";
            version = "1.3.1";
            sha256 = "YDpkL0HQfsyH4TVmaWMwJh6NMiCIRBMBOKKhnLcerno=";
          }
          {
            name = "inline-sql-syntax";
            publisher = "qufiwefefwoyn";
            version = "2.15.0";
            sha256 = "LtEM9MrEzBErPtPD4InKempHeexO1MtwdeyQ6ufyFkE=";
          }
          {
            name = "sqltools";
            publisher = "mtxr";
            version = "0.25.1";
            sha256 = "qi/OhJi38It8DEcRrYjjjsDJRtZNnJrqU55qwAFqXP0=";
          }
          {
            name = "snowflake-driver-for-sqltools";
            publisher = "koszti";
            version = "0.4.2";
            sha256 = "dLKnurvYn3impla9Vlw/RcehYJDC5ylRDnHvRs1rh/I=";
          }
          {
            name = "snowflake-vscode";
            publisher = "okeeffdp";
            version = "0.0.1";
            sha256 = "W3oWrJ9U/cPSSGU/I+eDIzkylesbnuKTK+6iVXbkW2s=";
          }
        ];
  };
  # Custom theme
  xdg.configFile."VSCodium" = {
    source = dotfiles/VSCodium;
    recursive = true;
  };

  # Spotify custom theme
  xdg.configFile."spicetify/Themes/nix-colors/color.ini" = {
    text = ''
      [normal]
      text               = e0e0dc
      subtext            = e0e0dc
      sidebar-text       = e0e0dc
      main               = 151515
      sidebar            = 151515
      player             = 151515
      card               = 1c1c1c
      shadow             = c0c0bc
      selected-row       = 1c1c1c
      button             = 3c3c3c
      button-active      = 3c3c3c
      button-disabled    = 1c1c1c
      tab-active         = 202020
      notification       = 1c1c1c
      notification-error = 6d3636
      misc               = 404049
    '';
  };

  xdg.configFile."spicetify/Themes/nix-colors/user.css" = {
    text = ''
      :root {
          --br-1: 10px;
          --br-2: 8px;
          --scrollbar: unset;
      }

      /* background */
      .main-home-homeHeader,
      .main-entityHeader-backgroundColor,
      .main-actionBarBackground-background {
          display: none;
      }

      .main-topBar-overlay,
      .main-view-container,
      .Root__nav-bar {
          background-color: var(--spice-main);
      }

      .main-topBar-background {
          opacity: 1 !important;
      }

      * {
          box-shadow: none !important;
      }

      /* dividers */
      .Y_WW1akjiQKXSzCBalCD {
          display: none;
      }

      /* navbar */
      .main-rootlist-rootlistDividerContainer {
          display: none;
      }

      .main-navBar-navBarLinkActive,
      .main-collectionLinkButton-selected,
      .main-rootlist-rootlistItemLinkActive {
          color: var(--spice-shadow) !important;
          background: var(--spice-selected-row) !important;
      }

      .main-navBar-navBarLink,
      .main-collectionLinkButton-collectionLinkButton,
      .main-rootlist-rootlistItemLink,
      .main-createPlaylistButton-button {
          border-radius: var(--br-1) !important;
      }

      .main-navBar-navBarLink:hover,
      .main-collectionLinkButton-collectionLinkButton:hover,
      .main-rootlist-rootlistItemLink:hover,
      .main-createPlaylistButton-button:hover {
          background: var(--spice-button-disabled);
      }

      .main-rootlist-rootlistItem {
          padding: 0 8px 0 calc(8px + var(--indentation) * 8px);
      }

      .main-rootlist-rootlistItemLink {
          padding: 0 16px;
      }

      .main-rootlist-statusIcons,
      .main-rootlist-expandArrow {
          position: absolute;
          top: 10px;
          right: 24px;
      }

      .main-rootlist-expandArrow {
          top: 8px;
          color: var(--spice-subtext);
      }

      .main-rootlist-rootlistItemLinkActive+.main-rootlist-statusIcons .main-rootlist-playButton,
      .main-rootlist-rootlistItemLinkActive+.main-rootlist-expandArrow {
          color: var(--spice-shadow) !important;
      }

      .main-navBar-navBarLink {
          color: var(--spice-text);
      }

      .main-collectionLinkButton-collectionLinkButton>*,
      .main-createPlaylistButton-button {
          opacity: 1 !important;
      }

      .main-rootlist-rootlist .os-scrollbar {
          padding: 0 0 0 8px;
      }

      /* player */
      .main-nowPlayingBar-center .playback-progressbar {
          position: absolute;
          left: 0;
          bottom: 84px;
      }

      .main-nowPlayingBar-nowPlayingBar:not(:only-child) .playback-progressbar {
          bottom: 108px;
      }

      .playback-bar {
          --bar: var(--spice-button);
      }

      .volume-bar {
          --bar: var(--spice-subtext);
          margin-right: 8px;
      }

      .playback-bar .progress-bar {
          --progress-bar-radius: 0;
      }

      .playback-bar:hover .progress-bar,
      .playback-bar .DuvrswZugGajIFNXObAr {
          --progress-bar-height: 8px;
      }

      .x-progressBar-progressBarBg {
          background-color: var(--spice-button-disabled);
      }

      .DuvrswZugGajIFNXObAr .progress-bar__slider,
      .epWhU7hHGktzlO_dop6z {
          background-color: var(--bar) !important;
      }

      .progress-bar__slider {
          display: block;
          background-color: var(--spice-shadow);
          border: 2px solid var(--bar);
          height: 16px;
          width: 16px;
      }

      .playback-bar .progress-bar__slider {
          height: 20px;
          width: 20px;
      }

      .playback-bar__progress-time-elapsed,
      .main-playbackBarRemainingTime-container {
          color: var(--spice-subtext);
          position: absolute;
          margin-bottom: 30px;
          right: 266px;
      }

      .playback-bar__progress-time-elapsed {
          right: 308px;
      }

      .playback-bar__progress-time-elapsed::after {
          content: '  /';
      }

      .player-controls__buttons {
          margin: 0;
      }

      .player-controls__buttons button:not(.main-playPauseButton-button) {
          color: var(--spice-button) !important;
      }

      .connect-device-list-content {
          border-radius: var(--br-1);
          border: 1px solid var(--spice-button-disabled);
          padding: 12px;
      }

      .connect-device-list-item:hover {
          background-color: var(--spice-button-disabled);
          border-radius: var(--br-2);
      }

      .cover-art-image {
          border-radius: calc(var(--br-2) / 2);
      }

      .main-coverSlotCollapsed-container[aria-hidden='true'] .cover-art-image {
          border-radius: var(--br-1);
      }

      /* friends */
      .main-buddyFeed-addFriendsContainer {
          background-color: var(--spice-sidebar);
      }

      .main-buddyFeed-friendActivity {
          padding: 8px;
          margin: 8px;
          background: var(--spice-card);
          border-radius: var(--br-1);
      }

      .HdRGC,
      .eEsqRZ,
      .main-buddyFeed-usernameAndTimestamp a {
          color: var(--spice-text) !important;
      }

      .main-buddyFeed-activityMetadata> :not(:first-child) a,
      .main-buddyFeed-timestamp {
          color: var(--spice-subtext) !important;
      }

      .main-avatar-avatar.vreGJrlRqoFkzlSQwvsJ:after {
          background: var(--spice-text);
          box-shadow: none;
      }

      /* cards */
      .main-card-card,
      .Z35BWOA10YGn5uc9YgAp,
      .main-heroCard-card,
      .a2ruVaZt_DdrdHz3GqgU,
      .x-categoryCard-CategoryCard {
          background-color: var(--spice-card);
          border-radius: var(--br-1);
      }

      .Z35BWOA10YGn5uc9YgAp:hover {
          background: var(--spice-button-disabled);
      }

      .main-cardImage-imageWrapper:not(.main-cardImage-circular) {
          border-radius: var(--br-2);
      }

      .Z35BWOA10YGn5uc9YgAp .main-image-image {
          border-radius: var(--br-2) 0 0 var(--br-2);
      }

      .zXwER4Lsqq_e7fVVaPkZ {
          background-color: transparent !important;
      }

      .cSeieV {
          background-color: var(--spice-button-active);
      }

      /* menus */
      .main-contextMenu-menu {
          border: 1px solid var(--spice-button-disabled);
          border-radius: var(--br-1);
          padding: 8px;
      }

      .main-contextMenu-menuItemButton:hover {
          background-color: var(--spice-button-disabled);
      }

      .main-contextMenu-menuItemButton {
          border-radius: var(--br-2);
      }

      .main-contextMenu-menuItemButton::before,
      .main-contextMenu-menuItemButton::after {
          display: none;
      }

      .main-contextMenu-menuItemButton {
          color: var(--spice-text) !important;
      }

      /* input */
      .x-searchInput-searchInputInput,
      .x-proxySettings-proxyInput,
      .main-dropDown-dropDown,
      .QZhV0hWVKlExlKr266jo,
      .amTaUy6eMlbKh0wzrOnb {
          background: var(--spice-card);
          border-radius: var(--br-2);
      }

      .x-searchInput-searchInputSearchIcon,
      .x-searchInput-searchInputInput,
      .x-searchInput-searchInputClearButton {
          color: var(--spice-text) !important;
      }

      /* buttons */
      .wCl7pMTEE68v1xuZeZiB:hover,
      .w6j_vX6SF5IxSXrrkYw5:hover,
      .w6j_vX6SF5IxSXrrkYw5[data-context-menu-open='true'],
      .fLS8v3_EfBadEerbGVoR:hover,
      .aAr9nYtPsG7P2LRzciXc {
          background: var(--spice-button-disabled);
          border-radius: var(--br-2);
      }

      .w6j_vX6SF5IxSXrrkYw5 {
          background-color: transparent;
      }

      .main-actionBar-ActionBarRow button:not(.bqeOGM),
      .QhF9ZR7YOiJeFiEnfkOr button,
      .CpQBQL6M4D3bquNOpKd9,
      .player-controls__buttons button,
      .DbMYFmOEEz9PH1h1zK9n button,
      .main-moreButton-button,
      .w6j_vX6SF5IxSXrrkYw5,
      .gIobRDHAxkAvUaF4_OOL button {
          color: var(--spice-button);
      }

      .bqeOGM:hover .ButtonInner-sc-14ud5tc-0,
      .dkGAhA:hover .ButtonInner-sc-14ud5tc-0,
      .jEaMNl:hover .ButtonInner-sc-14ud5tc-0,
      .fBTYgGyvIbHizHIj7AAX,
      .main-playPauseButton-button {
          background-color: var(--spice-button);
      }

      .kxBVag {
          color: var(--spice-subtext);
      }

      .main-button-primary,
      .fBTYgGyvIbHizHIj7AAX,
      .main-playPauseButton-button {
          color: var(--spice-shadow) !important;
      }

      .aAr9nYtPsG7P2LRzciXc {
          border: none;
      }

      .main-button-outlined {
          border-color: var(--spice-button);
      }

      .rEx3EYgBzS8SoY7dmC6x rect {
          fill: var(--spice-button);
      }

      /* scrollbar */
      .os-scrollbar {
          display: var(--scrollbar);
      }

      .os-scrollbar-handle {
          border-radius: 8px;
          background: var(--spice-button-disabled) !important;
      }

      /* tab bar */
      .oaNVBli46GtVjaQKB15g,
      .marketplace-tabBar-active,
      .lyrics-tabBar-active {
          color: var(--spice-shadow) !important;
          background: var(--spice-tab-active) !important;
      }

      .JdlKTdpMquftpMwwegZo,
      .marketplace-tabBar-headerItemLink,
      .lyrics-tabBar-headerItemLink {
          border-radius: var(--br-2);
      }

      .JdlKTdpMquftpMwwegZo:hover,
      .marketplace-tabBar-headerItemLink:hover {
          background: var(--spice-button-disabled);
      }

      /* marketplace */
      .main-navBar-navBarItem[data-id='/spicetify-marketplace'] svg {
          vertical-align: middle;
      }

      .main-type-mestoBold {
          font-weight: 700;
          font-size: 0.875rem;
      }

      .marketplace-card-desc {
          font-size: 0.875rem;
          line-height: 1rem;
      }

      .main-cardHeader-text {
          font-weight: 700;
      }

      .marketplace-header {
          height: 36px;
      }

      .marketplace-header__right {
          position: fixed;
      }

      .marketplace-settings-button {
          padding: 12px 12px 8px;
          border-radius: var(--br-2);
      }

      .marketplace-settings-button:hover {
          background-color: var(--spice-button-disabled);
      }

      .GenericModal>* {
          background-color: var(--spice-main) !important;
          color: var(--spice-text);
      }

      .GenericModal,
      .GenericModal>* {
          border-radius: var(--br-1);
      }

      .main-playButton-PlayButton {
          color: var(--spice-shadow) !important;
      }

      .marketplace-card--installed {
          border: none;
      }

      /* headers */
      .CmkY1Ag0tJDfnFXbGgju:not(.hNTPwmaxPotdJ14dx2W9 *) {
          border-radius: var(--br-1);
      }

      .main-entityHeader-gray,
      .main-entityHeader-metaData,
      .UyzJidwrGk3awngSGIwv,
      .main-entityHeader-divider {
          color: var(--spice-text) !important;
      }

      .main-entityHeader-background {
          transform: none !important;
          margin-top: 64px;
          border-radius: var(--br-1);
      }

      .main-entityHeader-overlay {
          background: none;
      }

      .main-entityHeader-withBackgroundImage,
      .main-entityHeader-withBackgroundImage+div {
          transform: translateY(64px);
      }

      /* tracklist */
      .main-trackList-trackList .main-rootlist-wrapper {
          background: var(--spice-card);
          border-radius: var(--br-1);
          padding: 8px;
      }

      .main-trackList-trackListHeaderRow {
          border: none;
      }

      .main-trackList-trackListRow:hover,
      .jtZMR8Hj94od6BQce98P:hover {
          background-color: var(--spice-button-disabled);
      }

      .main-trackList-trackListRow.main-trackList-selected,
      .jtZMR8Hj94od6BQce98P:active {
          background-color: var(--spice-tab-active) !important;
      }

      .main-trackList-selected * {
          color: var(--spice-shadow) !important;
      }

      .main-trackList-selected .main-trackList-playingIcon,
      .main-trackList-selected .main-tag-container {
          background-color: var(--spice-shadow);
          color: var(--spice-text) !important;
      }

      .main-trackList-trackListRow,
      .jtZMR8Hj94od6BQce98P {
          border-radius: var(--br-2);
      }

      .main-trackList-trackList {
          border-radius: var(--br-1);
          border-bottom: 16px solid var(--spice-card);
      }

      .fcehhQ {
          color: var(--spice-subtext);
      }

      .main-tag-container {
          background-color: var(--spice-subtext);
      }

      .main-trackList-playingIcon {
          -webkit-mask-image: url("data:image/svg+xml,%3Csvg id='playing-icon' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cdefs%3E%3Cstyle%3E %23playing-icon %7B fill: %2320BC54; %7D @keyframes play %7B 0%25 %7Btransform: scaleY(1);%7D 3.3%25 %7Btransform: scaleY(0.9583);%7D 6.6%25 %7Btransform: scaleY(0.9166);%7D 9.9%25 %7Btransform: scaleY(0.8333);%7D 13.3%25 %7Btransform: scaleY(0.7083);%7D 16.6%25 %7Btransform: scaleY(0.5416);%7D 19.9%25 %7Btransform: scaleY(0.4166);%7D 23.3%25 %7Btransform: scaleY(0.25);%7D 26.6%25 %7Btransform: scaleY(0.1666);%7D 29.9%25 %7Btransform: scaleY(0.125);%7D 33.3%25 %7Btransform: scaleY(0.125);%7D 36.6%25 %7Btransform: scaleY(0.1666);%7D 39.9%25 %7Btransform: scaleY(0.1666);%7D 43.3%25 %7Btransform: scaleY(0.2083);%7D 46.6%25 %7Btransform: scaleY(0.2916);%7D 49.9%25 %7Btransform: scaleY(0.375);%7D 53.3%25 %7Btransform: scaleY(0.5);%7D 56.6%25 %7Btransform: scaleY(0.5833);%7D 59.9%25 %7Btransform: scaleY(0.625);%7D 63.3%25 %7Btransform: scaleY(0.6666);%7D 66.6%25 %7Btransform: scaleY(0.6666);%7D 69.9%25 %7Btransform: scaleY(0.6666);%7D 73.3%25 %7Btransform: scaleY(0.6666);%7D 76.6%25 %7Btransform: scaleY(0.7083);%7D 79.9%25 %7Btransform: scaleY(0.75);%7D 83.3%25 %7Btransform: scaleY(0.8333);%7D 86.6%25 %7Btransform: scaleY(0.875);%7D 89.9%25 %7Btransform: scaleY(0.9166);%7D 93.3%25 %7Btransform: scaleY(0.9583);%7D 96.6%25 %7Btransform: scaleY(1);%7D %7D %23bar1 %7B transform-origin: bottom; animation: play 0.9s -0.51s infinite; %7D %23bar2 %7B transform-origin: bottom; animation: play 0.9s infinite; %7D %23bar3 %7B transform-origin: bottom; animation: play 0.9s -0.15s infinite; %7D %23bar4 %7B transform-origin: bottom; animation: play 0.9s -0.75s infinite; %7D %3C/style%3E%3C/defs%3E%3Ctitle%3Eplaying-icon%3C/title%3E%3Crect id='bar1' class='cls-1' width='4' height='24'/%3E%3Crect id='bar2' class='cls-1' x='6' width='4' height='24'/%3E%3Crect id='bar3' class='cls-1' x='12' width='4' height='24'/%3E%3Crect id='bar4' class='cls-1' x='18' width='4' height='24'/%3E%3C/svg%3E");
          background: var(--spice-text);
          content-visibility: hidden;
      }

      .main-trackList-filterHighlight {
          background-color: var(--spice-button);
          color: var(--spice-shadow);
      }

      /* podcasts */
      .main-yourEpisodes-coverContainer,
      .SpVoh9vvBN0kIwzfCiBh,
      .ltjunXlP2FwPEVF992n9 {
          border-radius: var(--br-1);
      }

      .TT1tIewS2iI8Uz8kLuQB {
          border-radius: var(--br-2);
          margin: 0 8px;
      }

      .TT1tIewS2iI8Uz8kLuQB:hover {
          background-color: var(--spice-button-disabled);
      }

      .Ng3dPPA2_1CFYkzPukjM {
          background: var(--spice-text);
      }

      .Q3wDjXPNY4lACLUxARrd+div {
          background-color: var(--spice-card);
          padding: 8px 0;
          border-radius: var(--br-1);
      }

      .knWBkA {
          color: var(--spice-subtext);
      }

      .qfYkuLpETFW3axnfMntO,
      .poz9gZKE7xqFwgk231J4,
      .UyzJidwrGk3awngSGIwv,
      .xWm_uA0Co4SXVxaO7wlB {
          color: var(--spice-text) !important;
      }

      path[fill='#1ed760'] {
          fill: var(--spice-button) !important;
      }

      .E4I5I7G2CfW32hLWZaqE,
      .SpVoh9vvBN0kIwzfCiBh {
          background-color: var(--spice-card);
      }

      .rFwxt8s8DYY8p1O7tYZW {
          background: none;
      }

      /* settings */
      .x-toggle-indicator {
          height: 18px;
          width: 18px;
          top: 3px;
          left: 3px;
          background: var(--spice-shadow) !important;
      }

      input:checked~.x-toggle-indicatorWrapper .x-toggle-indicator {
          right: 3px;
      }

      .cOFYck {
          color: var(--spice-subtext);
      }

      .main-playlistEditDetailsModal-textElement {
          border-radius: var(--br-1);
      }

      .main-playlistEditDetailsModal-textElement:focus {
          background: rgba(var(--spice-rgb-selected-row), .1) !important;
      }

      /* fullscreen */
      .npv-main-container .npv-cross-fade-image {
          border-radius: calc(var(--br-1) * 3);
      }

      .npv-main-container .playback-bar__progress-time-elapsed,
      .npv-main-container .main-playbackBarRemainingTime-container {
          margin-bottom: -125px;
          margin-right: -86px;
      }

      .npv-up-next {
          background: var(--spice-card) !important;
          border: none !important;
          border-radius: var(--br-1);
      }

      .npv-up-next__image {
          border-radius: var(--br-2);
      }

      .npv-header__metadata {
          color: var(--spice-text);
      }

      /* misc */
      .hW9km7ku6_iggdWDR_Lg,
      .lyrics-lyricsContainer-LyricsContainer {
          --lyrics-color-active: var(--spice-text) !important;
          --lyrics-color-inactive: var(--spice-subtext) !important;
          --lyrics-color-background: var(--spice-main) !important;
      }

      .lyrics-lyricsContainer-LyricsBackground {
          background-image: none;
      }

      .jixVGx,
      .euRuBv {
          color: var(--spice-text);
      }

      .XmR5VFpqXOcxRvhuf6OB {
          border-radius: var(--br-1);
      }

      .main-rootlist-rootlistDividerContainer {
          display: none;
      }

      .main-home-homeHeader {
          display: none;
      }

      .main-rootlist-rootlistItemOverlay {
          display: none;
      }
    '';
  };

  # Neofetch
  xdg.configFile."neofetch/config.conf" = {
    text = ''
        print_info() {
          printf "\n"
          printf "\n"
          printf "\n"
          printf "\n"
          printf "\n"
          info title
          info " " distro
          info " " kernel
          info " " uptime
          info " " packages
          info " " shell
          info " " term
        
          printf "\n"
          info " " resolution
          info " " wm

          printf "\n"
          info " " cpu
          info " " gpu
          info " " memory
      }
      kernel_shorthand="on"
      distro_shorthand="tiny"
      os_arch="off"
      uptime_shorthand="on"
      memory_percent="off"
      package_managers="on"
      shell_path="off"
      shell_version="on"
      speed_type="bios_limit"
      speed_shorthand="on"
      cpu_brand="on"
      cpu_speed="off"
      cpu_cores="off"
      cpu_temp="off"
      gpu_brand="off"
      gpu_type="dedicated"
      refresh_rate="on"
      gtk_shorthand="on"
      gtk2="off"
      gtk3="on"
      public_ip_host="http://ident.me"
      public_ip_timeout=2
      disk_show=('/')
      disk_subtitle="dir"
      music_player="auto"
      song_format="%artist% - %album% - %title%"
      song_shorthand="off"
      mpc_args=()
      colors=(8 1 8 8 1 7)
      bold="on"
      underline_enabled="on"
      underline_char="─"
      separator=" ● "  #" ⟫"
      block_range=(0 15)
      color_blocks="on"
      block_width=3
      block_height=1
      bar_char_elapsed="-"
      bar_char_total="="
      bar_border="on"
      bar_length=15
      bar_color_elapsed="distro"
      bar_color_total="distro"
      cpu_display="off"
      memory_display="off"
      battery_display="off"
      disk_display="off"
      image_backend="kitty"
      image_source="/home/aferreira/.config/nixos/home-manager/assets/mugen_pixel_recolor1.png"
      ascii_distro="auto"
      ascii_colors=(5 4 3 4 5 6)
      ascii_bold="on"
      image_loop="off"
      crop_mode="fit"
      crop_offset="center"
      image_size="auto"
      gap=1
      yoffset=0
      xoffset=0
      background_color=
      stdout="off"
    '';
  };

  # Kitty
  programs.kitty = {
    enable = true;
    font = {
      name = "SauceCodeProNerdFontComplete-Semibold";
      size = 16;
    };
    environment = {
      "TERM" = "xterm-kitty";
    };

    settings = {
      window_padding_width = 20;
      foreground = "#c0c0bc";
      background = "#151515";
      selection_foreground = "#151515";
      selection_background = "#c0c0bc";
      color0 = "#151515";
      color8 = "#3c3c3c";
      #: black
      color1 = "#6d3636";
      color9 = "#773e26";
      #: red
      color2 = "#458260";
      color10 = "#458260";
      #: green
      color3 = "#9f792c";
      color11 = "#9f792c";
      #: yellow
      color4 = "#444d6e";
      color12 = "#404049";
      #: blue
      color13 = "#5a446e";
      color5 = "#5a446e";
      #: magenta
      color6 = "#3d646d";
      color14 = "#4c5758";
      #: cyan
      color7 = "#e0e0dc";
      color15 = "#d0d0cc";
      #: white
    };
  };

  # GTK Theme
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy-cursors";
    };
    iconTheme = {
      package = pkgs.nordzy-icon-theme;
      name = "Nordzy-dark";
    };
  };

  # Dunst
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "keyboard";
        width = 288;
        height = 151;
        notification_limit = 3;
        origin = "top-center";
        indicate_hidden = "yes";
        shrink = "no";
        transparency = 25;
        separator_height = 2;
        padding = 10;
        horizontal_padding = 10;
        frame_width = 3;
        frame_color = "#2c2c2c";
        separator_color = "frame";
        sort = "yes";
        idle_threshold = 45;
        font = "Source Sans Pro Semibold 10";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\n%b";
        alignment = "left";
        show_age_threshold = -1;
        word_wrap = "yes";
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";
        icon_position = "left";
        max_icon_size = 64;
        #icon_path = /home/aferreira/.icons/mugendramon/status/:/home/aferreira/.icons/mugendramon/devices/
        sticky_history = "yes";
        history_length = 20;
        #browser = "/usr/bin/vivaldi-stable -new-tab";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 5;
        force_xinerama = false;
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action";
        mouse_right_click = "close_all";
      };
      experimental = {
        per_monitor_dpi = false;
      };
      urgency_low = {
        background = "#1c1c1c";
        foreground = "#e0e0dc";
        frame_color = "#202020";
        timeout = 10;
        #icon = /path/to/icon
      };
      urgency_normal = {
        background = "#1c1c1c";
        foreground = "#e0e0dc";
        frame_color = "#202020";
        timeout = 10;
        #icon = /path/to/icon
      };
      urgency_critical = {
        background = "#6d3636";
        foreground = "#e0e0dc";
        frame_color = "#202020";
        timeout = 0;
        #icon = /path/to/icon
      };
    };
    iconTheme = {
      package = pkgs.nordzy-icon-theme;
      name = "Nordzy-dark";
    };
  };

  home = {
    username = "aferreira";
    homeDirectory = "/home/aferreira";
  };

  home.stateVersion = "22.05";
}


