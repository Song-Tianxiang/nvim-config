return {
    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        cmd = "Telescope",
        keys = {
            {'<Leader>ff', mode = 'n'},
            {'<Leader>fb', mode = 'n'},
        },
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
	config = function()
            vim.keymap.set("n", "<Leader>fb", "<Cmd>Telescope buffers<CR>")
	end,
    },

    {
        "nvim-telescope/telescope-frecency.nvim",
        keys = {
            {'<Leader>ff', mode = 'n'},
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
            vim.keymap.set("n", "<Leader>ff", "<Cmd>Telescope frecency<CR>")
        end,
    },

    {
        'pbogut/fzf-mru.vim',
        dependencies = {
            'junegunn/fzf',
        },
        cmd = 'FZFMru',
    }
}
