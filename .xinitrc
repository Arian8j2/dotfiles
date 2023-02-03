#!/bin/bash

export PATH="$PATH:/home/arian/.local/bin"
export QT_QPA_PLATFORMTHEME=gtk2

xrandr --output DisplayPort-0 --primary --mode 1920x1080 --rate 240 \
       --output HDMI-A-0 --pos 1960x0 --mode 1920x1080 --rate 60
setxkbmap -layout us,ir -option 'grp:alt_caps_toggle'

liquidctl --match Gigabyte set sync color fixed 00cc88
ratbagctl 0 profile active set 0

./.fehbg
picom &
bar &
dunst &
xbindkeys
exec dwm
