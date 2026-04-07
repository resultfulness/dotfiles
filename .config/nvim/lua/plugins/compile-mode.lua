return {
    "ej-shafran/compile-mode.nvim",
    version = "^5.0.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        vim.g.compile_mode = {
            input_word_completion = true,
            bang_expansion = true,
            default_command = {
                c = "cc -o %:r % && ./%:r",
                rust = "cargo run",
            },
        }

        vim.keymap.set("n", "<leader>cc", "<cmd>Compile<cr>")
        vim.keymap.set("n", "<leader>cC", "<cmd>Recompile<cr>")
    end
}
