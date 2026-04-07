vim.keymap.set(
    "n",
    "<leader>q",
    vim.diagnostic.setloclist,
    { desc = "vim.diagnostic.setloclist()" }
)

vim.keymap.set("n", "<leader>r", vim.cmd.restart, { desc = "restart" })

vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = 'delete to "_' })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = 'yank to "+' })

vim.keymap.set("n", "J", "mzJ`z")
