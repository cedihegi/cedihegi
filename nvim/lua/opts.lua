-- [[ opts.lua ]]
local opt = vim.opt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- use spaces for tabs and whatnot
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true

opt.colorcolumn = '80'           -- str:  Show col for max line length
opt.number = true                -- bool: Show line numbers
opt.relativenumber = true        -- bool: Show relative line numbers

-- make the cursor fat:
opt.guicursor = ""
opt.scrolloff = 6

opt.backspace = '2'
opt.showcmd = true
opt.laststatus = 2
opt.autowrite = true
opt.cursorline = true
opt.autoread = true

opt.listchars = "trail:•"
opt.list = true

opt.signcolumn = 'yes'

opt.termguicolors = true         -- bool: If term supports ui color then enable
opt.guifont = "DejaVu Sans Mono:h13"

-- autocommands:
vim.cmd([[autocmd BufEnter *.pdf execute "!zathura '%' &" | bdelete %]])

-- set colorscheme
vim.cmd("colorscheme catppuccin-mocha")
