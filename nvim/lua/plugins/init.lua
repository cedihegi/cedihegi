-- only contains plugins that require no configuration
return {
    -- Themes
    'Mofiqul/dracula.nvim',                     -- colorschemeuse
    'Yazeed1s/oh-lucy.nvim',
    'marko-cerovac/material.nvim',
    'ful1e5/onedark.nvim',
    'reedes/vim-colors-pencil',
    'tomasr/molokai',
    'morhetz/gruvbox',
    'EdenEast/nightfox.nvim',
    'catppuccin/nvim',

    -- Git:
    'tpope/vim-fugitive',
    'junegunn/gv.vim',                         -- commit history
    {'lewis6991/gitsigns.nvim', config=true},

    -- auto pairs and tags:
    {'windwp/nvim-autopairs', config=true},
    {'windwp/nvim-ts-autotag', config=true},

    -- surround
    'echasnovski/mini.surround',

    -- Mark trailing whitespace in strong red
    'ntpeters/vim-better-whitespace',
}
