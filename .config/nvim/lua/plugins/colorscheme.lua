return {
    "anAcc22/sakura.nvim",
    dependencies = {
        "rktjmp/lush.nvim",
        {
            "jesseleite/noirbuddy.nvim",
            dependencies = { "tjdevries/colorbuddy.nvim" },
        },
        "e-ink-colorscheme/e-ink.nvim",
    },
    config = function()
        local colors = {
            sakura = function()
                vim.opt.background = "dark"
                vim.cmd.colorscheme("sakura")
            end,
            noir = function()
                require("noirbuddy").setup({ preset = "miami-nights" })
            end,
            eink = function()
                vim.opt.background = "dark"
                vim.cmd.colorscheme("e-ink")
                vim.api.nvim_set_hl(
                    0,
                    "Normal",
                    { fg = require("e-ink.palette").mono()[12], bg = "NONE" }
                )
            end,
        }

        local fns = {}
        for color, fn in pairs(colors) do
            vim.api.nvim_create_user_command(color:upper(), fn, {})
            table.insert(fns, fn)
        end

        fns[math.random(#colors)]()
    end,
}
