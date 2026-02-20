return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    lazy = false,
    build = ":TSUpdate",
    branch = "master",
    config = function()
        vim.defer_fn(function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "css",
                    "html",
                    "lua",
                    "python",
                    "rust",
                    "javascript",
                    "typescript",
                    "vimdoc",
                    "vim",
                },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                textobjects = {
                    swap = {
                        enable = true,
                        swap_next = {
                            ["]j"] = {
                                query = "@parameter.inner",
                                desc = "swap with next",
                            },
                        },
                        swap_previous = {
                            ["[j"] = {
                                query = "@parameter.inner",
                                desc = "swap with previous",
                            },
                        },
                    },
                },
            })
        end, 0)
    end,
}
