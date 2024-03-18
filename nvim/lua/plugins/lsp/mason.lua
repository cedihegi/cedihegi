return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function ()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = {
                "rust_analyzer",
                "yamlls",
                "tsserver",
                "cssls",
                "jsonls",
                "lua_ls",
                "jdtls",
                "tailwindcss",
                "html",
            },
            automatic_installation = true,
        })
    end
}
