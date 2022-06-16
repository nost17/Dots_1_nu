#!/bin/bash
OP1='Firefox'
OP2='Mpd'
OPTIONS="$OP1\n$OP2"
SELECTED="$(echo -e "$OPTIONS" | rofi -dmenu -theme ~/.config/rofi/themes/power_menu.rasi \
    -theme-str ' * {main: @magenta;} textbox-prompt-colon {str: "";}' -p 'Seleccionar reproductor')"
case "$SELECTED" in
    $OP1) rm /tmp/player.txt ; echo 'firefox' >> /tmp/player.txt & ;;
    $OP2) rm /tmp/player.txt ; echo 'mpd' >> /tmp/player.txt && mpd && mpd-mpris -host 127.0.0.1 & ;;
esac
