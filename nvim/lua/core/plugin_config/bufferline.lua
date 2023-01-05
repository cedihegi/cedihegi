-- [Currently not imported!!]
require('bufferline').setup({
  options = {
    offsets = {
      {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true -- use a "true" to enable the default, or set your own character
      }
    }
  }
})

local map = vim.api.nvim_set_keymap

map('n', 'gk', [[:BufferLineCycleNext<cr>]], {})
map('n', 'gj', [[:BufferLineCyclePrev<cr>]], {})
