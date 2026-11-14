return {
    "e-ink-colorscheme/e-ink.nvim",
    config = function()
        vim.cmd.colorscheme("e-ink")
        local palette = require("e-ink.palette")

        vim.api.nvim_set_hl(
            0,
            "Normal",
            { fg = palette.mono()[12], bg = "NONE" }
        )

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
        local theme_italics = { "@keyword", "Comment", "@markup.link.url" }

        local function hi_override()
            for _, group in ipairs(to_color) do
                vim.api.nvim_set_hl(0, group, {
                    fg = purple[vim.o.background],
                    update = true,
                })
            end

            for _, group in ipairs(theme_italics) do
                vim.api.nvim_set_hl(0, group, {
                    italic = false,
                    update = true,
                })
            end
        end
        hi_override()

        vim.keymap.set("n", "<leader>td", function()
            if vim.o.background == "dark" then
                vim.opt.background = "light"
            else
                vim.opt.background = "dark"
            end
            hi_override()
        end)

        local transparent = true
        vim.keymap.set("n", "<leader>tt", function()
            if transparent then
                vim.api.nvim_set_hl(
                    0,
                    "Normal",
                    { fg = palette.mono()[12], bg = palette.mono()[1] }
                )
                transparent = false
            else
                vim.api.nvim_set_hl(
                    0,
                    "Normal",
                    { fg = palette.mono()[12], bg = "NONE" }
                )
                transparent = true
            end
        end)
    end,
}
