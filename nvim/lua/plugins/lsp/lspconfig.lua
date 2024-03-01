
return {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function ()
        require("plugins.lsp.on_attach")
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local capabilities = cmp_nvim_lsp.default_capabilities()

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    }
                },
            }
        })

        lspconfig["rust_analyzer"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig["yamlls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig["tsserver"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig["jsonls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig["taplo"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
        lspconfig["jdtls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end
}
