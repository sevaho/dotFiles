xinput set-prop 11 283 1 
xinput --set-prop 11 "libinput Natural Scrolling Enabled" 0
xset dpms 0 0 0 && xset s noblank && xset s off

xrdb ~/.Xresources

# dbus-update-activation-environment --systemd DISPLAY

exec i3
