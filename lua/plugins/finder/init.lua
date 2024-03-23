return {
    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        build = { 'cargo install ripgrep', 'cargo install fd-find', },
        cmd = "Telescope",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            "nvim-lua/plenary.nvim",
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'gmake',
                config = function()
                    require('telescope').load_extension('fzf')
                end
            },

        },
    },

    {
        "nvim-telescope/telescope-frecency.nvim",
        keys = {
            {'<Leader>f', mode = 'n'},
        },
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("telescope").load_extension "frecency"
            require('telescope').setup {
                extensions = {
                    frecency = {
                        ignore_patterns = { "*.git/*", "*/tmp/*", "*.txt" },
                    }
                },
            }
            vim.keymap.set("n", "<Leader>f", "<Cmd>Telescope frecency<CR>")
        end,
    },
}
