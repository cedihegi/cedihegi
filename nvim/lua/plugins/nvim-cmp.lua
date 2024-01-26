return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- Useful completion sources:
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-vsnip',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/vim-vsnip',

        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
    },
    config = function ()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                -- custom key mappings:
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = false}),
                ["<TAB>"] = cmp.mapping.select_next_item(),
            }),

            sources = cmp.config.sources({
                { name = 'path' },                              -- file paths
                { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
                { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
                { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
                { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip
                { name = "luasnip" },
                { name = 'buffer', keyword_length = 2 },        -- source current buffer
                { name = 'calc'},                               -- source for math calculation
            })

        })
    end

}
