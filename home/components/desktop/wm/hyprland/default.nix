{ inputs, pkgs, vars, ... }: {
  imports = [
    ../../rofi
    ../../dunst
    inputs.hyprland.homeManagerModules.default
    # inputs.eww.homeManagerModules.eww-hyprland
  ];

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = /home/aferreira/.wp.png
    wallpaper = ${vars.screen.name},/home/aferreira/.wp.png
  '';

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''
      exec-once = hyprpaper
      monitor =,preferred,auto,1
      input {
        follow_mouse = 1
        accel_profile = adaptive
        force_no_accel = false
        scroll_method = 2fg
        touchpad {
          disable_while_typing = true
          natural_scroll = no
          scroll_factor = 1.2
          middle_button_emulation = false
          clickfinger_behavior = true
          drag_lock = true
        }
        force_no_accel = false
        scroll_method = 2fg
        kb_layout = us,latam
        kb_options = grp:alt_shift_toggle
      }

      general {
        gaps_in = 3
        gaps_out = 8
        border_size = 2
        cursor_inactive_timeout = 30
        layout = master  
      }

      decoration {
        rounding = 12
        multisample_edges = true
        active_opacity = 1.0
        inactive_opacity = 0.95
        fullscreen_opacity = 1.0
        blur = true
        blur_size = 8
        blur_passes = 1
        blur_ignore_opacity = false
        blur_new_optimizations = true
        blur_xray = false
        drop_shadow = true
        shadow_range = 4
        shadow_render_power = 3
        shadow_ignore_window = true
        col.shadow = rgb(000000)
        shadow_offset = 0 0
        dim_inactive = false
        dim_strength = 0.5
      }

      animations {
        enabled = true
      }

      gestures {
        workspace_swipe = true
        workspace_swipe_fingers = 3
        workspace_swipe_distance = 250
        workspace_swipe_invert = true
        workspace_swipe_min_speed_to_force = 20
        workspace_swipe_cancel_ratio = 0.5
        workspace_swipe_forever = false
        workspace_swipe_numbered = true
      }

      misc {
        disable_hyprland_logo = true
        vfr = true
        vrr = 0
        mouse_move_enables_dpms = true
        key_press_enables_dpms = true
        always_follow_on_dnd = true
        layers_hog_keyboard_focus = true
        enable_swallow = false
        focus_on_activate = false
        no_direct_scanout = true
        mouse_move_focuses_monitor = true
        render_ahead_of_time = false
        render_ahead_safezone = 2
      }

      binds {
        workspace_back_and_forth = true
        allow_workspace_cycles = true
      }

      master {
        new_is_master = false
        new_on_top = false
        special_scale_factor = 0.8
        mfact = 0.5
        no_gaps_when_only = true
        orientation = center
        inherit_fullscreen = true
        always_center_master = false
      }
      
      bindm = SUPER,mouse:272,movewindow
      bindm = SUPER,mouse:273,resizewindow
      bind = SUPER,F,togglefloating,
      bind = SUPER,Q,killactive,
      bind = SUPER_SHIFT,M,layoutmsg,swapwithmaster auto
      bind = SUPER,M,layoutmsg,focusmaster auto
      bind = SUPER,TAB,layoutmsg,orientationnext
      bind = SUPER_SHIFT,TAB,layoutmsg,orientationprev

      bind = SUPER,H,movefocus,l
      bind = SUPER,L,movefocus,r
      bind = SUPER,J,movefocus,u
      bind = SUPER,K,movefocus,d
      bind = SUPER,left,movefocus,l
      bind = SUPER,right,movefocus,r
      bind = SUPER,up,movefocus,u
      bind = SUPER,down,movefocus,d

      bind = SUPER_SHIFT,H,movewindow,l
      bind = SUPER_SHIFT,L,movewindow,r
      bind = SUPER_SHIFT,J,movewindow,u
      bind = SUPER_SHIFT,K,movewindow,d
      bind = SUPER_SHIFT,left,movewindow,l
      bind = SUPER_SHIFT,right,movewindow,r
      bind = SUPER_SHIFT,up,movewindow,u
      bind = SUPER_SHIFT,down,movewindow,d

      bind = SUPER,1,workspace,1
      bind = SUPER,2,workspace,2
      bind = SUPER,3,workspace,3
      bind = SUPER,4,workspace,4
      bind = SUPER,5,workspace,5
      bind = SUPER,6,workspace,6
      bind = SUPER,7,workspace,7
      bind = SUPER,8,workspace,8
      bind = SUPER,9,workspace,9
      bind = SUPER,0,workspace,0

      bind = SUPER_SHIFT,1,movetoworkspace,1
      bind = SUPER_SHIFT,2,movetoworkspace,2
      bind = SUPER_SHIFT,3,movetoworkspace,3
      bind = SUPER_SHIFT,4,movetoworkspace,4
      bind = SUPER_SHIFT,5,movetoworkspace,5
      bind = SUPER_SHIFT,6,movetoworkspace,6
      bind = SUPER_SHIFT,7,movetoworkspace,7
      bind = SUPER_SHIFT,8,movetoworkspace,8
      bind = SUPER_SHIFT,9,movetoworkspace,9
      bind = SUPER_SHIFT,0,movetoworkspace,0

      bind = SUPER,RETURN,exec,kitty
      bind = SUPER,D,exec,sh ~/.config/rofi/launcher/launcher.sh
      bind = SUPER,ESCAPE,exec,sh ~/.config/rofi/powermenu/powermenu.sh
    '';
  };

  programs.swaylock.settings = {
    color = "121212";
    font-size = 24;
    indicator-idle-visible = false;
    indicator-radius = 100;
    line-color = "acacac";
    show-failed-attempts = true;
  };

  # programs.eww-hyprland = {
  #   enable = true;
  #   package = pkgs.eww-wayland;
  #   # colors = TODO: add colors
  #   autoReload = true;
  # };

  programs.waybar = {
    enable = false;
    systemd.enable = false;
    style = ''
      window#waybar {
        background: #121212;
        color: #ACACAC;
        padding: 0 5px;
        border: none;
        border-radius: 12;
      }
      #custom-osicon {
        font-family: SauceCodePro Nerd Font;
        font-size: ${builtins.toString vars.fonts.os-icon};
      }
      #workspaces {
        font-family: Material Design Icons;
        font-size: ${builtins.toString vars.fonts.small-icon};
        margin: 0;
        padding: 0;
      }
      #window {
        font-family: Source Sans Pro;
        font-size: ${builtins.toString vars.fonts.sans};
      }
      #clock {
        font-family: Source Sans Pro;
        font-size: ${builtins.toString vars.fonts.sans};
      }
    '';
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 5;
        modules-left = [
          "custom/osicon"
          "wlr/workspaces"
          "hyprland/window"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "cpu"
          "memory"
          "network"
          "temperature"
          "battery"
          "tray"
          ];

        "custom/osicon" = {
          format = "<span font_weight='bold'></span>";
        };

        "tray" = {
          icon-size = vars.fonts.small-icon;
          spacing = 6;
        };

        "clock" = {
          timezone = "America/Mexico_City";
          locale = "en_US.utf8";
          format = "{:%a, %b %d %R}";
        };
        
        "wlr/workspaces" = {
          format = "{icon}";
          on-scroll-up = "hyprctl disparch workspace e+1";
          on-scroll-down = "hyprctl disparch workspace e-1";
          on-click = "activate";
          format-icons = {
            "1" = "󰎤";
            "2" = "󰎧";
            "3" = "󰎪";
            "4" = "󰎭";
            "5" = "󰎱";
            "6" = "󰎳";
            "7" = "󰎶";
            "8" = "󰎹";
            "9" = "󰎼";
          };
        };

      };
    };
  };
}
