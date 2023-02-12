{ config, pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nxs = "sudo nixos-rebuild switch --flake ~/.nixos/";
      nxb = "sudo nixos-rebuild build --flake ~/.nixos/";
      nxu = "nix flake lock ~/.nixos/ --update-input";

      ga = "git add";
      gc = "git commit -m";
      gb = "git branch -m";
      gp = "git push";
      gu = "git pull";
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
  # Generate Tide variables by configuring manually and running
  # grep "SETUVAR tide" ~/.config/fish/fish_variables | sed 's/SETUVAR/set -U/g' | sed 's/:/ /g' 
  xdg.configFile."fish/conf.d/nix_tide.fish".text =
    ''
      set -U tide_aws_bg_color yellow
      set -U tide_aws_color brblack
      set -U tide_aws_icon \uf270
      set -U tide_character_color 4c5758
      set -U tide_character_color_failure brred
      set -U tide_character_icon \uf054
      set -U tide_character_vi_icon_default \u276e
      set -U tide_character_vi_icon_replace \u25b6
      set -U tide_character_vi_icon_visual V
      set -U tide_chruby_bg_color red
      set -U tide_chruby_color black
      set -U tide_chruby_icon \ue23e
      set -U tide_cmd_duration_bg_color yellow
      set -U tide_cmd_duration_color black
      set -U tide_cmd_duration_decimals 0
      set -U tide_cmd_duration_icon \uf252
      set -U tide_cmd_duration_threshold 3000
      set -U tide_context_always_display true
      set -U tide_context_bg_color "333333"
      set -U tide_context_color_default c0c0bc
      set -U tide_context_color_root yellow
      set -U tide_context_color_ssh yellow
      set -U tide_context_hostname_parts 1
      set -U tide_crystal_bg_color brwhite
      set -U tide_crystal_color black
      set -U tide_crystal_icon \u2b22
      set -U tide_docker_bg_color blue
      set -U tide_docker_color black
      set -U tide_docker_default_contexts default\x1ecolima
      set -U tide_docker_icon \uf308
      set -U tide_git_bg_color "458260"
      set -U tide_git_bg_color_unstable 9f792c
      set -U tide_git_bg_color_urgent 6d3636
      set -U tide_git_color_branch black
      set -U tide_git_color_conflicted black
      set -U tide_git_color_dirty black
      set -U tide_git_color_operation black
      set -U tide_git_color_staged black
      set -U tide_git_color_stash black
      set -U tide_git_color_untracked black
      set -U tide_git_color_upstream black
      set -U tide_git_icon \uf418
      set -U tide_git_truncation_length 24
      set -U tide_go_bg_color brcyan
      set -U tide_go_color black
      set -U tide_go_icon \ue627
      set -U tide_java_bg_color yellow
      set -U tide_java_color black
      set -U tide_java_icon \ue256
      set -U tide_jobs_bg_color brblack
      set -U tide_jobs_color green
      set -U tide_jobs_icon \uf013
      set -U tide_kubectl_bg_color blue
      set -U tide_kubectl_color black
      set -U tide_kubectl_icon \u2388
      set -U tide_left_prompt_frame_enabled false
      set -U tide_left_prompt_items os\x1econtext\x1epwd\x1enewline\x1echaracter
      set -U tide_left_prompt_items_context_always_display true
      set -U tide_left_prompt_prefix \u2591\u2592\u2593
      set -U tide_left_prompt_separator_diff_color \ue0b0
      set -U tide_left_prompt_separator_same_color \ue0b1
      set -U tide_left_prompt_suffix \ue0b0
      set -U tide_nix_shell_bg_color 7EBAE4
      set -U tide_nix_shell_color black
      set -U tide_nix_shell_icon \uf313
      set -U tide_node_bg_color green
      set -U tide_node_color black
      set -U tide_node_icon \u2b22
      set -U tide_os_bg_color 6d3636
      set -U tide_os_color "202020"
      set -U tide_os_icon \uf313
      set -U tide_php_bg_color blue
      set -U tide_php_color black
      set -U tide_php_icon \ue608
      set -U tide_private_mode_bg_color "202020"
      set -U tide_private_mode_color c0c0bc
      set -U tide_private_mode_icon \ufaf8
      set -U tide_prompt_add_newline_before true
      set -U tide_prompt_color_frame_and_connection brblack
      set -U tide_prompt_color_separator_same_color brblack
      set -U tide_prompt_icon_connection \x20
      set -U tide_prompt_min_cols 34
      set -U tide_prompt_pad_items true
      set -U tide_pwd_bg_color 5a446e
      set -U tide_pwd_color_anchors c0c0bc
      set -U tide_pwd_color_dirs c0c0bc
      set -U tide_pwd_color_truncated_dirs c0c0bc
      set -U tide_pwd_icon \uf07c
      set -U tide_pwd_icon_home \uf015
      set -U tide_pwd_icon_unwritable \uf023
      set -U tide_pwd_markers \x2ebzr\x1e\x2ecitc\x1e\x2egit\x1e\x2ehg\x1e\x2enode\x2dversion\x1e\x2epython\x2dversion\x1e\x2eruby\x2dversion\x1e\x2eshorten_folder_marker\x1e\x2esvn\x1e\x2eterraform\x1eCargo\x2etoml\x1ecomposer\x2ejson\x1eCVS\x1ego\x2emod\x1epackage\x2ejson
      set -U tide_right_prompt_frame_enabled false
      set -U tide_right_prompt_items git\x1enix_shell\x1evirtual_env\x1eprivate_mode
      set -U tide_right_prompt_prefix \ue0b2
      set -U tide_right_prompt_separator_diff_color \ue0b2
      set -U tide_right_prompt_separator_same_color \ue0b3
      set -U tide_right_prompt_suffix \u2593\u2592\u2591
      set -U tide_rustc_bg_color red
      set -U tide_rustc_color black
      set -U tide_rustc_icon \ue7a8
      set -U tide_shlvl_bg_color yellow
      set -U tide_shlvl_color black
      set -U tide_shlvl_icon \uf120
      set -U tide_shlvl_threshold 1
      set -U tide_status_bg_color black
      set -U tide_status_bg_color_failure red
      set -U tide_status_color green
      set -U tide_status_color_failure bryellow
      set -U tide_status_icon \u2714
      set -U tide_status_icon_failure \u2718
      set -U tide_terraform_bg_color magenta
      set -U tide_terraform_color black
      set -U tide_terraform_icon \x1d
      set -U tide_time_bg_color white
      set -U tide_time_color black
      set -U tide_time_format 
      set -U tide_toolbox_bg_color magenta
      set -U tide_toolbox_color black
      set -U tide_toolbox_icon \u2b22
      set -U tide_vi_mode_bg_color_default white
      set -U tide_vi_mode_bg_color_insert cyan
      set -U tide_vi_mode_bg_color_replace green
      set -U tide_vi_mode_bg_color_visual yellow
      set -U tide_vi_mode_color_default black
      set -U tide_vi_mode_color_insert black
      set -U tide_vi_mode_color_replace black
      set -U tide_vi_mode_color_visual black
      set -U tide_vi_mode_icon_default D
      set -U tide_vi_mode_icon_insert I
      set -U tide_vi_mode_icon_replace R
      set -U tide_vi_mode_icon_visual V
      set -U tide_virtual_env_bg_color brblack
      set -U tide_virtual_env_color cyan
      set -U tide_virtual_env_icon \ue73c
    '';
}
 