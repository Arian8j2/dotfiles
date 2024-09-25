#!/bin/bash

export PATH="$PATH:/home/arian/.local/bin"
export QT_QPA_PLATFORMTHEME=qt5ct

# disable amdvlk by default and use mesa vulkan driver
# export DISABLE_LAYER_AMD_SWITCHABLE_GRAPHICS_1=1
# ICD_DIR="/usr/share/vulkan/icd.d"
# export VK_ICD_FILENAMES="${ICD_DIR}/radeon_icd.i686.json:${ICD_DIR}/radeon_icd.x86_64.json"

(sleep 10 && systemctl --user start gpu-screen-recorder.service) &

# monitor
xrandr --output DisplayPort-0 --primary --mode 1920x1080 --rate 240 \
       --output HDMI-A-0 --pos 1960x0 --mode 1920x1080 --rate 60

# keyboard layout
# setxkbmap -layout us,ir -option 'grp:alt_caps_toggle'

# rgb
(openrgb -p rgbram && ratbagctl 0 profile active set 0) &

systemctl --user start redshift

./.fehbg
picom &
nice -n 15 bar &
dunst &
xbindkeys
nice -n 15 controller-bluetooth-notifier &
nice -n 15 udiskie & # auto mount removable devices
exec dwm
