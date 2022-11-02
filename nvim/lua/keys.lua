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

map('n', '<leader>l', [[:IndentLinesToggle<cr>]], {})
map('n', '<leader>t', [[:TagbarToggle]], {})


-- Telescope

map('n', '<leader>f', [[:Telescope git_files<cr>]], {})
map('n', '<leader>g', [[:Telescope find_files<cr>]], {})
map('n', '<leader>s', [[:Telescope live_grep<cr>]], {})

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)


