#!/bin/bash
# Temp script to output pamixer volume in [ddd%] format while the qtile volume widget is fixed

case $1 in
    get)
        echo "[$(pamixer --get-volume-human)]"
    ;;
    up)
        pamixer --increase 2
    ;;
    down)
        pamixer --decrease 2
    ;;
    mute)
        pamixer --toggle-mute
    ;;
esac