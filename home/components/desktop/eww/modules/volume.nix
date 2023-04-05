{ inputs, vars, ... }: {
  xdg.configFile."eww/modules/volume.yuck".text = ''
    (defwidget volume-module []
      (box
        :class "module icon"
        :space-evenly false
        (eventbox
          :class "volume-slider-box"
          :onscroll "echo {} | sed -e 's/up/+/g' -e 's/down/-/g' | xargs -I% wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.03%"
          :onrightclick "pavucontrol &"
          :onclick "scripts/volume mute SINK"
          (label
            :class "volume-icon icon"
            :tooltip "volume ''${volume.percent}%"
            :text {volume.icon}))
          (scale
              :class "volume-bar"
              :value {volume.percent}
              :tooltip "volume on ''${volume.percent}%"
              :onchange "scripts/volume setvol SINK {}")
            ))
  '';
}
