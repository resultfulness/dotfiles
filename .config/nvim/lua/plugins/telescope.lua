return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = vim.fn.executable("make") == 1,
        },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = { require("telescope.themes").get_dropdown() },
            },
        })

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>?", builtin.help_tags)
        vim.keymap.set("n", "<leader>sf", function()
            builtin.find_files({ hidden = true })
        end)
        vim.keymap.set("n", "<leader>sw", builtin.grep_string)
        vim.keymap.set("n", "<leader>sg", builtin.live_grep)
        vim.keymap.set("n", "<leader>sr", builtin.resume)
        vim.keymap.set("n", "<leader><leader>", builtin.buffers)
        vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find)
        vim.keymap.set("n", "<leader>sn", function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end)
    end,
}
