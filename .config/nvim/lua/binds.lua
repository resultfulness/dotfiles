local function keymap(lhs, rhs, description, mode, extra_options)
    description = description or rhs
    mode = mode or "n"
    local options = { desc = description }
    if extra_options then
        vim.tbl_extend("force", options, extra_options)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

local function setup(opts)
    local plugins = opts.plugins or {}

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

    keymap("<leader>u", vim.cmd.Undotree, "open undotree")

    keymap("<leader>cf", plugins.conform.format, "format file")
    keymap("<leader>cc", plugins["compile-mode"].compile, "compile")
    keymap("<leader>cr", plugins["compile-mode"].recompile, "recompile")

    keymap("<leader>i", vim.cmd.Inspect, "inspect")

    local telescope = plugins.telescope

    keymap("<leader>f", telescope.builtin.find_files, "find files")
    keymap("<leader>hi", telescope.builtin.highlights, "show highlight")
    keymap("<leader>sw", telescope.builtin.grep_string, "find word")
    keymap("<leader>sh", telescope.builtin.help_tags, "search help")
    keymap("<leader>sg", telescope.builtin.live_grep, "search string")
    keymap("<leader>sb", telescope.builtin.buffers, "search buffers")
    keymap("<leader>sd", telescope.file_browser_in_cd, "open directory browser")
    keymap("<leader>sc", telescope.search_config, "search config")

    keymap("<leader>gs", telescope.builtin.git_status, "git status")

    keymap(
        "<leader>td",
        plugins.colorscheme.toggle_dark_mode,
        "toggle dark/light mode"
    )
    keymap(
        "<leader>tt",
        plugins.colorscheme.toggle_transparency,
        "toggle background transparency"
    )

    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup(
            "lsp-attach-binds",
            { clear = true }
        ),
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

    keymap(",nix", function()
        local module_name = vim.fn.expand("%:t:r")
        local snippet = string.format(
            [[
{...}: {
  flake.nixosModules.%s = {...}: {
    $0
  };
}]],
            module_name
        )
        vim.snippet.expand(snippet)
    end, "insert flake nixos module")
end

return { setup = setup }
