return {
    {
        'echasnovski/mini.comment',
        version = false,
        keys = {
            {'gc', mode = { 'n', 'x', 'o', } },
        },
        config = function()
            require('mini.comment').setup({
                options = {
                    ignore_blank_line = true,
                },
            })
        end
    },

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
