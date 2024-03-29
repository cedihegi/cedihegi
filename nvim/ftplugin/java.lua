require("plugins.lsp.on_attach")

local config = {
    cmd = { vim.fn.stdpath('data') .. '/mason/bin/jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    on_attach = on_attach,
}
require('jdtls').start_or_attach(config)
