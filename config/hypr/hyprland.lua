-- monitors
hl.monitor({ output = "DP-1", mode = "1920x1080@240", position = "0x0", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "1920x0", scale = 1 })

-- startup
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper & dunst & openrgb -p rgbram & wlsunset -l 35.7 -L 51.4 -t 3600 -T 6500")
    hl.exec_cmd(
        "sleep 2 && waybar & ratbagctl 0 profile active set 0 & systemctl --user start gpu-screen-recorder.service hyprpolkitagent.service")
end)

-- env
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "22")
hl.env("PATH", os.getenv("PATH") .. ":/home/arian/.local/bin")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

-- global config
hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 1,
        col = {
            active_border = 0xff5c6370,
            inactive_border = 0xff5c6370,
        },
        layout = "master"
    },
    decoration = {
        rounding = 7,
        shadow = {
            range = 10,
            render_power = 3,
            color = 0xee1a1a1a
        },
        blur = {
            size = 10,
        },
    },
    master = {
        new_on_top = true
    },
    misc = {
        enable_anr_dialog = false
    },
    input = {
        kb_layout = "us,ir",
        kb_options = "grp:alt_shift_toggle",
        sensitivity = 0.0,
        accel_profile = "flat",
    }
})

-- animation
hl.curve("mybez", { type = "bezier", points = { { 0.05, 0.9}, {0.1, 1.05 } } })
hl.animation({ leaf = "windows", enabled = true, speed = 7.0, bezier = "mybez" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7.0, bezier = "mybez", style = "popin 80%" })
hl.animation({ leaf = "fade", enabled = true, speed = 7.0, bezier = "mybez" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6.0, bezier = "mybez" })

-- binds
hl.bind("SUPER + Return", hl.dsp.exec_cmd("alacritty"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + CONTROL + Q", hl.dsp.exit())
hl.bind("SUPER + S", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + M", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind("SUPER + Comma", hl.dsp.window.swap({ next = true }))
hl.bind("SUPER + P", hl.dsp.exec_cmd("rofi -show run"))
hl.bind("SUPER + O", hl.dsp.exec_cmd("sudo -E ns wvpn rofi -show run -modes 'run,wvpn:echo'"))
hl.bind("SUPER + I", hl.dsp.exec_cmd("sudo -E ns tci rofi -show run -modes 'run,tci:echo'"))

hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + J", hl.dsp.window.cycle_next())

-- workspace switch
-- package.path = package.path .. ";./?.lua;./?/init.lua"
local smw = require("plugins.split-monitor-workspaces")
smw.setup({ workspace_count = 10, enable_persistent_workspaces = false })

for i = 1, smw.get_amount_of_workspaces() do
    local w = tostring(i % 10)
    hl.bind("SUPER + " .. w, smw.workspace(w))
    hl.bind("SUPER + SHIFT + " .. w, smw.move_to_workspace_silent(w))
end

-- hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
-- hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("playerctl play-pause -p spotify,termusic,cmus"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pyvolcontrol -10"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pyvolcontrol +10"))
hl.bind("ALT + Bracketright", hl.dsp.exec_cmd("playerctl next"))
hl.bind("ALT + Bracketleft", hl.dsp.exec_cmd("playerctl previous"))

hl.bind("Prior", hl.dsp.pass({ window = "class:^(TeamSpeak 3)$" }))
hl.bind("Next", hl.dsp.pass({ window = "class:^(TeamSpeak 3)$" }))

hl.bind("ALT + P", hl.dsp.exec_cmd("screen"))
hl.bind("ALT + O", hl.dsp.exec_cmd("screen --select"))
hl.bind("ALT + L",
    hl.dsp.exec_cmd(
        "pkill -SIGUSR1 gpu-screen-reco && notify-send Replay -i /home/arian/Pictures/replay.png Captured\\ screen"))

-- window rules
hl.window_rule({
    match = { class = "^Alacritty$" },
    opacity = "0.90"
})
hl.window_rule({
    match = { class = "^TeamSpeak 3$" },
    opacity = "0.95"
})
hl.window_rule({
    match = { class = "^Spotify$" },
    opacity = "0.95"
})

-- windowrule = float on, match:title ^(Friends List)$, match:class ^(steam)$
hl.window_rule({
    match = { title = "^Counter-Strike 2$" },
    fullscreen = true
})

-- fullscreen telegram media viewer
hl.window_rule({
    match = { class = "^org.telegram.desktop$", title = "Media viewer" },
    maximize = true
})
