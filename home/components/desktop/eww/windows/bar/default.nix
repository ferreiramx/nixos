{ inputs, vars, ... }: {
  imports = [
    ./css.nix
    ../../modules
  ];

  xdg.configFile."eww/windows/bar.yuck".text = ''
    (include "./modules/bluetooth.yuck")
    (include "./modules/bright.yuck")
    (include "./modules/clock.yuck")
    (include "./modules/music.yuck")
    (include "./modules/net.yuck")
    (include "./modules/sys.yuck")
    (include "./modules/variables.yuck")
    (include "./modules/volume.yuck")
    (include "./modules/workspaces.yuck")
    (defwidget left []
          (box
            :space-evenly false
            :halign "start"
            (workspaces)
            (volume-module)
            ))

    (defwidget center []
          (box
            :space-evenly false
            :halign "center"
            (music-module)
            ))

    (defwidget right []
      (box
        :space-evenly false
        :halign "end"
''
+
(
    # Add backlight indicator if this is a laptop
    if (vars.class == "laptop")
    then ''
    (bright)
    ''
    else ""
)
+
''        
        (bluetooth)
        (net)
        (sys)
        (clock_module)
        ))

    (defwidget bar-box []
      (centerbox
        (left)
        (center)
        (right)))

    (defwindow bar
        :monitor 0
        :geometry (geometry :x "0%"
          :y "0%"
          :width "100%"
          :height "3%"
          :anchor "top center")
        :stacking "fg"
        :exclusive true
      (bar-box))
  '';
}
