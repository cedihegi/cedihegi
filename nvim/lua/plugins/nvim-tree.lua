return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local nvimtree = require("nvim-tree")
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local map = vim.api.nvim_set_keymap
        map('n', '<leader>n', '<cmd>NvimTreeToggle<cr>', {})
        map('n', '<leader>d', '<cmd>NvimTreeFocus<cr>', {})
        nvimtree.setup({})
    end,
}
