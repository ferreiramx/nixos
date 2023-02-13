{ config, ... }:
let
  colors = config.colorScheme.colors;
in
''
[normal]
text               = ${colors.base05}
subtext            = ${colors.base05}
sidebar-text       = ${colors.base05}
main               = ${colors.base01}
sidebar            = ${colors.base01}
player             = ${colors.base01}
card               = ${colors.base02}
shadow             = ${colors.base0F}
selected-row       = ${colors.base02}
button             = ${colors.base03}
button-active      = ${colors.base03}
button-disabled    = ${colors.base02}
tab-active         = ${colors.base02}
notification       = ${colors.base02}
notification-error = ${colors.base0A}
misc               = ${colors.base08}
''
