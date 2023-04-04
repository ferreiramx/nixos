{ inputs, vars, ... }: {
  xdg.configFile."eww/modules/net.yuck".text = ''
    (defwidget net []
      (button
        :class "module icon"
        :onclick "gnome-control-center &"
        :tooltip {net.essid}
        :style "color: ''${net.color};"
        {net.icon}))
  '';
}
