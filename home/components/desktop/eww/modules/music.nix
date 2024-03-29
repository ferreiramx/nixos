{ inputs, vars, ... }: {
  xdg.configFile."eww/modules/music.yuck".text = ''
    (defwidget music-module []
      (eventbox
        :onhover "''${EWW_CMD} update music_reveal=true"
        :onhoverlost "''${EWW_CMD} update music_reveal=false"
        (box
          :class "module"
          :space-evenly false
          (box
            :class "song-cover-art"
            :style "background-image: url(\"''${music.cover}\");")
          (button
            :class "module"
            :onclick "''${EWW_CMD} open --toggle music && ''${EWW_CMD} open --toggle music-closer"
            "''${music.title} - ''${music.artist}")
          (revealer
            :transition "slideright"
            :reveal music_reveal
            :duration "350ms"
            (box
              :class "icon"
              (button :class "song-button" :onclick "playerctl previous" "")
              (button :class "song-button" :onclick "playerctl play-pause" {music.status})
              (button :class "song-button" :onclick "playerctl next" ""))))))
  '';
}
