return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup()
        vim.keymap.set("n", "<leader>-", require("oil").open)
    end
}
