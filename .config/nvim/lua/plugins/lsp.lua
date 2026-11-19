vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/j-hui/fidget.nvim",
})

require("fidget").setup({})

local servers = {
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
    gdscript = {},
    qmlls = {},
    denols = {},
    gleam = {},
    nixd = {},
    texlab = {},
}

for server_name, server_settings in pairs(servers) do
    vim.lsp.config(server_name, server_settings)
    vim.lsp.enable(server_name)
end

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup(
        "lsp-attach-highlight",
        { clear = true }
    ),
    callback = function(e)
        local client = vim.lsp.get_client_by_id(e.data.client_id)
        if not client then
            return
        end

        if client:supports_method("textDocument/documentHighlight", e.buf) then
            local highlight_augroup =
                vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

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
                    "lsp-detach-highlight",
                    { clear = true }
                ),
                callback = function(e)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({
                        group = "lsp-highlight",
                        buffer = e.buf,
                    })
                end,
            })
        end
    end,
})
