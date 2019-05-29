# xinput set-prop 11 283 1

xset -b
xset r rate 200 50

xinput --set-prop 11 "libinput Accel Speed" 0.4
xinput --set-prop 11 "libinput Natural Scrolling Enabled" 0
xset dpms 0 0 0 && xset s noblank && xset s off

xrdb ~/.Xresources

# dbus-update-activation-environment --systemd DISPLAY

exec i3
