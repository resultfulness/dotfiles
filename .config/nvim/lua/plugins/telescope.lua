return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    version = "*",
    config = function()
        require("telescope").setup({
            defaults = require("telescope.themes").get_ivy({
                layout_config = { height = 0.5 },
                selection_caret = "",
                entry_prefix = "",
                results_title = false,
                border = false,
                mappings = {
                    i = {
                        ["<a-p>"] = require("telescope.actions.layout").toggle_preview,
                    },
                },
            }),
            extensions = {
                ["ui-select"] = { require("telescope.themes").get_dropdown() },
            },
        })

        pcall(require("telescope").load_extension, "ui-select")

        local function telescope_keymap(suffix, func, desc)
            vim.keymap.set("n", "<leader>s" .. suffix, func, { desc = desc })
        end

        local builtin = require("telescope.builtin")

        telescope_keymap("h", builtin.help_tags, "search help")
        telescope_keymap("f", builtin.find_files, "search files")
        telescope_keymap("w", builtin.grep_string, "grep string")
        telescope_keymap("g", builtin.live_grep, "grep search")
        telescope_keymap("b", builtin.buffers, "search buffers")

        telescope_keymap("n", function()
            builtin.find_files({
                cwd = vim.fn.stdpath("config"),
                prompt_title = "search config",
            })
        end, "search config")
    end,
}
