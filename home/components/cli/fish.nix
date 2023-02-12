{ config, pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nxs = "sudo nixos-rebuild switch --flake ~/.nixos/";
      nxb = "sudo nixos-rebuild build --flake ~/.nixos/";
      nxu = "nix flake lock ~/.nixos/ --update-input";
    };
    shellInit = ''
        set -U fish_greeting
      '';
      
    interactiveShellInit = ''
        any-nix-shell fish | source
      '';
  };

  xdg.configFile."fish/conf.d/kitty.fish".text =
    ''
      set --global KITTY_INSTALLATION_DIR "${pkgs.kitty}/lib/kitty"
      set --global KITTY_SHELL_INTEGRATION enabled
      source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
      set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
    '';
  xdg.configFile."fish/conf.d/nix_theme.fish".text =
    ''
      set -U fish_color_autosuggestion 9C9C9C
      set -U fish_color_cancel -r
      set -U fish_color_command F4F4F4
      set -U fish_color_comment B0B0B0
      set -U fish_color_cwd normal
      set -U fish_color_cwd_root red
      set -U fish_color_end 969696
      set -U fish_color_error FFA779
      set -U fish_color_escape 00a6b2
      set -U fish_color_history_current --bold
      set -U fish_color_host normal
      set -U fish_color_host_remote
      set -U fish_color_keyword F4F4F4
      set -U fish_color_match --background=brblue
      set -U fish_color_normal normal
      set -U fish_color_operator 00a6b2
      set -U fish_color_option A0A0F0
      set -U fish_color_param A0A0F0
      set -U fish_color_quote 666A80
      set -U fish_color_redirection FAFAFA
      set -U fish_color_search_match 'bryellow'  '--background=brblack'
      set -U fish_color_selection 'white'  '--bold'  '--background=brblack'
      set -U fish_color_status red
      set -U fish_color_user normal
      set -U fish_color_valid_path --underline
      set -U fish_pager_color_background
      set -U fish_pager_color_completion normal
      set -U fish_pager_color_description 'B3A06D'  'yellow'
      set -U fish_pager_color_prefix 'normal'  '--bold'  '--underline'
      set -U fish_pager_color_progress 'brwhite'  '--background=cyan'
      set -U fish_pager_color_secondary_background
      set -U fish_pager_color_secondary_completion
      set -U fish_pager_color_secondary_description
      set -U fish_pager_color_secondary_prefix
      set -U fish_pager_color_selected_background --background=brblack
      set -U fish_pager_color_selected_completion
      set -U fish_pager_color_selected_description
      set -U fish_pager_color_selected_prefix
    '';
}
 