--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins

-- Plugins:

require('nvim-tree').setup{}
require('lualine').setup {
  options = {
    theme = 'material'
  }
}

require('Comment').setup()
require('nvim-autopairs').setup{} -- Add this line
require('jabs_setup')

require("mason").setup()

-- Setting up rust tools
local lsp = require('lsp-zero')
-- lsp.nvim_workspace()
lsp.preset('recommended')


-- lsp.nvim_workspace()
lsp.setup()
-- local rt = require("rust-tools")
--
-- rt.setup({
--   server = {
--     on_attach = function(_, bufnr)
--       -- Hover actions
--       vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
--       -- Code action groups
--       vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--     end,
--   },
-- })


-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])


-- Completion Plugin Setup
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  -- Installed sources:
  sources = {
    { name = 'path' },                              -- file paths
    { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
    { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
    { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer', keyword_length = 2 },        -- source current buffer
    { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
    { name = 'calc'},                               -- source for math calculation
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})



-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--     -- Enable completion triggered by <c-x><c-o>
--     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--     local bufopts = { noremap=true, silent=true, buffer=bufnr }
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--     vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, bufopts)
--     vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
--     vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
--     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--     vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--     vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
--     vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
--     vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- end
--
-- -- this part is telling Neovim to use the lsp server
-- local servers = { 'pyright', 'tsserver', 'jdtls' }
-- for _, lsp in pairs(servers) do
--     require('lspconfig')[lsp].setup {
--         on_attach = on_attach,
--         flags = {
--           debounce_text_changes = 150,
--         }
--     }
-- end
--
-- -- this is for diagnositcs signs on the line number column
-- -- use this to beautify the plain E W signs to more fun ones
-- -- !important nerdfonts needs to be setup for this to work in your terminal
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
-- for type, icon in pairs(signs) do
--     local hl = "DiagnosticSign" .. type
--     vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
-- end
--
