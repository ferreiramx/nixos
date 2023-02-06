{}: ''
import os
import subprocess
from libqtile import hook

home = os.path.expanduser("~")

# @hook.subscribe.focus_change
# def test():
#     if len(bar.screen.items("window")[1]) == 0:
#         subprocess.run(f"{home}/.config/rofi/launcher/launcher.sh")


@hook.subscribe.startup_once
def autostart():
    subprocess.run(f"{home}/.config/qtile/scripts/autostart.sh")
''