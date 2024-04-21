return {
    {
	"windwp/nvim-autopairs",
	opts = {
	    disable_filetype = { "TelescopePrompt", },
	},
	config = function()
	    require("nvim-autopairs").setup(opts)

        end
    },

    {
	'hrsh7th/nvim-cmp',
	dependencies = {
	    "windwp/nvim-autopairs",

	    'neovim/nvim-lspconfig',
	    "ray-x/lsp_signature.nvim",

	    'hrsh7th/cmp-nvim-lsp',
	    'hrsh7th/cmp-buffer',
	    'hrsh7th/cmp-path',
	    'hrsh7th/cmp-cmdline',
	    'hrsh7th/cmp-nvim-lua',
	    'petertriho/cmp-git',

	    'L3MON4D3/LuaSnip',
	    'saadparwaiz1/cmp_luasnip'
	},
	config = function()
	    require('plugins.completion.cmp')
	end
    },

    {
	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp",
	dependencies = {
	    { "rafamadriz/friendly-snippets" },
	},
	opts = { history = true, updateevents = "TextChanged,TextChangedI" },
	config = function()
	    require("luasnip.loaders.from_vscode").lazy_load()
	    require("luasnip").config.set_config(opts)
	end
    },
}
