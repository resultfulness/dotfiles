require("opts")
require("keymaps")
require("yank-highlight")
require("packages")

require("godot").init()

vim.cmd.packadd("nvim.undotree")
vim.keymap.set("n", "<leader>u", vim.cmd.Undotree, {})
