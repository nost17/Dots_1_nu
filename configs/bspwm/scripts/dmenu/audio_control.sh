#!/usr/bin/bash
bg='#1e2127'
fg='#abb2bf'
color='#e5c07b'
PLAY_PAUSE="playerctl play-pause" ; PP=''
NEXT="playerctl next" ; N='Siguiente'
PREV="playerctl previous" ; P='Anterior'
if [ "$(playerctl status)" == "Playing" ] ; then
	PP='Pausar'
elif [ "$(playerctl status)" == "Paused" ]; then
	PP='Reproducir'
fi
OPTIONS="$PP\n$N\n$P"
R="$( echo -e $OPTIONS | dmenu -i -l 6 -p "Audio" -fn "Cantarell-13" -nb $bg -sf $bg -sb $color  -nf $fg )"
if [ $R == $PP ] ; then
	$PLAY_PAUSE
elif [ $R == $N ] ; then
	$NEXT
elif [ $R == $P ] ; then
	$PREV
fi
