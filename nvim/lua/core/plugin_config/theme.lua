local theme = "catppuccin-mocha"
function ColorMyPencils(color)
    color = color or "dracula"
    vim.cmd.colorscheme(color)
end

ColorMyPencils(theme)

require('lualine').setup{
    options = {
        icons_enabled = true,
        theme = "catppuccin",
    },
    sections = {
        lualine_a = {
            {
                'filename',
                path = 1,
            }
        }
    }
}
