#!/bin/bash

scrot /tmp/screen.png

convert /tmp/screen.png -paint 1 /tmp/screen.png
[[ -f ~/.config/i3/lock.png ]] && convert /tmp/screen.png ~/.config/i3/lock.png -gravity Center -composite -matte /tmp/screen.png

i3lock -efi /tmp/screen.png
