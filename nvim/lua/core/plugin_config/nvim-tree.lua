vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

local map = vim.api.nvim_set_keymap
map('n', '<leader>n', [[:NvimTreeToggle<cr>]], {})
map('n', '<leader>d', [[:NvimTreeFocus<cr>]], {})
