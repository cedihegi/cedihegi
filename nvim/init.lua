vim.g.mapleader = ","
vim.g.localleader = "\\"

-- Setup Lazyvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Each named section will get its own config file

require("lazy").setup({{import = "plugins"}, {import = "plugins.lsp"}})
-- local plugins = {
--     -- Filetree
--     {
--         'nvim-tree/nvim-tree.lua',
--         dependencies = {
--             "nvim-tree/nvim-web-devicons"
--         }
--     },
--     -- lualine
--     'nvim-lualine/lualine.nvim',                     -- statusline
--     -- code-editing:
--     'numToStr/Comment.nvim',
--     -- Treesitter:
--     'nvim-treesitter/nvim-treesitter',
--
--     -- Telescope
--     {
--       'nvim-telescope/telescope.nvim',
--       dependencies = {
--         'nvim-lua/plenary.nvim',
--         'BurntSushi/ripgrep'
--       },
--     },
-- }

-- require("lazy").setup(plugins, {})

require("keymaps")
require("opts")
