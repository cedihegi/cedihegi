return {
    -- highlight indentation:
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        require('ibl').setup()
    end,
}
