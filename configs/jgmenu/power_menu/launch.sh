#!/bin/sh

function confirmation(){
	local YES="Si. $1" ; local NO='No. Cancelar' ; local ACTION=$2
	R=$(printf "$NO,echo NO\n$YES, echo YES\n" | jgmenu --simple --config-file="~/.config/jgmenu/power_menu/power_menurc")
	case "$R" in
		'YES') $ACTION & ;;
		'NO') exit ;;
	esac
}

OPTION=$1
case "$OPTION" in
        'SUSPEND') systemctl suspend ;;
        'LOCK') rofi -show drun ;;
        'REBOOT') confirmation 'Reiniciar' 'systemctl reboot' ;;
        'POWEROFF') confirmation 'Reiniciar' 'systemctl poweroff' ;;
        'LOGOUT') confirmation 'Cerrar sesion' 'bspc quit';;
esac
