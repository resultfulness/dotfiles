return {
    "anAcc22/sakura.nvim",
    dependencies = "rktjmp/lush.nvim",
    config = function()
        vim.opt.background = "light"
        vim.cmd("colorscheme sakura")

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    end,
}
