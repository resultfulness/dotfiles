hl.config({ animations = { enabled = true } })

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

return {
    windowsOut_speed_ms = windowsOut_speed_ms,
}
