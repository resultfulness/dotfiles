return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    version = "*",
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = { require("telescope.themes").get_dropdown() },
            },
        })

        pcall(require("telescope").load_extension, "ui-select")

        vim.keymap.set(
            "n",
            "<leader>sh",
            require("telescope.builtin").help_tags,
            { desc = "search help" }
        )

        vim.keymap.set("n", "<leader>sf", function()
            require("telescope.builtin").find_files({ hidden = true })
        end, { desc = "search files" })

        vim.keymap.set(
            "n",
            "<leader>sw",
            require("telescope.builtin").grep_string,
            { desc = "grep string" }
        )

        vim.keymap.set(
            "n",
            "<leader>sg",
            require("telescope.builtin").live_grep,
            { desc = "grep search" }
        )

        vim.keymap.set("n", "<leader>sn", function()
            require("telescope.builtin").find_files({
                cwd = vim.fn.stdpath("config"),
            })
        end, { desc = "search configuration" })
    end,
}
