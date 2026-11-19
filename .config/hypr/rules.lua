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

hl.window_rule({
    name = "float-yad",
    match = { class = "yad" },
    float = true,
})
