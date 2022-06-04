#!/bin/sh

function get_active(){
    if [[ "$(mpc)" == *"repeat: on"* ]] ; then
        ACTIVE='-a 0'
    else
        ACTIVE=''
    fi
    if [[ "$(mpc)" == *"random: on"* ]] ; then
        ACTIVE+=',4'
    fi
}
get_active
PREV='Anterior'
NEXT='Siguiente'
REPEAT='Repetir'
RANDM='Aleatorio'
TITLE_MUSIC="$(mpc -f %title% current)"
if [[ "$(mpc)" == *"[paused]"* ]] ; then
    PLAY_PAUSE='Reproducir'
elif [[ "$(mpc)" == *"[playing]"* ]] ; then
    PLAY_PAUSE='Pausar'
else
    PLAY_PAUSE='Reproducir'
fi
OPTIONS="$REPEAT\n$PREV\n$PLAY_PAUSE\n$NEXT\n$RANDM"
SELECTED=$( echo -e $OPTIONS | rofi -dmenu $ACTIVE -i -selected-row 2 -theme '~/.config/rofi/themes/music.rasi' -p "$TITLE_MUSIC")
case "$SELECTED" in
    $PLAY_PAUSE) mpc toggle ;;
    $PREV) mpc prev && ~/.config/rofi/launch/music.sh & ;;
    $NEXT) mpc next && ~/.config/rofi/launch/music.sh & ;;
    $REPEAT) mpc repeat ;;
    $RANDM) mpc random ;;
esac
