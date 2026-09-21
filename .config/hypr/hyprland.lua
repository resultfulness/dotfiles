hl.monitor({ output = "HDMI-A-1", mode = "2560x1440@144", scale = 1 })

local terminal = "alacritty"
local fileManager = terminal .. " -e yazi"
local menu = "fuzzel"

local cursor_size = 24

hl.on("hyprland.start", function()
    hl.exec_cmd(terminal)
    hl.exec_cmd("quickshell & awww-daemon & sunsetr & sunshine")
    hl.exec_cmd("hyprctl setcursor Adwaita " .. cursor_size)
end)

hl.env("XCURSOR_SIZE", cursor_size)
hl.env("HYPRCURSOR_SIZE", cursor_size)

hl.config({
    input = {
        kb_layout = "pl,hu",
        kb_variant = ",qwerty",
        kb_options = "grp:alt_shift_toggle",

        accel_profile = "flat",
        touchpad = { natural_scroll = true },
    },

    general = {
        gaps_in = 4,
        gaps_out = 8,

        border_size = 4,

        col = {
            active_border = { colors = { "rgb(d699b6)" } },
            inactive_border = "rgb(4a4a4a)",
        },

        layout = "dwindle",
    },

    dwindle = { preserve_split = true },

    decoration = {
        rounding = 2,
        shadow = { enabled = false },

        blur = {
            enabled = true,
            size = 5,
            passes = 3,
            vibrancy = 0.1696,
        },
    },

    animations = { enabled = true },
    cursor = { zoom_disable_aa = true },

    -- ecosystem = { enforce_permissions = true } ,
})

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.22, 1 }, { 0.36, 1 } } })

local windowsOut_speed_ms = 150
local windowsOut_speed = 150 / 100

hl.animation({ leaf = "border", enabled = false })
hl.animation({ leaf = "windows", enabled = true, speed = 2.5, bezier = "easeOutQuint", style = "popin 60%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = windowsOut_speed, bezier = "linear", style = "popin 60%" })
hl.animation({ leaf = "fade", enabled = false })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.5, bezier = "linear" })
hl.animation({ leaf = "layers", enabled = true, speed = 2.5, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 3.5, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.5, bezier = "linear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3.5, bezier = "easeOutQuint", style = "slidevert" })
hl.animation({ leaf = "zoomFactor", enabled = false, speed = 3.5, bezier = "easeOutQuint" })

local function super(key)
    return "SUPER + " .. key
end
local function shift(key)
    return "SHIFT + " .. key
end

hl.bind(super("q"), hl.dsp.exec_cmd(terminal))
hl.bind(super("c"), hl.dsp.window.close())
hl.bind(super("m"), hl.dsp.exit())

hl.bind(super("e"), hl.dsp.exec_cmd(fileManager))
hl.bind(super("space"), hl.dsp.exec_cmd(menu))
hl.bind(super("return"), hl.dsp.exec_cmd(terminal))
hl.bind(super(shift("s")), hl.dsp.exec_cmd([[grim -g "$(slurp -d)"]]))
hl.bind(super("ALT + L"), hl.dsp.exec_cmd("hyprlock"))

hl.bind(super("v"), hl.dsp.window.float({ action = "toggle" }))
hl.bind(super(shift("v")), hl.dsp.window.cycle_next({ floating = true, tiled = true }))
hl.bind(super("t"), hl.dsp.layout("togglesplit"))
hl.bind(super("p"), hl.dsp.window.pseudo())
hl.bind(super("f"), hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(super(shift("f")), hl.dsp.window.fullscreen({ mode = "fullscreen" }))

local function zoom(offset)
    local zoom_factor = hl.get_config("cursor.zoom_factor")
    hl.config({
        cursor = {
            zoom_factor = math.max(1, math.min(4, zoom_factor + offset)),
        },
    })
end

local function toggle_zoom()
    local zoom_factor = hl.get_config("cursor.zoom_factor")
    hl.config({ cursor = { zoom_factor = zoom_factor == 1 and 4 or 1 } })
end

hl.bind(super(shift("z")), toggle_zoom)
hl.bind(super(shift("mouse_down")), function()
    zoom(-1)
end)
hl.bind(super(shift("mouse_up")), function()
    zoom(1)
end)

hl.bind(super("h"), hl.dsp.focus({ direction = "left" }))
hl.bind(super("l"), hl.dsp.focus({ direction = "right" }))
hl.bind(super("k"), hl.dsp.focus({ direction = "up" }))
hl.bind(super("j"), hl.dsp.focus({ direction = "down" }))

hl.bind(super(shift("h")), hl.dsp.window.move({ direction = "left" }))
hl.bind(super(shift("l")), hl.dsp.window.move({ direction = "right" }))
hl.bind(super(shift("k")), hl.dsp.window.move({ direction = "up" }))
hl.bind(super(shift("j")), hl.dsp.window.move({ direction = "down" }))

hl.bind(super("tab"), hl.dsp.focus({ last = true }))

hl.bind(super("f1"), hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))
hl.bind(super("f2"), hl.dsp.exec_cmd("killall quickshell && quickshell"))

local workspace_names = { "term", "web", "dev", "game", "music" }

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(super(key), hl.dsp.focus({ workspace = i }))
    hl.bind(super(shift(key)), hl.dsp.window.move({ workspace = i }))

    if workspace_names[i] ~= nil then
        hl.workspace_rule({
            workspace = tostring(i),
            default_name = workspace_names[i],
            persistent = true,
        })
    end
end

hl.bind(super("mouse_down"), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(super("mouse_up"), hl.dsp.focus({ workspace = "e-1" }))

hl.bind(super("mouse:272"), hl.dsp.window.drag(), { mouse = true })
hl.bind(super("mouse:273"), hl.dsp.window.resize(), { mouse = true })

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl --class=backlight set 5%+"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl --class=backlight set 5%-"),
    { locked = true, repeating = true }
)

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind(super("s"), hl.dsp.submap("main"))
hl.bind(super("semicolon"), hl.dsp.submap("main"))
hl.bind(super("d"), hl.dsp.submap("exec"))

local function reset()
    hl.dispatch(hl.dsp.submap("reset"))
end

local function bind_exec(key, exec_str, description, do_reset)
    hl.bind(key, function()
        hl.dispatch(hl.dsp.exec_cmd(exec_str))
        if do_reset then
            reset()
        end
    end, { description = description or exec_str })
end

local function exit_binds()
    hl.bind("backspace", hl.dsp.submap("main"))
    hl.bind("escape", hl.dsp.submap("reset"))
end

local function dispatch_after_close(dispatcher)
    hl.timer(function()
        hl.dispatch(dispatcher)
    end, {
        type = "oneshot",
        timeout = windowsOut_speed_ms,
    })
end

hl.define_submap("main", function()
    hl.bind("d", hl.dsp.submap("exec"), { description = "+exec" })
    hl.bind("r", hl.dsp.submap("resize"), { description = "+resize" })
    hl.bind("p", hl.dsp.submap("power"), { description = "+power" })
    hl.bind("v", hl.dsp.submap("volume"), { description = "+volume" })
    hl.bind("s", hl.dsp.submap("screenshot"), { description = "+screenshot" })
    hl.bind("b", hl.dsp.submap("brightness"), { description = "+brightness" })
    hl.bind("n", hl.dsp.submap("notifications"), { description = "+notifications" })

    hl.bind("c", function()
        dispatch_after_close(hl.dsp.exec_cmd("hyprpicker --autocopy"))
        reset()
    end, { description = "color picker" })

    hl.bind("backspace", hl.dsp.submap("reset"))
    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- stylua: ignore
hl.define_submap("resize", function()
    local resizeamt = 100

    hl.bind("l", hl.dsp.window.resize({ x = resizeamt, y = 0, relative = true }), { repeating = true, description = "right" })
    hl.bind("h", hl.dsp.window.resize({ x = -resizeamt, y = 0, relative = true }), { repeating = true, description = "left" })
    hl.bind("k", hl.dsp.window.resize({ x = 0, y = resizeamt, relative = true }), { repeating = true, description = "up" })
    hl.bind("j", hl.dsp.window.resize({ x = 0, y = -resizeamt, relative = true }), { repeating = true, description = "down" })

    exit_binds()
end)

hl.define_submap("power", "reset", function()
    bind_exec("s", "systemctl suspend", "sleep")
    bind_exec("r", "reboot")
    bind_exec("o", "poweroff")

    exit_binds()
end)

hl.define_submap("volume", function()
    bind_exec("j", "volctl down", "volume down")
    bind_exec("k", "volctl up", "volume up")
    bind_exec("m", "volctl toggle", "mute")
    bind_exec("c", "volctl cycle", "cycle output")

    exit_binds()
end)

hl.define_submap("screenshot", function()
    local satty = [[satty -f - \
        --initial-tool=arrow \
        --copy-command=wl-copy \
        --actions-on-escape="save-to-clipboard,exit" \
        --brush-smooth-history-size=5 \
        --disable-notifications
    ]]

    local region_capture = [[grim -t ppm -g "$(slurp -d)" - | ]] .. satty
    local select_capture = "grim -t ppm - | " .. satty
    local window_capture = [[
        hyprctl activewindow -j |
        jq -r '. | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' |
        grim -t ppm -g - - |
    ]] .. satty

    hl.bind("r", function()
        dispatch_after_close(hl.dsp.exec_cmd(region_capture))
        reset()
    end, { description = "capture region" })

    hl.bind("f", function()
        dispatch_after_close(hl.dsp.exec_cmd(select_capture))
        reset()
    end, { description = "capture screen" })

    hl.bind("w", function()
        dispatch_after_close(hl.dsp.exec_cmd(window_capture))
        reset()
    end, { description = "capture focused window" })

    exit_binds()
end)

hl.define_submap("brightness", "reset", function()
    bind_exec("x", "ddcutil setvcp 10 100", "max (100)")
    bind_exec("e", "ddcutil setvcp 10 44", "eco (44)")
    bind_exec("m", "ddcutil setvcp 10 0", "min (0)")

    exit_binds()
end)

hl.define_submap("notifications", function()
    bind_exec("a", "makoctl dismiss -a", "dismiss all", true)
    bind_exec("d", "makoctl dismiss", "dismiss last")
    bind_exec("r", "makoctl restore", "restore last")

    exit_binds()
end)

local exec_binds = {
    { key = "w", cmd = "zen-browser" },
    { key = "p", cmd = "prismlauncher" },
    { key = "s", cmd = "steam" },
    { key = "d", cmd = "discord&discover-overlay", desc = "discord" },
    { key = "n", cmd = "sunshine" },
    { key = "o", cmd = "obsidian" },
    { key = "k", cmd = "keepassxc" },
    { key = "l", cmd = "libreoffice" },
    { key = "g", cmd = "gimp" },
    { key = "m", cmd = "alacritty -e cmus", desc = "cmus" },
    { key = "v", cmd = "alacritty --class float -e wiremix -v output -s extracompat", desc = "wiremix" },
    { key = "a", cmd = "anki" },
    { key = "z", cmd = "zathura" },
    { key = "c", cmd = "alacritty --class float -e python", desc = "calculator" },
}

hl.define_submap("exec", "reset", function()
    for _, bind in pairs(exec_binds) do
        bind_exec(bind.key, bind.cmd, bind.desc or bind.cmd)
    end

    exit_binds()
end)

hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },

    no_focus = true,
})

hl.window_rule({
    name = "anki-sizing-1",
    match = {
        class = "anki",
        title = ".*- Anki",
    },
    float = true,
    size = { 1280, 720 },
})

hl.window_rule({
    name = "anki-sizing-2",
    match = {
        class = "anki",
        title = "Add",
    },
    float = true,
    size = { 800, 600 },
})

hl.window_rule({
    name = "float",
    match = { class = "float" },
    float = true,
})
