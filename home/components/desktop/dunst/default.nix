{ config, pkgs, vars, ... }:
let
  colors = config.colorScheme.colors;
  max_width = 300;
  max_height = 220;
in
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "keyboard";
        width = (if builtins.ceil (vars.screen.width * 0.16) < max_width then builtins.ceil (vars.screen.width * 0.16) else max_width);
        height = (if builtins.ceil (vars.screen.height * 0.2) < max_height then builtins.ceil (vars.screen.height * 0.16) else max_height);
        notification_limit = 3;
        origin = "top-center";
        indicate_hidden = "yes";
        shrink = "no";
        transparency = 25;
        separator_height = 2;
        padding = 5;
        horizontal_padding = 5;
        frame_width = 3;
        frame_color = "#${colors.base01}";
        separator_color = "frame";
        sort = "yes";
        idle_threshold = 45;
        font = "Source Sans Pro Semibold ${toString vars.fonts.dunst}";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\\n%b";
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
        background = "#${colors.base00}";
        foreground = "#${colors.base05}";
        frame_color = "#${colors.base01}";
        timeout = 10;
      };
      urgency_normal = {
        background = "#${colors.base00}";
        foreground = "#${colors.base05}";
        frame_color = "#${colors.base01}";
        timeout = 10;
      };
      urgency_critical = {
        background = "#${colors.base08}";
        foreground = "#${colors.base05}";
        frame_color = "#${colors.base01}";
        timeout = 0;
      };
    };
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-black-dark";
    };
  };
}
