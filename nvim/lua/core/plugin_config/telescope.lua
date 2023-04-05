local telescope = require('telescope')
telescope.setup()

local map = vim.api.nvim_set_keymap

map('n', '<leader>f', [[:Telescope git_files<cr>]], {})
map('n', '<leader>g', [[:Telescope find_files<cr>]], {})
map('n', '<leader>s', [[:Telescope live_grep<cr>]], {})

vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })

