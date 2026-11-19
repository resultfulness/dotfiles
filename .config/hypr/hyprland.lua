local consts = require("consts")
require("monitors")
require("input")
require("style").setup({ consts = consts })
require("layout")
require("rules")

local binds = require("binds").setup({ consts = consts })
local animations = require("animations")

require("submaps").setup({
    binds = binds,
    animations = animations,
    consts = consts,
})

hl.on("hyprland.start", function()
    hl.exec_cmd(consts.terminal)
    hl.exec_cmd("quickshell & awww-daemon & sunsetr & sunshine")
    hl.exec_cmd("hyprctl setcursor Adwaita " .. consts.cursorSize)
end)

