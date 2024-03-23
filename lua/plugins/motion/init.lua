return {
    {
        "ggandor/leap.nvim",
        keys = {
            {'f', mode = {'n', 'x', 'o'} },
            {'t', mode = {'n', 'x', 'o'} },
        },
        config = function()
            vim.keymap.set('n',        'f', '<Plug>(leap)')
            vim.keymap.set({'x', 'o'}, 'f', '<Plug>(leap-forward)')
            vim.keymap.set({'x', 'o'}, 't', '<Plug>(leap-backward)')

            require('leap').opts.safe_labels = 'tfnut/FNLHMUGTZ?'
            require('leap').opts.labels = 'fnjklhodweimbuyvrgtaqpcxz/FNJKLHODWEIMBUYVRGTAQPCXZ?'
        end
    },
}
