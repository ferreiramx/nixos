# TODO: Get rid of this file and inject vars directly in the other files
vars: ''
theme = {
    "screen": {
        "width": ${toString vars.screen.width},
        "height": ${toString vars.screen.height},
        "wallpaper": {
            "file": "/home/aferreira/.config/wallpapers/wp_${toString vars.screen.width}x${toString vars.screen.height}.png",
            "mode": "stretch",
        },
    },
    "colors": {
        "bg1": "#151515",
        "bg2": "#1c1c1c",
        "bg3": "#202020",
        "bg4": "#3c3c3c",
        "fg1": "#c0c0bc",
        "fg2": "#d0d0cc",
        "fg3": "#e0e0dc",
        "accent1": "#404049",
        "accent2": "#4c5758",
        "accent3": "#444d6e",
        "accent4": "#3d646d",
        "highlight1": "#6d3636",
        "highlight2": "#773e26",
        "highlight3": "#9f792c",
        "highlight4": "#458260",
        "highlight5": "#5a446e",
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