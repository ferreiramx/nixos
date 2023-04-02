{ inputs, ... }: {
  imports = [
    ./common

    ./components/cli

    ./components/term/kitty

    ./components/desktop
    # ./components/desktop/wm/qtile
    inputs.hyprland.homeManagerModules.default
    ./components/desktop/vscode
    ./components/desktop/spotify
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''
      monitor =,preferred,auto,1
      input {
        follow_mouse = 0
        force_no_accel = true
        touchpad {
          natural_scroll = no
        }
      }

      general {
        gaps_in = 5
        gaps_out = 10
        border_size = 3  
      }

      decoration {
        rounding = 10
        blur = 1
        blur_size = 3
        blur_passes = 1
        blur_new_optimizations = 1
      }

      dwindle {
        pseudotile = 1
      }

      gestures {
        workspace_swipe = yes
      }
      
      bindm = SUPER,mouse:272,movewindow
      bindm = SUPER,mouse:273,resizewindow
      bind = SUPER,V,togglefloating,
      bind = SUPER,P,pseudo,
      bind = SUPER,C,killactive,
      bind = SUPER,left,movefocus,l
      bind = SUPER,right,movefocus,r
      bind = SUPER,up,movefocus,u
      bind = SUPER,down,movefocus,d

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
    '';
  };
  colorScheme = inputs.nix-colors.colorschemes.black-metal-immortal;
  home.file.".face".source = ./common/assets/img/face.png;
  home.file.".wp".source = ./common/assets/wp/black.png;
}
