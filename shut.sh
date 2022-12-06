#!/usr/bin/bash

VER="0.11"

if ! command -v dialog;
	then
		sudo pacman -S dialog
	else
		echo "dependencies satisfied"
fi

BLACK="\Zb\Zu\Z7"

WIDTH=20
HEIGHT=40 
MENU_HEIGHT=8
TITLE="SHUT"
BG_TITLE="made by noTme"

OPTIONS=( 
	1 "Shutdown"
	2 "Reboot"
)

CHOICE=$(dialog --colors --title "$BLACK$TITLE" --backtitle "$BG_TITLE v$VER" --menu "tired already?" "$WIDTH" "$HEIGHT" "$MENU_HEIGHT" "${OPTIONS[@]}" 2>&1 > /dev/tty)

clear

# echo "$CHOICE"

# BEWARE OF : [ $rand ]
#              ^     ^ must be spaces !!!
# if [ $CHOICE -eq 1 ];
# then
# 	echo "shutdown"
# elif [ $CHOICE -eq 2 ];
# 	then
# 		echo "reboot"	
# fi

# case better
case $CHOICE in 
	1) 
		shutdown -h now;;
	2)
		reboot;;
esac
