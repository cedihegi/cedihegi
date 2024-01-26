return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'BurntSushi/ripgrep'
    },
    config = true,
    keys = {
        {'<leader>f', '<cmd>Telescope git_files<cr>', desc = "Search git files"},
        {'<leader>g', '<cmd>Telescope find_files<cr>', desc = "Search all files"},
        {'<leader>s', '<cmd>Telescope live_grep<cr>', desc = "Live search"},
    }
}
