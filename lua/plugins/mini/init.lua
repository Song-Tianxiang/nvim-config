return {

    {
        'echasnovski/mini.indentscope',
        version = false,
        event = 'User FilePost',
        keys = {
            {'ai', mode = { 'o' } },
            {'ii', mode = { 'o' } },
            {'[i', mode = { 'n' } },
            {']i', mode = { 'n' } },
        },
        config = function()
            require('mini.indentscope').setup({
                options = {
                    indent_at_cursor = false,
                    try_as_border = true,
                },
                symbol = '│',
            })
        end,
    },

    {
        'echasnovski/mini.statusline',
        version = false,
        config = function()
            require('mini.statusline').setup({
                set_vim_settings = false,
            })
        end
    },
}
