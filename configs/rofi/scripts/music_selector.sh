#!/bin/bash
if		[[ $(mpc) ]] ;	then MPD_ACTIVE=true
else	MPD_ACTIVE=false		;	fi
setMpdFunction () {
	if [[ $MPD_ACTIVE ]]; then
		rm /tmp/player.txt
		echo 'mpd' >> /tmp/player.txt
		mpd-mpris -host 127.0.0.1 &
	else
		mpd &
		sleep 0.1 ; mpd-mpris -host 127.0.0.1 &
	fi
}
playerSelectorFunction () {
	local BROWSER='firefox' ; local MPD='mpd'
	local SELECTION="$( echo -e "$BROWSER\n$MPD" | rofi -dmenu -theme '~/.config/rofi/assets/power.rasi' -theme-str \
	'*{main: @yellow;} element-text{horizontal-align: 0.5;} inputbar{children: [textbox2,prompt,textbox2];} window{width: 30%; height: 200px; y-offset: 37px; location: north; border: 0 ; border-radius: 0 0 10px 10px;}' -p 'Seleccionar reproductor')"
	case $SELECTION in
		$BROWSER) rm /tmp/player.txt ; echo 'firefox' >> /tmp/player.txt ;;
		$MPD) setMpdFunction ;;
	esac
}
playerSelectorFunction
