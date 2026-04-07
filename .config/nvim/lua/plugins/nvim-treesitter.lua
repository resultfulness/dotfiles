return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    config = function()
        local parsers = {
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
        }

        require("nvim-treesitter").install(parsers)

        local function try_ts_attach(b, language)
            if not vim.treesitter.language.add(language) then
                return
            end
            vim.treesitter.start(b, language)

            vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo[0][0].foldmethod = "expr"

            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end

        local available = require("nvim-treesitter").get_available()

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local b, ft = args.buf, args.match
                local language = vim.treesitter.language.get_lang(ft)

                if not language then
                    return
                end

                local installed = require("nvim-treesitter").get_installed(parsers)

                local is_installed = vim.tbl_contains(installed, language)
                local can_install = vim.tbl_contains(available, language)

                if not is_installed and can_install then
                    require("nvim-treesitter").install(language):await(function()
                        try_ts_attach(b, language)
                    end)
                else
                    try_ts_attach(b, language)
                end
            end,
        })
    end
}
