vim.pack.add({
    {
        src = "https://github.com/nvim-telescope/telescope.nvim",
        version = vim.version.range("*"),
    },
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope-ui-select.nvim",
    "https://github.com/nvim-telescope/telescope-file-browser.nvim",
})

local actions = require("telescope.actions")
local fb_actions = require("telescope._extensions.file_browser.actions")

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
            prompt_path = true,
            mappings = {
                ["i"] = {
                    ["<c-w>"] = function()
                        vim.cmd("norm vbd")
                    end,
                    ["<c-d>"] = fb_actions.goto_cwd,
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

local builtin = require("telescope.builtin")
local file_browser = require("telescope").extensions.file_browser.file_browser

local function file_browser_in_cd()
    local full_path = vim.api.nvim_buf_get_name(0)
    local dir = vim.fn.fnamemodify(full_path, ":h:s?oil://??")
    file_browser({ path = dir })
end

local function search_config()
    builtin.find_files({
        cwd = vim.fn.stdpath("config"),
        prompt_title = "search config",
    })
end

return {
    builtin = builtin,
    file_browser_in_cd = file_browser_in_cd,
    search_config = search_config,
}
