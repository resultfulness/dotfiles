vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = {
            "ruff_fix",
            "ruff_format",
            "ruff_organize_imports",
        },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        nix = { "alejandra" },
        _ = { lsp_format = "fallback" },
    },
})

return {
    format = require("conform").format,
}
