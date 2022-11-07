#!/bin/bash

feh -r --bg-fill -z --no-fehbg ~/Pictures/Wallpaper/* &
picom &

export SEP1="["
export SEP2="]"

dwm_date() {
    printf "%s" "$SEP1"
    printf "📆 %s" "$(date "+%a %d-%m-%y %T")"
    printf "%s\n" "$SEP2"
}

dwm_battery() {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
    printf "%s" "$SEP1"
    printf "🔋 %s%% %s" "$CHARGE" "$STATUS"
    printf "%s\n" "$SEP2"
}

while true; do
    upperbar=""
    upperbar="$upperbar$(dwm_date)"
    upperbar="$upperbar$(dwm_battery)"

    xsetroot -name "$upperbar"
    sleep 1
done &

