#!/bin/bash

BATTERY_CAP="$( acpi | awk 'BEGIN{FS=":"} {print $2}' | awk 'BEGIN{FS=","} {print $2}')"
VOLUME_CAP="$( pamixer --get-volume-human )"
BRIGHTNESS_CAP="$(brightnessctl i | awk 'NR>1{print $1} BEGIN{FS=")"}' | awk '{print $2} BEGIN{FS="("}')"
BRIGHTNESS="Brillo:  $BRIGHTNESS_CAP"
BATTERY="Bateria:  $BATTERY_CAP"
VOLUME="Volumen:  $VOLUME_CAP"
OPTIONS="$BRIGHTNESS\n$VOLUME\n$BATTERY"
SELECTION="$(echo -e $OPTIONS | rofi -dmenu -p 'Panel de información' -theme-str 'inputbar { children: [prompt]; }' > /dev/null )"
$SELECTION
