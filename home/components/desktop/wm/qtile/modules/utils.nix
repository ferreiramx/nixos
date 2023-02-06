{lib}: ''
import subprocess


def get_volume():
    p = subprocess.run(
        ["pamixer", "--get-volume"], stdout=subprocess.PIPE, universal_newlines=True
    )
    return int(p.stdout.replace("\n", ""))


def get_mute():
    p = subprocess.run(
        ["pamixer", "--get-mute"], stdout=subprocess.PIPE, universal_newlines=True
    )
    return p.stdout.replace("\n", "")
''