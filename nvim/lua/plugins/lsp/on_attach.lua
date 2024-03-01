-- on_attach defined outside because it is also used by other configurations
on_attach = function(client, bufnr)
    -- make sure telescope is loaded
    require("telescope")
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }
    opts.buffer = bufnr
    opts.desc = "Show LSP references"
    keymap.set("n", "gR", "<cmd>Telescope lsp_references<cr>", opts)

    opts.desc = "Go to declaration"
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Show LSP definitions"
    keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)

    opts.desc = "Show LSP implementations"
    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)

    opts.desc = "Show LSP type definitions"
    keymap.set("n", "gi", "<cmd>Telescope lsp_type_definitions<cr>", opts)

    opts.desc = "See available code actions"
    keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Show buffer diagnostics"
    keymap.set("n", "<leader>e", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)

    opts.desc = "Show line diagnostics"
    keymap.set("n", "gl", vim.diagnostic.open_float, opts)

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

    opts.desc = "Format current buffer"
    keymap.set("n", "<leader>q", vim.lsp.buf.format, opts) -- mapping to restart lsp if necessary
end

return {}
