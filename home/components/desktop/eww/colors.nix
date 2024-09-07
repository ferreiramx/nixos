{ config, inputs, vars, ... }: 
let
  colors = config.colorScheme.palette;
  conversions = inputs.nix-colors.lib-core.conversions;
in
{
xdg.configFile."eww/css/_colors.scss".text = ''
    $bg1:       #${colors.base00};
    $bg2:       #${colors.base01};
    $bg3:       #${colors.base02};
    $bg4:       #${colors.base03};
    $fg1:       #${colors.base04};
    $fg2:       #${colors.base05};
    $fg3:       #${colors.base06};
    $fg4:       #${colors.base07};
    $accent1:   #${colors.base08};
    $accent2:   #${colors.base09};
    $accent3:   #${colors.base0A};
    $accent4:   #${colors.base0B};
    $accent5:   #${colors.base0C};
    $accent6:   #${colors.base0D};
    $accent7:   #${colors.base0E};
    $accent8:   #${colors.base0F};

    $text:      $fg2;
    $fg:        $fg2;
    $bg:        $bg1;
    $border:    $bg2;
    $shadow:    rgba(18, 18, 18, 0.8);
  '';
}