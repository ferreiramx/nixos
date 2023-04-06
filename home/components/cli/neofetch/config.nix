''
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
      colors=(7 3 7 7 3 7)
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
      ascii_distro="auto"
      ascii_colors=(13 12)
      ascii_bold="on"
      gap=1
      yoffset=0
      xoffset=0
      background_color=
      stdout="off"
    ''