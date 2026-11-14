vim.pack.add({
    {
        src = "https://github.com/nvim-telescope/telescope.nvim",
        version = vim.version.range("*")
    },
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope-ui-select.nvim",
    "https://github.com/nvim-telescope/telescope-file-browser.nvim",
})

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local fb_actions = require("telescope._extensions.file_browser.actions")

local function switch_to_oil(prompt_bufnr)
    local ok, oil = pcall(require, "oil")
    if not ok then
        return
    end

    local current_picker = action_state.get_current_picker(prompt_bufnr)
    local path = current_picker.finder.path
    oil.open(path)
end

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
                ["<esc>"] = actions.close,
                ["<c-c>"] = { "<esc>", type = "command" },
            },
        },
        file_ignore_patterns = { "%.git" },
        previewer = false,
    }),
    pickers = {
        buffers = { show_all_buffers = true },
        find_files = { hidden = true },
        live_grep = { additional_args = { "--hidden" } },
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            dir_icon = "d",
            -- display_stat = false,
            previewer = false,
            follow_symlinks = true,
            mappings = {
                ["i"] = {
                    ["<c-w>"] = function()
                        vim.cmd("norm vbd")
                    end,
                    ["<c-d>"] = fb_actions.goto_cwd,
                    ["<a-o>"] = switch_to_oil,
                },
                ["n"] = {
                    ["-"] = fb_actions.goto_parent_dir,
                },
            },
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
        },
    },
})

pcall(require("telescope").load_extension, "file_browser")
pcall(require("telescope").load_extension, "ui-select")
