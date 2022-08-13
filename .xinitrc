export GTK_THEME=Adwaita:dark
nitrogen --restore
xbindkeys
bar &
nvidia-settings -l
dunst &

# apps
#teamspeak &
#firefox &
#chromium &

picom --experimental-backends &
exec dwm
