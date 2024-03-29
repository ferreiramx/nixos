vars: ''
import os
from libqtile.lazy import lazy
from libqtile.config import Key, Click, Drag
from libqtile.utils import guess_terminal

home = os.path.expanduser("~")
mod = "mod4"
terminal = guess_terminal()
keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key(
        [mod],
        "escape",
        lazy.spawn(f"{home}/.config/rofi/powermenu/powermenu.sh"),
        desc="Show menu",
    ),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    # Floating windows
    Key(
        [mod],
        "f",
        lazy.window.toggle_floating(),
        desc="Toggle floating",
    ),
    # Launcher
    Key(
        [mod],
        "d",
        lazy.spawn(f"{home}/.config/rofi/launcher/launcher.sh"),
        desc="App Launcher",
    ),
    # Volume Keys
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn(f"{home}/.config/qtile/scripts/pamixer.sh down"),
        desc="Lower Volume",
    ),
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn(f"{home}/.config/qtile/scripts/pamixer.sh up"),
        desc="Raise Volume",
    ),
    Key(
        [],
        "XF86AudioMute",
        lazy.spawn(f"{home}/.config/qtile/scripts/pamixer.sh mute"),
        desc="Toggle Mute",
    ),
    Key(
        [],
        "XF86AudioMicMute",
        lazy.spawn(f"{home}/.config/qtile/scripts/pamixer.sh micmute"),
        desc="Toggle Mute",
    ),
    # Screenshot
    Key(
        [mod, "shift"],
        "s", 
        lazy.spawn(
            "sleep 1; scrot -s 'screenshot_%Y-%m-%d-%S_$wx$h.png' -e 'mv $f ~/pictures ; viewnior ~/pictures/$f'",
            shell=True,
        ), 
        desc="Take Screenshot"
    ),
''
+
(
    # Add ROG keybind if this is an Asus laptop
    if (vars.hostName == "kiryu")
    then ''
    # ROG Key for GPU mode switching
    Key(
        [ ],
        "XF86Launch1", 
        lazy.spawn("switch-gfx-mode"), 
        desc="Switch GPU Mode",
    ),
    ''
    else ""
)
+
(
    # Add touchpad toggle keybind if this is a laptop
    if (vars.class == "laptop")
    then ''
    # Toggle touchpad
    Key(
        [ ],
        "XF86TouchpadToggle", 
        lazy.spawn("touchpad-toggle"), 
        desc="Toggle Touchpad",
    ),
    ''
    else ""
)
+
''
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
''