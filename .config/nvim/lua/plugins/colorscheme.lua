return {
    "e-ink-colorscheme/e-ink.nvim",
    dependencies = {
        {
            "anAcc22/sakura.nvim",
            dependencies = { "rktjmp/lush.nvim" },
        },
    },
    config = function()
        local colors = {
            sakura = function()
                vim.cmd.colorscheme("sakura")
            end,
            eink = function()
                vim.cmd.colorscheme("e-ink")
                vim.api.nvim_set_hl(
                    0,
                    "Normal",
                    { fg = require("e-ink.palette").mono()[12], bg = "NONE" }
                )
            end,
        }

        colors.eink()
        vim.opt.background = "dark"

        vim.keymap.set("n", "<leader>td", function()
            if vim.o.background == "dark" then
                vim.opt.background = "light"
            else
                vim.opt.background = "dark"
            end
        end)
        vim.keymap.set("n", "<leader>tc", function()
            if vim.g.colors_name == "e-ink" then
                colors.sakura()
            else
                colors.eink()
            end
        end)
    end,
}
