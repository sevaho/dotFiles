#!/bin/bash

# scrot /tmp/screen.png
#
# convert /tmp/screen.png -paint 1 /tmp/screen.png
# [[ -f ~/.config/i3/lock.png ]] && convert /tmp/screen.png ~/.config/i3/lock.png -gravity Center -composite -matte /tmp/screen.png
#
# i3lock -efi /tmp/screen.png

# notify-send "DUNST_COMMAND_PAUSE"

scrot -o /tmp/screen.png

convert /tmp/screen.png -paint 1 /tmp/screen.png
# [[ -f ~/.config/i3/circlelock.png ]] && convert /tmp/screen.png ~/.config/i3/circlelock.png -gravity Center -composite -matte /tmp/screen.png
# convert /tmp/screen.png ~/.config/i3/circlelock.png -gravity center -composite /tmp/screen.png

# i3lock -efi /tmp/screen.png

# forget gpg passwords
# gpgconf --reload gpg-agent

# i3lock --insidecolor=ffffff1c --ringcolor=ffffff3e --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 --insidevercolor=0000001c --ringwrongcolor=00000055 --insidewrongcolor=0000001c --radius=35 --veriftext="" -nfi /tmp/screen.png
i3lock -efi /tmp/screen.png

# notify-send "DUNST_COMMAND_RESUME"
