{ inputs, vars, ... }: {
  xdg.configFile."eww/modules/sys.yuck".text = ''
    (defwidget sys []
      (box
        :class "module"
        :space-evenly false
        :spacing 5
        (circular-progress
          :value "''${EWW_CPU.avg}"
          :class "cpubar"
          :thickness 3
          (button
            :tooltip "using ''${round(EWW_CPU.avg,0)}% cpu"
            :onclick "''${EWW_CMD} open --toggle system-menu"
            (label :class "icon-text" :text "")))

        (circular-progress
          :value {memory.percent}
          :class "membar"
          :thickness 3
          (button
            :tooltip "using ''${round(memory.percent,0)}% ram"
            :onclick "''${EWW_CMD} open --toggle system-menu"
            (label :class "icon-text" :text "")))
''
+
(
    # Add battery indicator if this is a laptop
    if (vars.class == "laptop")
    then ''
    (circular-progress
          :value "''${EWW_BATTERY["BAT0"].capacity}"
          :class "batbar"
          :thickness 3
          (button
            :tooltip "battery on ''${EWW_BATTERY["BAT0"].capacity}%"
            :onclick "''${EWW_CMD} open --toggle system-menu"
            (label :class "icon-text" :text "")))
    ''
    else ""
)
+
''))'';
}
