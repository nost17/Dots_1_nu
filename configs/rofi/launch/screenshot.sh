#!/bin/sh
OP1='Pantalla completa'
OP2='Seleccionar área'
OP3='Solo la ventana activa'
OPTIONS="$OP1\n$OP2\n$OP3"
SELECTED="$(echo -e $OPTIONS | rofi -dmenu -theme ~/.config/rofi/themes/power_menu.rasi \
    -theme-str ' * {main: @yellow;} textbox-prompt-colon {str: "";}' -p 'Captura de pantalla')"
case "$SELECTED" in
    $OP1) sleep 1 ; scrot -q 100 'Screenshot_%Y-%m-%d.png' -e 'mv $f $$(xdg-user-dir PICTURES)/Capturas ; viewnior $$(xdg-user-dir PICTURES)/Capturas/$f' & ;;
    $OP2) scrot -q 100 -s 'Screenshot_%Y-%m-%d.png' -e 'mv $f $$(xdg-user-dir PICTURES)/Capturas ; viewnior $$(xdg-user-dir PICTURES)/Capturas/$f' & ;;
    $OP3) scrot -q 100 -u 'Screenshot_%Y-%m-%d.png' -e 'mv $f $$(xdg-user-dir PICTURES)/Capturas ; viewnior $$(xdg-user-dir PICTURES)/Capturas/$f' & ;;
esac