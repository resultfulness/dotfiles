return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "j-hui/fidget.nvim", opts = {} },
        "saghen/blink.cmp",
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                vim.keymap.set(
                    "n",
                    "gd",
                    vim.lsp.buf.definition,
                    { buffer = event.buf }
                )
                vim.keymap.set(
                    "n",
                    "grd",
                    vim.lsp.buf.definition,
                    { buffer = event.buf }
                )
                vim.keymap.set(
                    "n",
                    "gD",
                    vim.lsp.buf.declaration,
                    { buffer = event.buf }
                )
                vim.keymap.set(
                    "n",
                    "g.",
                    vim.lsp.buf.code_action,
                    { buffer = event.buf }
                )

                require("lsp-setup").setup_lsp_hover(event)
                require("lsp-setup").setup_hint_toggle(event, "g:")
            end,
        })

        vim.diagnostic.config({
            severity_sort = true,
            float = { source = "if_many" },
            underline = { severity = vim.diagnostic.severity.ERROR },
            virtual_text = {
                source = "if_many",
                spacing = 2,
            },
        })

        local servers = {
            lua_ls = {
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
        }

        local capabilities = require("blink.cmp").get_lsp_capabilities()

        for server_name in pairs(servers) do
            local server = servers[server_name]
            server.capabilities = vim.tbl_deep_extend(
                "force",
                {},
                capabilities,
                server.capabilities or {}
            )
            vim.lsp.config(server_name, server)
            vim.lsp.enable(server_name)
        end
    end,
}
