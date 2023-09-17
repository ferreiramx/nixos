{ config, inputs, pkgs, vars, ... }: 
let
  colors = config.colorScheme.colors;
  nix-colors-lib = inputs.nix-colors.lib-contrib { inherit pkgs; };
  wallpaper = nix-colors-lib.nixWallpaperFromScheme {
    scheme = config.colorScheme;
    width = vars.screen.width;
    height = vars.screen.height;
    logoScale = 5.0;
  };
in
{
  imports = [
    ../../rofi
    ../../dunst
    ../../eww
    inputs.hyprland.homeManagerModules.default
  ];

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${wallpaper}
    wallpaper = ${vars.screen.name},${wallpaper}
  '';

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''
      exec = hyprpaper
      exec-once = eww open bar
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
        inactive_opacity = 1.0
        fullscreen_opacity = 1.0
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
        always_center_master = ${(if vars.screen.ultrawide then "true" else "false")}
        allow_small_split = true
      }
      
      bindm = SUPER,mouse:272,movewindow
      bindm = SUPER,mouse:273,resizewindow
      bind = SUPER,F,togglefloating,
      bind = SUPER,Q,killactive,
      bind = SUPER_SHIFT,M,layoutmsg,swapwithmaster auto
      bind = SUPER,M,layoutmsg,focusmaster auto
      bind = SUPER,TAB,layoutmsg,orientationnext
      bind = SUPER_SHIFT,TAB,layoutmsg,orientationprev

      bind = SUPER_SHIFT,SPACE,layoutmsg,removemaster
      bind = SUPER,SPACE,layoutmsg,addmaster

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
    color = "${colors.base00}";
    font-size = vars.fonts.sans;
    indicator-idle-visible = false;
    indicator-radius = 100;
    inside-color = "${colors.base01}";
    line-color = "${colors.base01}";
    ring-color = "${colors.base01}";
    key-hl-color = "${colors.base02}";
    inside-ver-color = "${colors.base08}";
    ring-ver-color = "${colors.base08}";
    inside-clear-color = "${colors.base0C}";
    ring-clear-color = "${colors.base0C}";
    show-failed-attempts = true;
  };
}
