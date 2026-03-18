return {
    "ej-shafran/compile-mode.nvim",
    version = "^5.0.0",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        ---@type CompileModeOpts
        vim.g.compile_mode = {
            input_word_completion = true,
            bang_expansion = true,
            default_command = {
                c = "cc -o %:r % && ./%:r",
            },
        }
    end,
}
