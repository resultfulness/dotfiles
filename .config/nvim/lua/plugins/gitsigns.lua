return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "U" },
            },
            current_line_blame = true,
            on_attach = function(bufnr)
                local gs = require("gitsigns")
                vim.keymap.set("n", "[c", function()
                    gs.nav_hunk("prev")
                end, { desc = "prev hunk", buffer = bufnr })
                vim.keymap.set("n", "]c", function()
                    gs.nav_hunk("next")
                end, { desc = "next hunk", buffer = bufnr })
            end,
        })
    end,
}
