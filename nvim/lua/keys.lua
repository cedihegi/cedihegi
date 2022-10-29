--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
map('i', 'jk', '', {})

map('n', '<leader>n', [[:NvimTreeToggle<cr>]], {})
map('n', '<leader>d', [[:NvimTreeFocus<cr>]], {})

-- Open buffer manager:
map('n', '<C-b>', [[:JABSOpen<cr>]], {})

-- toggle more plugins:
local bufopts = { noremap=true, silent=true, buffer=bufnr }

map('n', '<leader>l', [[:IndentLinesToggle]], {})
map('n', '<leader>t', [[:TagbarToggle]], {})
map('n', '<leader>ff', [[:Telescope find_files<cr>]], {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
