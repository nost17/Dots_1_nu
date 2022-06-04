#!/usr/bin/bash
bg='#1e2127'
fg='#abb2bf'
color='#e5c07b'
r="$( echo -e "Suspender\nApagar\nReiniciar\nBloquear pantalla\nSalir" | dmenu -i -l 6 -p 'Menu' -fn "Comfortaa-13" -nb $bg -sf $bg -sb $color  -nf $fg )"
case "$r" in
	"Suspender") systemctl suspend ;;
    "Apagar") systemctl poweroff ;;
    "Reiniciar") systemctl reboot ;;
    "Bloquear pantalla") echo nBloquear ;;
    "Salir") bspc quit ;;
esac
