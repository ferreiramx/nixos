{ pkgs, vars, ... }: {
   services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "keyboard";
        width = builtins.ceil (vars.screen.width * 0.16);
        height = builtins.ceil (vars.screen.height * 0.2);
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
        font = "Source Sans Pro Semibold ${toString vars.fonts.dunst}";
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
        sticky_history = "yes";
        history_length = 20;
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
      };
      urgency_normal = {
        background = "#1c1c1c";
        foreground = "#e0e0dc";
        frame_color = "#202020";
        timeout = 10;
      };
      urgency_critical = {
        background = "#6d3636";
        foreground = "#e0e0dc";
        frame_color = "#202020";
        timeout = 0;
      };
    };
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-black-dark";
    };
  };
  }