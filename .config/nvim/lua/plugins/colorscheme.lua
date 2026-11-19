vim.pack.add({ "https://github.com/e-ink-colorscheme/e-ink.nvim" })

vim.cmd.colorscheme("e-ink")
local palette = require("e-ink.palette")

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

local function update_hl(group, settings)
    vim.api.nvim_set_hl(
        0,
        group,
        vim.tbl_extend("force", settings, { update = true })
    )
end

local function hi_override()
    for _, group in ipairs(theme_italics) do
        update_hl(group, { italic = false })
    end

    for _, group in ipairs(to_color) do
        update_hl(group, { fg = purple[vim.o.background] })
    end
end
hi_override()

local function toggle_dark_mode()
    vim.opt.background = vim.o.background == "dark" and "light" or "dark"
    hi_override()
end

local function toggle_transparency()
    local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
    update_hl("Normal", {
        bg = normal_hl["bg"] ~= nil and "NONE" or palette.mono()[1],
    })
end

return {
    toggle_dark_mode = toggle_dark_mode,
    toggle_transparency = toggle_transparency,
}
