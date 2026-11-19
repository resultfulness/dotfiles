local function setup(opts)
    local consts = opts.consts
    hl.config({
        general = {
            gaps_in = 4,
            gaps_out = 8,

            border_size = 4,

            col = {
                active_border = "rgb(a790d5)",
                inactive_border = "rgb(4a4a4a)",
            },
        },

        decoration = {
            rounding = 2,
            shadow = { enabled = false },

            blur = {
                enabled = true,
                size = 5,
                passes = 3,
                vibrancy = 0.1696,
            },
        },

        ecosystem = {
            no_update_news = true,
            no_donation_nag = true,
        },
    })

    hl.env("XCURSOR_SIZE", consts.cursorSize)
    hl.env("HYPRCURSOR_SIZE", consts.cursorSize)
end

return {
    setup = setup,
}
