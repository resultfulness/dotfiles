vim.pack.add({
    {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("1.*"),
    },
    "https://github.com/rafamadriz/friendly-snippets",
})

require("blink.cmp").setup({
    keymap = { preset = "default" },
    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 0 },
        menu = {
            draw = {
                columns = {
                    { "label", "label_description", gap = 1 },
                    { "kind" },
                },
            },
        },
    },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
})
