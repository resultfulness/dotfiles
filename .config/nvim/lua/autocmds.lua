local yankhighlight_group = vim.api.nvim_create_augroup("yank-highlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    group = yankhighlight_group,
    callback = function()
        vim.highlight.on_yank()
    end,
})

local cursorline_group = vim.api.nvim_create_augroup("cursorline-active-buf", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    group = cursorline_group,
    callback = function()
        vim.opt_local.cursorline = true
    end,
})

vim.api.nvim_create_autocmd({ "WinLeave" }, {
    group = cursorline_group,
    callback = function()
        vim.opt_local.cursorline = false
    end,
})
