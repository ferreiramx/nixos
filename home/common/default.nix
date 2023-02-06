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


