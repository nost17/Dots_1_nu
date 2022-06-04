#!/usr/bin/bash

BRIGHTNESS_CAP="$(brightnessctl i | awk 'NR>1{print $1} BEGIN{FS=")"}' | awk '{print $2} BEGIN{FS="("}' | awk '{print $1} BEGIN{FS="%"}')"
if [[ "$BRIGHTNESS_CAP" -lt 20 ]]; then
    ICON="/home/fiz/.config/bspwm/scripts/dunst/bright-low.svg"
elif [[ "$BRIGHTNESS_CAP" -lt 40 ]]; then
    ICON="/home/fiz/.config/bspwm/scripts/dunst/bright-medium.svg"
else
    ICON="/home/fiz/.config/bspwm/scripts/dunst/bright-high.svg"
fi
dunstify -i "$ICON" -a "Brillo" -r 3456 -h int:value:"$BRIGHTNESS_CAP" "Brillo: ${BRIGHTNESS_CAP}"