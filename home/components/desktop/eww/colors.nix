{ config, inputs, vars, ... }: 
let
  colors = config.colorScheme.colors;
  conversions = inputs.nix-colors.lib-core.conversions;
in
{
xdg.configFile."eww/css/_colors.scss".text = ''
    
    $accent1:     #${colors.base0C};
    $accent2:     #${colors.base0D};
    $accent3:     #${colors.base0E};
    $accent4:     #${colors.base0F};
    $highlight1:  #${colors.base08};
    $highlight2:  #${colors.base0B};
    $highlight3:  #${colors.base0A};
    $highlight4:  #${colors.base08};
    $highlight5:  #${colors.base0B};


    $text:        #${colors.base05};
    $subtext1:    #${colors.base06};
    $subtext0:    #${colors.base07};
    $overlay2:    #${colors.base0D};
    $overlay1:    #${colors.base0E};
    $overlay0:    #${colors.base0F};

    $surface2:    #${colors.base08};
    $surface1:    #${colors.base0B};
    $surface0:    #${colors.base0A};

    $base:        #${colors.base01};
    $mantle:      #${colors.base03};
    $crust:       #${colors.base00};

    $fg:          $text;
    $bg:          rgba(${(conversions.hexToRGBString "," colors.base01)}, 0.95);
    $bg1:         rgba(${(conversions.hexToRGBString "," colors.base02)}, 0.95);
    $border:      #${colors.base01};
    $shadow:      $crust;
  '';
}