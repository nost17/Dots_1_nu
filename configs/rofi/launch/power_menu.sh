#!/bin/bash

exit_confirmation(){
	YES="Si, $SELECTION"
	DEN='No, Cancelar'
	R="$(echo  -e "$DEN\n$YES" | rofi -dmenu -selected-row 0 -i -theme "~/.config/rofi/themes/power_menu.rasi" -p 'Menu de apagado')"
}
operation(){
	if	[[ $R == $YES ]] ; then
		$VALUE &
	elif [[ $R == $DEN ]] ; then
		exit &
	else
		exit &
	fi
}
# ICONS	/ TEXT 
SHUTDOWN="Apagar"
LOGOUT="Cerrar sesion"
REBOOT="Reiniciar"
SUSPEND="Suspender"
LOCKSCREEN="Pantalla de bloqueo"
OPTIONS="$SUSPEND\n$LOGOUT\n$LOCKSCREEN\n$SHUTDOWN\n$REBOOT"
SELECTION="$(echo -e $OPTIONS | rofi -dmenu -selected-row 0 -i -theme "~/.config/rofi/themes/power_menu.rasi" -p 'Menu de apagado')"
case $SELECTION	in 
	$SHUTDOWN)
		exit_confirmation
		VALUE="systemctl poweroff" ; operation ;;
	$REBOOT)
		exit_confirmation
		VALUE="systemctl reboot" ; operation ;;
	$LOGOUT)
		exit_confirmation
		VALUE="bspc quit"	; operation	;;
	$SUSPEND)
		systemctl suspend ;;
	$LOCKSCREEN)
		exit_confirmation
		VALUE="rofi -modi drun -show drun &" ; operation ;;
esac
