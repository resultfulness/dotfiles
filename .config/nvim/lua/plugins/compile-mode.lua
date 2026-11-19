vim.pack.add({
    "https://github.com/ej-shafran/compile-mode.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/m00qek/baleia.nvim",
})

vim.g.baleia = require("baleia").setup()
vim.g.compile_mode = {
    bang_expansion = true,
    ansi_color = { kind = "render" },
    input_word_completion = true,
    default_command = {
        c = "cc -o %:r % && ./%:r",
        rust = "cargo run",
        python = "uv run main.py",
        plaintex = "latexmk -xelatex -bibtex -halt-on-error -interaction=nonsstopmode %",
        tex = "latexmk -xelatex -bibtex -halt-on-error -interaction=nonsstopmode %",
        gdscript = "godot scenes/",
        gleam = "gleam run",
    },
}

return {
    compile = "<cmd>Compile5<cr>",
    recompile = "<cmd>Recompile<cr>",
}
