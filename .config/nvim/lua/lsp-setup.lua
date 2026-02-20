local M = {}

M.setup_lsp_hover = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if
        not (
            client
            and client:supports_method(
                vim.lsp.protocol.Methods.textDocument_documentHighlight,
                event.buf
            )
        )
    then
        return
    end

    local highlight_augroup =
        vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
    })

    vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
        callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({
                group = "lsp-highlight",
                buffer = event2.buf,
            })
        end,
    })
end

M.setup_hint_toggle = function(event, key)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if
        not (
            client
            and client:supports_method(
                vim.lsp.protocol.Methods.textDocument_inlayHint,
                event.buf
            )
        )
    then
        return
    end

    vim.keymap.set("n", key, function()
        local is_hint_enabled =
            vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
        vim.lsp.inlay_hint.enable(not is_hint_enabled)
    end)
end

return M
