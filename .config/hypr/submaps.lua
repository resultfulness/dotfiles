local function setup(opts)
    local super = opts.binds.super
    local animations = opts.animations
    local consts = opts.consts

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
            timeout = animations.windowsOut_speed_ms,
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

    hl.define_submap("resize", function()
        local resizeamt = 100

    -- stylua: ignore
    hl.bind("l", hl.dsp.window.resize({ x = resizeamt, y = 0, relative = true }), { repeating = true, description = "right" })
    -- stylua: ignore
    hl.bind("h", hl.dsp.window.resize({ x = -resizeamt, y = 0, relative = true }), { repeating = true, description = "left" })
    -- stylua: ignore
    hl.bind("k", hl.dsp.window.resize({ x = 0, y = resizeamt, relative = true }), { repeating = true, description = "up" })
    -- stylua: ignore
    hl.bind("j", hl.dsp.window.resize({ x = 0, y = -resizeamt, relative = true }), { repeating = true, description = "down" })

        bind_exec(
            "m",
            [[
        w="$(fuzzel --placeholder 'enter width...' --dmenu <<< '')";
        hyprctl dispatch "hl.dsp.window.resize({y=9999,x=$w,relative=false})"
        ]],
            "manual (enter width)",
            true
        )

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
        { key = "w", cmd = consts.browser },
        { key = "p", cmd = "prismlauncher" },
        { key = "s", cmd = "steam" },
        { key = "d", cmd = "discord&discover-overlay", desc = "discord" },
        { key = "n", cmd = "sunshine" },
        { key = "k", cmd = "keepassxc" },
        { key = "l", cmd = "libreoffice" },
        { key = "g", cmd = "gimp" },
        { key = "m", cmd = consts.music },
        { key = "v", cmd = consts.floatyTerminal .. " -e wiremix -v output -s extracompat", desc = "wiremix" },
        { key = "a", cmd = "anki" },
        { key = "z", cmd = "zathura" },
        { key = "c", cmd = consts.floatyTerminal .. " -e python", desc = "calculator" },
    }

    hl.define_submap("exec", "reset", function()
        for _, bind in pairs(exec_binds) do
            bind_exec(bind.key, bind.cmd, bind.desc or bind.cmd)
        end

        exit_binds()
    end)
end

return {
    setup = setup,
}
