#!/usr/bin/bash
VOLUME_MUTE="$( pamixer --get-volume-human )"
VOLUME_CAP="$( pamixer --get-volume )"
if [[ "$VOLUME_MUTE" -eq "muted" ]]; then
    ICON="/home/fiz/.config/bspwm/scripts/dunst/volume-mute.svg"
    dunstify -a "Volumen" -r 3456 "Volumen: Silencio" -i "$ICON"
elif [[ "$VOLUME_CAP" -lt 20 ]]; then
    ICON="/home/fiz/.config/bspwm/scripts/dunst/volume-low.svg"
    VOLUME=true
elif [[ "$VOLUME_CAP" -lt 40 ]]; then
    ICON="/home/fiz/.config/bspwm/scripts/dunst/volume-medium.svg"
    VOLUME=true
else
    ICON="/home/fiz/.config/bspwm/scripts/dunst/volume-high.svg"
    VOLUME=true
fi
if [ $VOLUME ]; then
    dunstify -i "$ICON" -a "volume" -r 3456 -h int:value:"$VOLUME_CAP" "Volume: ${VOLUME_CAP}"
fi