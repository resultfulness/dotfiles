local function lsp_setup()
    require("fidget").setup({})
    local lsp_servers = {
        lua_ls = {
            ---@type lspconfig.settings.lua_ls
            settings = {
                Lua = {
                    completion = { callSnippet = "Replace" },
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = { enable = false },
                },
            },
        },
        rust_analyzer = {},
        ts_ls = {},
        cssls = {},
        svelte = {},
        emmet_language_server = {},
        pyright = {},
        clangd = {},
        jdtls = {},
    }

    for server_name, server_settings in pairs(lsp_servers) do
        vim.lsp.config(server_name, server_settings)
        vim.lsp.enable(server_name)
    end

    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
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

            if
                client:supports_method("textDocument/documentHighlight", e.buf)
            then
                local highlight_augroup = vim.api.nvim_create_augroup(
                    "lsp-highlight",
                    { clear = false }
                )

                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    buffer = e.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.document_highlight,
                })

                vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                    buffer = e.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.clear_references,
                })

                vim.api.nvim_create_autocmd("LspDetach", {
                    group = vim.api.nvim_create_augroup(
                        "lsp-detach",
                        { clear = true }
                    ),
                    callback = function(e2)
                        vim.lsp.buf.clear_references()
                        vim.api.nvim_clear_autocmds({
                            group = "lsp-highlight",
                            buffer = e2.buf,
                        })
                    end,
                })
            end
        end,
    })
end

return {
    "neovim/nvim-lspconfig",
    dependencies = { "j-hui/fidget.nvim" },
    config = lsp_setup,
}
