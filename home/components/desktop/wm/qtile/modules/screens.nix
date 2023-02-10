''
from libqtile.config import Screen
from modules.bar import bar
from modules.theme import theme

screens = [
    Screen(
        top=bar,
        wallpaper=theme["screen"]["wallpaper"]["file"],
        wallpaper_mode=theme["screen"]["wallpaper"]["mode"],
    )
]
''