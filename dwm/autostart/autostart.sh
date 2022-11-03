#!/bin/bash

feh --bg-fill --randomize ~/Pictures/Wallpaper/* &
picom &

export IDENTIFIER="unicode"
export SEP1="["
export SEP2="]"

dwm_date() {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "📆 %s" "$(date "+%a %d-%m-%y %T")"
    else
        printf "DAT %s" "$(date "+%a %d-%m-%y %T")"
    fi
    printf "%s\n" "$SEP2"
}

while true; do
    upperbar=""
    upperbar="$upperbar$(dwm_date)"

    xsetroot -name "$upperbar"
    sleep 1
done &

