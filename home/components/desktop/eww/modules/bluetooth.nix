{ inputs, vars, ... }: {
  xdg.configFile."eww/modules/bluetooth.yuck".text = ''
    (defwidget bluetooth []
    (button
      :class "module-bt module icon"
      :onclick "blueberry"
      :onrightclick "scripts/bluetooth toggle"
      :tooltip "''${bluetooth.text} ''${bluetooth.battery}"
      :style "color: ''${bluetooth.color};"
      {bluetooth.icon}))
  '';
}
