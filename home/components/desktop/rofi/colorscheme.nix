{ config, ... }:
let
    colors = config.colorScheme.colors;
in
''
* {
    background: #${colors.base00};
    foreground: #${colors.base05};
    background-color: @background;
    border-color: #${colors.base01};
    border: @border-color;
    border-alt: @border-color;
    selected-foreground: #${colors.base07};
    urgent: #${colors.base08};

    active-background: #${colors.base01};
    active-foreground: @foreground;
    normal-background: #${colors.base01};
    normal-foreground: @foreground;
    urgent-background: #${colors.base07};
    urgent-foreground: @foreground;

    alternate-active-background: @active-background;
    alternate-active-foreground: @foreground;
    alternate-normal-background: @normal-background;
    alternate-normal-foreground: @foreground;
    alternate-urgent-background: @urgent-background;
    alternate-urgent-foreground: @foreground;

    selected-active-background: #${colors.base02};
    selected-active-foreground: @foreground;
    selected-normal-background: #${colors.base02};
    selected-normal-foreground: @foreground;
    selected-urgent-background: #${colors.base07};
    selected-urgent-foreground: @foreground; 
}
''