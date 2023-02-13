{ config, ... }:
let
    colors = config.colorScheme.colors;
in
''
* {
    background: #${colors.base01};
    foreground: #${colors.base05};
    background-color: @background;
    border-color: #${colors.base02};
    border: @border-color;
    border-alt: @border-color;
    selected-foreground: #${colors.base03};
    urgent: #${colors.base0A};

    active-background: #${colors.base02};
    active-foreground: @foreground;
    normal-background: #${colors.base01};
    normal-foreground: @foreground;
    urgent-background: #${colors.base02};
    urgent-foreground: @foreground;

    alternate-active-background: @active-background;
    alternate-active-foreground: @foreground;
    alternate-normal-background: @normal-background;
    alternate-normal-foreground: @foreground;
    alternate-urgent-background: @urgent-background;
    alternate-urgent-foreground: @foreground;

    selected-active-background: #${colors.base03};
    selected-active-foreground: @foreground;
    selected-normal-background: #${colors.base02};
    selected-normal-foreground: @foreground;
    selected-urgent-background: #${colors.base0A};
    selected-urgent-foreground: @foreground; 
}
''