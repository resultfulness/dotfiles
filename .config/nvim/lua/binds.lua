local function keymap(lhs, rhs, description, mode, extra_options)
    description = description or rhs
    mode = mode or "n"
    local options = { desc = description }
    if extra_options then
        vim.tbl_extend("force", options, extra_options)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

keymap("<f1>", "<nop>", "", { "n", "x", "i" })
keymap("q:", ":")
keymap("<leader>q", vim.diagnostic.setloclist, "show diagnostics")
keymap("<c-w>r", vim.cmd.restart, "restart editor")

keymap("<c-d>", "<c-d>zz")
keymap("<c-u>", "<c-u>zz")
keymap("n", "nzz")
keymap("N", "Nzz")
keymap("gJ", "mzJ`z")

keymap("<leader>d", [["_d]], "delete to blank", { "n", "x" })
keymap("<leader>y", [["+y]], "yank to system", { "n", "x" })

keymap("<leader>i", vim.cmd.Inspect, "inspect")

local telescope = require("telescope.builtin")
local file_browser = require("telescope").extensions.file_browser.file_browser

keymap("<leader>f", telescope.find_files, "find files")
keymap("<leader>hi", telescope.highlights, "show highlight")
keymap("<leader>sw", telescope.grep_string, "find word")
keymap("<leader>sh", telescope.help_tags, "search help")
keymap("<leader>sg", telescope.live_grep, "search string")
keymap("<leader>sb", telescope.buffers, "search buffers")
keymap("<leader>sd", function()
    local full_path = vim.api.nvim_buf_get_name(0)
    local dir = vim.fn.fnamemodify(full_path, ":h:s?oil://??")
    file_browser({ path = dir })
end, "open directory browser")
keymap("<leader>sc", function()
    telescope.find_files({
        cwd = vim.fn.stdpath("config"),
        prompt_title = "search config",
    })
end, "search config")

local format = require("conform").format
keymap("<leader>cf", function()
    format({ lsp_format = "fallback" })
end, "format file")

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach-binds", { clear = true }),
    callback = function(e)
        local opts = {
            noremap = true,
            silent = true,
            buffer = e.buf,
            desc = "vim.lsp.buf.definition()",
        }
        vim.keymap.set("n", "grd", vim.lsp.buf.definition, opts)

        local client = vim.lsp.get_client_by_id(e.data.client_id)
        if not client then
            return
        end

        if client:supports_method("textDocument/inlayHint", e.buf) then
            vim.keymap.set("n", "grh", function()
                local is_hint_enabled =
                    vim.lsp.inlay_hint.is_enabled({ bufnr = e.buf })
                vim.lsp.inlay_hint.enable(not is_hint_enabled)
            end, { desc = "toggle inlay hint" })
        end
    end,
})

local palette = require("e-ink.palette")
local hi_override = require("plugins.colorscheme").hi_override
local transparent = true
keymap("<leader>td", function()
    if vim.o.background == "dark" then
        vim.opt.background = "light"
    else
        vim.opt.background = "dark"
    end
    hi_override()
end, "toggle dark/light mode")
keymap("<leader>tt", function()
    if transparent then
        vim.api.nvim_set_hl(
            0,
            "Normal",
            { fg = palette.mono()[12], bg = palette.mono()[1] }
        )
        transparent = false
    else
        vim.api.nvim_set_hl(
            0,
            "Normal",
            { fg = palette.mono()[12], bg = "NONE" }
        )
        transparent = true
    end
end, "toggle background transparency")

keymap("<leader>u", vim.cmd.Undotree, "open undotree")
