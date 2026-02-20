vim.g.mapleader = " "
vim.g.maplocalleader = " "

--number
vim.o.number = true
vim.o.relativenumber = true

--indent
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

--search/replace
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = "split"

--editor
vim.o.guicursor = ""
vim.o.wrap = false
vim.o.breakindent = true
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "80"
vim.o.list = true
vim.opt.listchars = {
    tab = "› ",
    trail = "•",
    nbsp = "␣",
    extends = ">",
}
vim.o.foldmethod = "marker"
vim.o.completeopt = "menu,menuone,noinsert,fuzzy"

--cmds
vim.o.timeoutlen = 300
vim.opt.path:append("**")
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.confirm = true
vim.o.showmode = false

--misc
vim.o.termguicolors = true
vim.g.c_syntax_for_h = 1
