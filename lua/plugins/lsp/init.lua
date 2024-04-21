return {
    {
	"neovim/nvim-lspconfig",
	dependencies = {
	    'hrsh7th/nvim-cmp',
	    "ray-x/lsp_signature.nvim",
	},
	config = function ()
	    require('plugins.lsp.lspconfig')
	end
    },

    
	--    {
	-- "williamboman/mason.nvim",
	-- config = function()
	--     require("mason").setup()
	-- end
	--    },
	--
    {
	"ray-x/lsp_signature.nvim",
	config = function()
	    require "lsp_signature".setup({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		handler_opts = {
		    border = "rounded"
		}
	    })
	end
    }

}
