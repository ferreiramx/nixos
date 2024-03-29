{ inputs, vars, ... }: {
  imports = [
    ./css.nix
    ../../modules
  ];

  xdg.configFile."eww/windows/calendar.yuck".text = ''
    (defwidget calendar-win []
      (box
        :class "calendar-win"
        (calendar)))

    (defwindow calendar
      :monitor 0
      :geometry (geometry
        :x "0%"
        :y "0%"
      	:anchor "top right"
        :width "0px"
        :height "0px")
      (calendar-win))
  '';
}
