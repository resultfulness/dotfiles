vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.wrap = false
vim.o.breakindent = true

vim.o.guicursor = ""
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "80"
vim.o.list = true
vim.opt.listchars = { tab = "› ", trail = "•", nbsp = "␣", extends = ">" }
vim.o.foldmethod = "marker"
vim.o.foldlevelstart = 99
vim.o.completeopt = "menu,menuone,noinsert,fuzzy"
vim.o.wildmode = "lastused:full"

vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = "split"

vim.o.timeoutlen = 300
vim.opt.path:append("**")
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.confirm = true
vim.o.showmode = false

vim.o.termguicolors = true
vim.g.c_syntax_for_h = 1

vim.diagnostic.config({
    severity_sort = true,
    float = { source = "if_many" },
    underline = { severity = { min = vim.diagnostic.severity.WARN } },
    virtual_text = { source = "if_many", spacing = 2 },
    jump = { float = true },
})
