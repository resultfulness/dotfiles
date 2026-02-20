return {
    "stevearc/oil.nvim",
    lazy = false,
    config = function()
        local oil = require("oil")
        oil.setup()
        vim.keymap.set("n", "-", oil.open)
    end,
}
