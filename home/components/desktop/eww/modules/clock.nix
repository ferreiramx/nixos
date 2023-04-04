{ inputs, vars, ... }: {
  xdg.configFile."eww/modules/clock.yuck".text = ''
    (defvar date_rev false)

    (defwidget clock_module []
      (eventbox
        :onhover "''${EWW_CMD} update date_rev=true"
        :onhoverlost "''${EWW_CMD} update date_rev=false"
        (overlay
          :class "module"
          (box
            :space-evenly false
            (label
              :text {time.hour}
              :class "hour")
            (label
              :text ":")
            (label
              :text {time.minute}
              :class "minute"))
          (revealer
            :reveal date_rev
            (button
              :class "date"
              :onclick "''${EWW_CMD} open --toggle calendar"
              {time.date})))))
  '';
}