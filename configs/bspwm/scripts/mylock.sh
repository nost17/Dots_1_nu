#!/bin/bash

#BLACK='#1e2127'
WALL="$HOME/.config/bspwm/wallpaper.png"
BLACK='#00000000'
YELLOW='#e5c07b'
RED='#f46e88'
GREEN='#98c379'
BLUE='#61afef'
FG='#abb2bf'
FONT="Comfortaa"
i3lock -i $WALL -F --radius 80 --ring-width 6 \
    --line-uses-ring $BLUE \
    --modif-color $GREEN \
    --ring-color $BLACK \
    --inside-color $BLACK \
    --line-color $BLACK \
    --separator-color $RED \
    --insidewrong-color $RED \
    --ringwrong-color $RED \
    --insidever-color $BLUE \
    --ringver-color $BLUE \
    --keyhl-color $YELLOW \
    --bshl-color $YELLOW \
    --verif-color $BLUE \
    --wrong-color $RED \
    --date-str "" \
    --time-str "%H:%M:%S" \
    --time-align 0 \
    --time-color $FG \
    --time-size 120 \
    --time-pos "683:300" \
    --ind-pos "683:650" \
    --time-font $FONT \
    --pass-volume-keys \
    --pass-media-keys \
    --pass-screen-keys \
    --no-modkey-text \
    --noinput-text "" \
    --indicator \
    -k
