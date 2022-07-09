#!/bin/bash
musicControlFunction () {
	local PLAY_PAUSE='' ; local REPEAT='Repetir'
	local	NEXT='Siguiente' ; local PREV='Anterior'
	local NOT_ACTIVE='' ; local ACTIVE=''
	local RANDOM='Aleatorio' ; local TITLE=$(mpc -f "%title%" current)
	if [[ "$(mpc)" == *"repeat: on"* && "$(mpc)" == *"random: on"* ]]; then ACTIVE='-a 3,4'
	elif [[ "$(mpc)" == *"repeat: off"* && "$(mpc)" == *"random: off"* ]]; then NOT_ACTIVE='-u 3,4'
	elif [[ "$(mpc)" == *"repeat: on"* && "$(mpc)" == *"random: off"* ]]; then ACTIVE='-a 3' ; NOT_ACTIVE='-u 4'
	elif [[ "$(mpc)" == *"repeat: off"* && "$(mpc)" == *"random: on"* ]]; then ACTIVE='-a 4'; NOT_ACTIVE='-u 3'
	fi
	if		[[ "$(mpc)" == *"[paused]"* ]]	; then PLAY_PAUSE='Reproducir'
	elif	[[ "$(mpc)" == *"[playing]"* ]]	; then PLAY_PAUSE='Pausar'
	else	PLAY_PAUSE='Reproducir' ; fi
	local OPTIONS="$NEXT\n$PLAY_PAUSE\n$PREV\n$REPEAT\n$RANDOM"
	local SELECTION=$(echo -e "$OPTIONS" | rofi -dmenu $ACTIVE $NOT_ACTIVE -p "$TITLE" -theme '~/.config/rofi/assets/power.rasi' -theme-str '*{main: @magenta;} window{width: 45%; height: 350px; y-offset: 37px; location: north; border: 0 ; border-radius: 0 0 10px 10px;} inputbar{children: [textbox2,prompt,textbox2];} element-text{horizontal-align: 0.5;}' -selected-row 1)
	case $SELECTION in
		$PLAY_PAUSE) mpc toggle ;;
		$NEXT) mpc next ;;
		$PREV) mpc prev ;;
		$REPEAT) mpc repeat ;;
		$RANDOM) mpc random ;;
	esac
}
firefoxControlFunction(){
	local PLAY_PAUSE=''			;	local TITLE=$(playerctl --player=$(cat /tmp/player.txt) metadata title)
	local NEXT='Siguiente'	;	local PREV='Anterior'
	if		[[ "$(playerctl --player=$(cat /tmp/player.txt) status)" == 'Playing' ]]; then PLAY_PAUSE='Pausar'
	else	PLAY_PAUSE='Reproducir' ; fi
	local OPTIONS="$NEXT\n$PLAY_PAUSE\n$PREV"
	local SELECTION=$(echo -e "$OPTIONS" | rofi -dmenu -p "$TITLE" -theme '~/.config/rofi/assets/power.rasi' -theme-str \
		'*{main: @magenta;} textbox{content: "  ";} window{height: 240px; width: 45%;}' -selected-row 1)
	case $SELECTION in
		$PLAY_PAUSE) playerctl --player=firefox play-pause ;;
		$NEXT) playerctl --player=firefox next ;;
		$PREV) playerctl --player=firefox previous ;;
	esac
}
if		[[ "$(cat /tmp/player.txt)" == 'firefox' ]]	;	then firefoxControlFunction
elif	[[ "$(cat /tmp/player.txt)" == 'mpd' ]]			;	then musicControlFunction
else	musicControlFunction ; fi
