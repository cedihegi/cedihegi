local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
map('i', 'jk', '', {})

-- moving between views:
map('n', "<leader>w", '<C-w>', {})

-- moving vertically: center screen whenever moving to
map('n', "<C-d>", "<C-d>zz", {})
map('n', "<C-u>", "<C-u>zz", {})
map('n', "n", "nzz", {})
map('n', "N", "Nzz", {})

-- clear search
map('n', " ", [[:nohlsearch<cr>]], {})

map("v", "J", ":m '>+1<CR>gv=gv", {})
map("v", "K", ":m '<-2<CR>gv=gv", {})

-- allow escaping terminal more easily
map("t", "<Esc>", "<C-\\><C-n>", {})
