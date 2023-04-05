vim.g.mapleader = ","
vim.g.localleader = "\\"

require('core.opts')
require('core.keymaps')

if vim.g.vscode then
    -- VSCode Extension
else
    require('core.plugins')
    require('core.plugin_config')
end
