xinput set-prop 11 283 1 
xset dpms 0 0 0 && xset s noblank && xset s off

xrdb ~/.Xresources

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

exec i3
