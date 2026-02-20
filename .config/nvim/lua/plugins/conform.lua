return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = {
                    "ruff_fix",
                    "ruff_format",
                    "ruff_organize_imports",
                },
            },
        })

        vim.keymap.set("n", "<leader>f", function()
            require("conform").format({ lsp_format = "fallback" })
        end)
    end,
}
