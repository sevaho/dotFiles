#!/usr/bin/env sh

# terminate already running bar instances
killall -q polybar

# wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

HOST=$(cat /etc/hostname)

if [[ $HOST == "sevahoDesktop" ]]; then

    polybar left &
    polybar mid &
    polybar right &

elif xrandr | grep HDMI; then 

    polybar mybar &
    polybar mybar-right &
    polybar mybar-left &

else

    polybar mybar &

fi

echo "Bars launched"
