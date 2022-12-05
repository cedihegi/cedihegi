-- [[ plug.lua ]]
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use {                                              -- filesystem navigation
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
  }

  use 'rainbowhxch/beacon.nvim'

  -- [[Buffer Management]]
  use 'matbme/JABS.nvim'
  -- [[Dev]]
  use 'nvim-lua/plenary.nvim'
  use 'BurntSushi/ripgrep'
  use 'nvim-telescope/telescope.nvim'                 -- fuzzy finder
  use { 'majutsushi/tagbar' }                        -- code structure
  use { 'Yggdroot/indentLine' }                      -- see indentation
  use { 'tpope/vim-fugitive' }                       -- git integration
  use { 'junegunn/gv.vim' }                          -- commit history
  use { 'windwp/nvim-autopairs' }                    -- auto close brackets

  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  -- [[Rust stuff]]
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'

  -- Completion framework:
  use 'hrsh7th/nvim-cmp'

  -- LSP completion source:
  use 'hrsh7th/cmp-nvim-lsp'

  -- Useful completion sources:
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'

  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  use 'VonHeikemen/lsp-zero.nvim'

  -- [[Theme]]
  use { 'mhinz/vim-startify' }                       -- start screen
  use {
    'nvim-lualine/lualine.nvim',                     -- statusline
    requires = {'kyazdani42/nvim-web-devicons',
                opt = true}
  }
  use { 'Mofiqul/dracula.nvim' }                     -- colorschemeuse
  use 'Yazeed1s/oh-lucy.nvim'
  use 'marko-cerovac/material.nvim'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
