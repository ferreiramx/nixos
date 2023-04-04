{ inputs, vars, ... }: {
  xdg.configFile."eww/modules/volume.yuck".text = ''
    (defwidget volume-module []
      (box
        :class "module icon"
        (eventbox
          :onscroll "echo {} | sed -e 's/up/+/g' -e 's/down/-/g' | xargs -I% wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.005%"
          :onclick "pavucontrol &"
          :onrightclick "scripts/volume mute SINK"
          (label
            :class "vol-icon"
            :tooltip "volume ''${volume.percent}%"
            :text "''${volume.icon} ''${volume.percent}%"))))
  '';
}
