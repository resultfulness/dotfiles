local function super(key)
    return "SUPER + " .. key
end
local function shift(key)
    return "SHIFT + " .. key
end

local function setup(opts)
    local consts = opts.consts

    hl.bind(super("q"), hl.dsp.exec_cmd(consts.terminal))
    hl.bind(super("c"), hl.dsp.window.close())
    hl.bind(super("m"), hl.dsp.exit())

    hl.bind(super("e"), hl.dsp.exec_cmd(consts.fileManager))
    hl.bind(super("space"), hl.dsp.exec_cmd(consts.menu))
    hl.bind(super("return"), hl.dsp.exec_cmd(consts.terminal))
    hl.bind(super(shift("s")), hl.dsp.exec_cmd([[grim -g "$(slurp -d)"]]))
    hl.bind(super("ALT + L"), hl.dsp.exec_cmd("hyprlock"))

    hl.bind(super("v"), hl.dsp.window.float({ action = "toggle" }))
    hl.bind(super(shift("v")), hl.dsp.window.cycle_next({ floating = true, tiled = true }))
    hl.bind(super("t"), hl.dsp.layout("togglesplit"))
    hl.bind(super("p"), hl.dsp.window.pseudo())
    hl.bind(super(shift("p")), function()
        hl.dispatch(hl.dsp.window.pseudo())
        hl.dispatch(hl.dsp.window.resize({
            y = 9999,
            x = 1280,
        }))
    end)
    hl.bind(super("equal"), hl.dsp.layout("splitratio 1.0 exact"))
    hl.bind(super("f"), hl.dsp.window.fullscreen({ mode = "maximized" }))
    hl.bind(super(shift("f")), hl.dsp.window.fullscreen({ mode = "fullscreen" }))

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


    return {
        super = super
    }
end

return {
    setup = setup,
}
