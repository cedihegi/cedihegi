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
    -- Packer: the base for all of this :)
    use 'wbthomason/packer.nvim'

    -- filetree
    use 'nvim-tree/nvim-web-devicons' -- displaying nvim tree correctly
    use 'nvim-tree/nvim-tree.lua'

    -- lualine
    use 'nvim-lualine/lualine.nvim'                     -- statusline
    -- code-editing:
    use 'numToStr/Comment.nvim'
    -- Treesitter:
    use 'nvim-treesitter/nvim-treesitter'

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/plenary.nvim'},
        {'BurntSushi/ripgrep'}
      },
    }

    -- Buffer Management:
    -- use 'matbme/JABS.nvim'
    use 'theprimeagen/harpoon'
    use 'mbbill/undotree'

    -- General:
    use "lukas-reineke/indent-blankline.nvim"

    use 'rcarriga/nvim-notify'
    use 'preservim/tagbar'                        -- code structure
    use 'tpope/vim-fugitive'                       -- git integration
    use 'junegunn/gv.vim'                         -- commit history
    use 'windwp/nvim-autopairs'                    -- auto close brackets
    use 'rainbowhxch/beacon.nvim'
    use 'echasnovski/mini.surround'
    use 'ntpeters/vim-better-whitespace'

    -- Themes:
    use 'Mofiqul/dracula.nvim'                     -- colorschemeuse
    use 'Yazeed1s/oh-lucy.nvim'
    use 'marko-cerovac/material.nvim'
    use 'ful1e5/onedark.nvim'
    use 'reedes/vim-colors-pencil'
    use 'tomasr/molokai'
    use 'morhetz/gruvbox'
    use 'EdenEast/nightfox.nvim'

    -- Debugging
    use 'simrat39/rust-tools.nvim'
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'nvim-telescope/telescope-dap.nvim'

    -- LSP:
    use 'VonHeikemen/lsp-zero.nvim'
    use {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
    }
    use 'nvim-lua/lsp-status.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/prettier.nvim'
    -- specifically for rust for some reason:

    -- Autocompletion
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

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
      require('packer').sync()
    end
end)
