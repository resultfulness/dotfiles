return {
    "nvim-orgmode/orgmode",
    config = function()
        require("orgmode").setup({
            org_agenda_files = "~/documents/personal/org/**/*",
            org_default_notes_file = "~/documents/personal/org/refile.org",
        })
    end
}
