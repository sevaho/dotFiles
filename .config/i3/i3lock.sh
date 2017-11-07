#!/bin/bash
# if [[ $WAYLAND_DISPLAY == "" ]]; then
#
	scrot /tmp/screen.png
#
# else  

	swaygrab /tmp/screen.png

# fi

convert /tmp/screen.png -paint 1 /tmp/screen.png
[[ -f ~/.config/i3/lock.png ]] && convert /tmp/screen.png ~/.config/i3/lock.png -gravity Center -composite -matte /tmp/screen.png


# if [[ $WAYLAND_DISPLAY == "" ]]; then
#
# 	i3lock -u -e -i /tmp/screen.png
#
# else  

	swaylock -u -i /tmp/screen.png

# fi
