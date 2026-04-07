return {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
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
            fuzzy = { implementation = "prefer_rust_with_warning" },
            cmdline = { enabled = false },
        })
    end
}
