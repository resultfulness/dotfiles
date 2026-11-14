vim.pack.add({ "https://github.com/e-ink-colorscheme/e-ink.nvim" })

vim.cmd.colorscheme("e-ink")
local palette = require("e-ink.palette")

vim.api.nvim_set_hl(0, "Normal", { fg = palette.mono()[12], bg = "NONE" })

local theme_italics = { "@keyword", "Comment", "@markup.link.url" }
local to_color = {
    "Constant",
    "Character",
    "Number",
    "Boolean",
    "Float",
    "String",
    "Directory",
    "CursorLineNr",
    "WhichKeyGroup",
}
local purple = { dark = "#a790d5", light = "#7d30a5" }

local function hi_override()
    for _, group in ipairs(theme_italics) do
        vim.api.nvim_set_hl(0, group, {
            italic = false,
            update = true,
        })
    end

    for _, group in ipairs(to_color) do
        vim.api.nvim_set_hl(0, group, {
            fg = purple[vim.o.background],
            update = true,
        })
    end
end
hi_override()

return { hi_override = hi_override }
