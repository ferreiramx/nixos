{ inputs, vars, ... }: {
  imports = [
    ./css.nix
    ../../modules
  ];

  xdg.configFile."eww/windows/system-menu.yuck".text = ''
    (defwidget system-menu []
      (box
        :class "system-menu-box"
        :space-evenly false
        :orientation "v"
        (box
          :class "top-row"
          :space-evenly false
          (label
            :class "time"
            :text "''${time.hour}:''${time.minute}")
          (box
            :class "date-box"
            :space-evenly false
            (label
              :class "date"
              :text {time.date})
            (label
              :class "day"
              :text {time.day})))

        (centerbox
          :class "system-row"
          (box
            :class "wifi-box"
            :space-evenly false
            :orientation "v"
            (box
              :class "element icon ''${net.class}"
              :space-evenly false
              (button
                :class "wifi-button"
                :onclick "scripts/net toggle"
                {net.icon})
              (label
                :class "separator"
                :text "│")
              (button
                :class "wifi-arrow-btn"
                :onclick "eww close system-menu && gnome-control-center &"
                ""))
            (label
              :text {net.essid}
              :xalign 0.5
              :limit-width 15))

          (box
            :class "bluetooth-box"
            :space-evenly false
            :orientation "v"
            (box
              :class "element icon ''${bluetooth.class}"
              :space-evenly false
              (button
                :class "bluetooth-button"
                :onclick "scripts/bluetooth toggle"
                {bluetooth.icon})
              (label
                :class "separator"
                :text "│")
              (button
                :class "bluetooth-arrow-btn"
                :onclick "eww close system-menu && blueberry"
                ""))
            (label
              :text {bluetooth.text}
              :xalign 0.5
              :tooltip "''${bluetooth.text} ''${bluetooth.battery}"
              :limit-width 15))

          (box
            :class "airplane-box"
            :space-evenly false
            :orientation "v"
            (box
              :class "element"
              (button
                :class "airplane-button"
                :onclick "scripts/airplane toggle"
                airplane))
            (label
              :text "Airplane Mode"
              :xalign 0.5
              :limit-width 16)))

        (box
          :class "sliders"
          :orientation "v"
          (box
            :class "volume-slider-box"
            :space-evenly false
            (button
              :class "volume-icon icon"
              :onclick "scripts/volume mute SINK"
              {volume.icon})
            (scale
              :class "volume-bar"
              :value {volume.percent}
              :tooltip "volume on ''${volume.percent}%"
              :onchange "scripts/volume setvol SINK {}"))
  ''
  +
  (
    if (vars.class == "laptop") then
      ''
        (box
          :class "brightness-slider-box"
          :space-evenly false
          (button
            :class "brightness-slider-icon icon"
            {brightness.icon})
          (scale
            :class "brightness-slider"
            :min 0
            :max 255
            :value {brightness.percent} 
            :marks true 
            :onchange "brightnessctl set {}"
          )          
        )
      ''
    else ""
  )
  +
  ''
    )
    ; CPU & Memory Usage
    (box
      :class "system-info-box"

      ; cpu
      (box
        :class "sys-box"
        :space-evenly false
        :halign "start"
        (circular-progress
          :value "''${EWW_CPU.avg}"
          :class "sys-cpu"
          :thickness 3
          (label
            :text ""
            :class "sys-icon-cpu icon"))
        (box
          :orientation "v"
          :vexpand false
          (label
            :text "CPU"
            :halign "start"
            :class "sys-text-cpu")
          (label
            :text "''${round(EWW_CPU.avg,2)}%"
            :halign "start"
            :class "sys-text-sub")
          (label
            :text "''${EWW_CPU.cores[0].freq} MHz"
            :halign "start"
            :class "sys-text-sub")))

      ; memory
      (box
        :class "sys-box"
        :space-evenly false
        :halign "end"
        (circular-progress
          :value {memory.percent}
          :class "sys-mem"
          :thickness 3
          (label
            :text ""
            :class "sys-icon-mem icon"))
        (box
          :orientation "v"
          (label
            :text "Memory"
            :halign "start"
            :class "sys-text-mem")
          (label
            :text "''${memory.percent}%"
            :halign "start"
            :class "sys-text-sub")
          (label
            :text "''${memory.used} | ''${memory.total}"
            :halign "start"
            :class "sys-text-sub"))))

    ; CPU & GPU Temps
    (box
      :class "system-info-box"

      ; CPU
      (box
        :class "sys-box"
        :space-evenly false
        :halign "start"
        (circular-progress
          :value "''${EWW_TEMPS.K10TEMP_TCTL}"
          :class "sys-cpu-temp"
          :thickness 3
          (label
            :text ""
            :class "sys-icon-cpu-temp icon"))
        (box
          :orientation "v"
          :vexpand false
          (label
            :text "CPU Temp"
            :halign "start"
            :class "sys-text-cpu-temp")
          (label
            :text "''${EWW_TEMPS.K10TEMP_TCTL}°C"
            :halign "start"
            :class "sys-text-sub")
          ))

      ; GPU
      (box
        :class "sys-box"
        :space-evenly false
        :halign "end"
        (circular-progress
          :value "''${EWW_TEMPS.AMDGPU_EDGE}"
          :class "sys-gpu-temp"
          :thickness 3
          (label
            :text ""
            :class "sys-icon-gpu-temp icon"))
        (box
          :orientation "v"
          (label
            :text "GPU Temp"
            :halign "start"
            :class "sys-text-gpu-temp")
          (label
            :text "''${EWW_TEMPS.AMDGPU_EDGE}°C"
            :halign "start"
            :class "sys-text-sub")
          )))
    
  ''
  +
  (
    if (vars.class == "laptop") then
      ''
    (centerbox
      :class "bottom-row"
      (box
        :class "battery-box"
        :space-evenly false
        :halign "start"          
            (label
              :class "battery-icon icon"
              :style "color: ''${battery.color}"
              :text {battery.icon})
            (label
              :text {EWW_BATTERY["BAT0"].capacity})
            (label
              :class "battery-status"
              :text {battery.status})
            (label
              :class "battery-wattage"
              :text {battery.wattage}))
    (label)
    (box
      :space-evenly false
      :halign "end"
      (button
        :halign "end"
        :class "power-button icon"
        :onclick "wlogout -p layer-shell &"
        "")))
      ''
    else       ''
    (centerbox
      :class "bottom-row"
      (label)
      (box
      :space-evenly false
      :halign "end"
      (button
        :halign "end"
        :class "power-button icon"
        :onclick "wlogout -p layer-shell &"
        ""))
      (label)
      )
      ''
  )
  +
  ''      
              ))

    (defwindow system-menu
      :stacking "fg" 
      :monitor 0
      :geometry (geometry
        :x "0"
        :y "0"
        :width "0%"
        :height "0%"
        :anchor "right top")
      (system-menu))
  '';
}
