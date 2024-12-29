return {
    'lervag/vimtex',
    ft='tex',
    config = function ()
        vim.g.vimtex_view_method = 'zathura'

        vim.g.vimtex_compiler_latexmk = {
            build = 'build',
            options = {
                '-verbose',
                '-file-line-error',
                '-synctex=1',
                '-interaction=nonstopmode',
                '-shell-escape',
            },
        }

        vim.g.vimtex_quickfix_ignore_filters = {
            '.*LaTeX hooks Warning: Generic hook.*'
        }
    end
}
