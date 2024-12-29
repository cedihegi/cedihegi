vim.g.mapleader = ","
vim.g.localleader = "\\"


require("opts")

if not vim.g.vscode then
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

    -- load plugins only when "real neovim" is started
    require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } }, {
        install = {
            colorscheme = { "carbonfox" },
        },
    })
end

-- require("lazy").setup(plugins, {})

require("keymaps")
