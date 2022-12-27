export PATH="$PATH:/home/arian/.local/bin"
export QT_QPA_PLATFORMTHEME=gtk2

export CLUTTER_DEFAULT_FPS=240
export __GL_SYNC_DISPLAY_DEVICE=DP-0
nvidia-settings -l

setxkbmap -layout us,ir -option 'grp:alt_caps_toggle'

liquidctl --unsafe=smbus --match 1050 set led color fixed 00cc88
liquidctl --match Gigabyte set sync color fixed 00cc88
ratbagctl 0 profile active set 0

./.fehbg
picom &
bar &
dunst &
xbindkeys
exec dwm
