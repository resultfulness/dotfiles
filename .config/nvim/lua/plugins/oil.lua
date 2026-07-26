return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup({
            view_options = {
                is_always_hidden = function(name, _)
                    return require("godot").is_godot_project
                        and (
                            vim.endswith(name, ".uid")
                            or name == "server.pipe"
                        )
                end,
            },
        })
        vim.keymap.set("n", "<leader>-", require("oil").open, { desc = "oil" })
    end,
}
