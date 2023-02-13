#!/bin/sh

rofi_command="rofi -theme ~/.config/rofi/powermenu/theme.rasi"

uptime=$(uptime | sed -e 's/up.*//g')

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""
dir="$HOME/.config/rofi/power"

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        ~/.config/i3/lock.sh
        ;;
    $suspend)
        playerctl -p spotify pause
        pamixer -m
        systemctl suspend
        ;;
    $logout)
        qtile cmd-obj -o cmd -f shutdown
        ;;
esac
