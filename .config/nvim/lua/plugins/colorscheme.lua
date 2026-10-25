return {
    "e-ink-colorscheme/e-ink.nvim",
    dependencies = {
        "chrsm/paramount-ng.nvim",
        "rktjmp/lush.nvim",
    },
    config = function()
        vim.cmd.colorscheme("e-ink")

        local palette = require("e-ink.palette")

        vim.api.nvim_set_hl(
            0,
            "Normal",
            { fg = palette.mono()[12], bg = "NONE" }
        )
        local colored =
            { "Constant", "Character", "Number", "Boolean", "Float", "String" }

        local function colorit()
            for _, hl in ipairs(colored) do
                vim.api.nvim_set_hl(0, hl, {
                    fg = palette.everforest().orange,
                })
            end
        end
        colorit()

        vim.opt.background = "dark"

        vim.keymap.set("n", "<leader>td", function()
            if vim.o.background == "dark" then
                vim.opt.background = "light"
            else
                vim.opt.background = "dark"
            end
            colorit()
        end)
    end,
}
