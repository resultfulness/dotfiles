return {
    "hiberabyss/readline.nvim",
    config = function()
        vim.keymap.set("!", "<C-f>", "<Right>")
        vim.keymap.set("!", "<C-b>", "<Left>")
        vim.keymap.set("!", "<M-f>", require("readline").forward_word)
        vim.keymap.set("!", "<M-b>", require("readline").backward_word)
    end
}
