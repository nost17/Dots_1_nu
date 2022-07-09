#!/bin/sh

function confirmationFunction(){
	local COMMAND=$1
	local YES="Si, $SELECTION" ; local NO='No, Cancelar'
	local SELECTION="$(echo -e "$NO\n$YES" | rofi -dmenu -p "$TITLE" -theme '~/.config/rofi/assets/power.rasi' -theme-str 'window{height:200px;}')"
	if [[ $SELECTION == $YES ]]; then sleep 0.2 ; $COMMAND &
	elif [[ $SELECTION == $NO ]]; then exit &
	else exit & fi
}
TITLE='Menu de apagado'
SHUTDOWN="Apagar"
REBOOT="Reiniciar"
SUSPEND="Suspender"
LOGOUT="Cerrar sesion"
LOCKSCREEN="Pantalla de bloqueo"
OPTIONS="$SHUTDOWN\n$REBOOT\n$SUSPEND\n$LOGOUT\n$LOCKSCREEN"
SELECTION=$(echo -e $OPTIONS | rofi -p "$TITLE" -dmenu -theme '~/.config/rofi/assets/power.rasi')
case $SELECTION in
	$SHUTDOWN)		sleep 0.2; systemctl poweroff ;;
	$REBOOT)			sleep 0.2; systemctl reboot ;;
	$LOGOUT)			sleep 0.2; bspc quit ;;  #qtile cmd-obj -o cmd -f shutdown ;;
	$SUSPEND)			sleep 0.2; systemctl suspend ;;
	$LOCKSCREEN)	sleep 0.2; ~/.config/bspwm/scripts/mylock.sh ; sleep 0.2 ; systemctl suspend ;;
esac
