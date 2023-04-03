# TODO: Get rid of this file and inject vars directly in the other files
{ config, vars, ... }:
let
  colors = config.colorScheme.colors;
in
''
theme = {
    "screen": {
        "width": ${toString vars.screen.width},
        "height": ${toString vars.screen.height},
        "wallpaper": {
            "file": "/home/aferreira/.wp.png",
            "mode": "stretch",
        },
    },
    "colors": {
        "bg1": "#${colors.base00}",
        "bg2": "#${colors.base01}",
        "bg3": "#${colors.base02}",
        "bg4": "#${colors.base03}",
        "fg1": "#${colors.base07}",
        "fg2": "#${colors.base06}",
        "fg3": "#${colors.base05}",
        "accent1": "#${colors.base0C}",
        "accent2": "#${colors.base0D}",
        "accent3": "#${colors.base0E}",
        "accent4": "#${colors.base0F}",
        "highlight1": "#${colors.base08}",
        "highlight2": "#${colors.base0B}",
        "highlight3": "#${colors.base0A}",
        "highlight4": "#${colors.base08}",
        "highlight5": "#${colors.base0B}",
    },
    "windows": {
        "borders": {"width": 3, "radius": 12},
        "padding": {"x": 0, "y": 0},
        "margin": {"x": 5, "y": 5},
    },
    "widgets": {
        "borders": {"width": 0, "radBieius": 12},
        "padding": {"x": 5, "y": 0},
        "margin": {"x": 10, "y": 10},
    },
    "fonts": {
        "sans": {
            "font": "Source Sans Pro",
            "style": "Semibold",
            "size": ${toString vars.fonts.sans},
        },
        "mono": {
            "font": "SauceCodePro Nerd Font Mono",
            "style": "Bold",
            "size": ${toString vars.fonts.mono},
        },
        "icons": {
            "font": "Material Design Icons",
            "style": "",
            "size": ${toString vars.fonts.large-icon},
        },
        "icons2": {
            "font": "Font Awesome 6 Free",
            "style": "Solid",
            "size": ${toString vars.fonts.small-icon},
        },
        "icons3": {
            "font": "Font Awesome 6 Brands",
            "style": "Solid",
            "size": ${toString vars.fonts.small-icon},
        },
        "osicon": {
            "font": "SauceCodePro Nerd Font",
            "style": "",
            "size": ${toString vars.fonts.os-icon},
        },
    },
    "sensors": {
        "cpu": {
            "tag": "Tctl",
            "threshold": 70,
        },
        "gpu": {
            "tag": "edge",
            "threshold": 70,
        },
    },
    "transparency": {"alpha": 1, "blur": 10},
}
''