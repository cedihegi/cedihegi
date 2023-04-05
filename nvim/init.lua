vim.g.mapleader = ","
vim.g.localleader = "\\"


if vim.g.vscode then
    -- VSCode Extension
else
    require('core.opts')
    require('core.keymaps')
    require('core.plugins')
    require('core.plugin_config')
end
