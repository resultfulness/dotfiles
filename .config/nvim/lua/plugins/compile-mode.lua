return {
    "ej-shafran/compile-mode.nvim",
    version = "^5.0.0",
    dependencies = { "nvim-lua/plenary.nvim", "m00qek/baleia.nvim" },
    config = function()
        vim.g.baleia = require("baleia").setup({})

        vim.g.compile_mode = {
            input_word_completion = true,
            bang_expansion = true,
            baleia_setup = true,
            default_command = {
                c = "cc -o %:r % && ./%:r",
                rust = "cargo run",
                python = "uv run main.py",
                plaintex = "latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f %",
                tex = "latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f %",
                odin = "odin run ."
            },
        }

        vim.keymap.set("n", "<leader>cc", "<cmd>Compile5<cr>")
        vim.keymap.set("n", "<leader>cC", "<cmd>Recompile<cr>")
    end
}
