export GTK_THEME=Adwaita:dark
nitrogen --restore
xbindkeys
bar &
nvidia-settings -l
keyledsd -c ~/.config/keyledsd.yaml &

# apps
#teamspeak &
#firefox &
#chromium &

picom --experimental-backends &
exec dwm
