{ inputs, vars, ... }: {
  xdg.configFile."eww/modules/bright.yuck".text = ''
    (defwidget bright []
    (box
      :class "module"
      (eventbox
        :onscroll "echo {} | sed -e 's/up/-U 1/g' -e 's/down/-A 1/g' | xargs light"
        (label
          :text {brightness.icon}
          :class "bright-icon icon"
          :tooltip "brightness ''${round(brightness.percent, 0)}%"))))
  '';
}
