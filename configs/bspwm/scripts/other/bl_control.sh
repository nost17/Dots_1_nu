#!/usr/bin/zsh

function show_icon(){
    if [[ $STATUS == *"Powered: yes"*  ]] ; then
        echo "$ICON_ON"
    else
        echo "$ICON_OFF"
    fi
}
function toggle_bl() {
    if [[ $STATUS == *"Powered: yes"* ]] ; then
        bluetoothctl power off
        echo "$ICON_OFF"
    else
        bluetoothctl power on
        echo "$ICON_ON"
    fi
}
OPTION=$1
ICON_ON='%{T2}'
ICON_OFF='%{T2}'
STATUS="$( bluetoothctl show | grep 'Powered: yes' )"
if [[ $1 == "show" ]] ; then
    show_icon
elif [[ $1 == "toggle" ]] ; then 
    toggle_bl
fi
