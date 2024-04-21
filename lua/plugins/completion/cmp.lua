local cmp = require'cmp'

local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

-- gray
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
-- blue
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
-- light blue
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
-- pink
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
-- front
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })

local luasnip = require('luasnip')

cmp.setup({
    formatting = {
	format = function(entry, vim_item)
	    -- Kind icons
	    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
	    -- Source
	    vim_item.menu = ({
		buffer = "[Buffer]",
		nvim_lsp = "[LSP]",
		luasnip = "[LuaSnip]",
		nvim_lua = "[Lua]",
		path = "[Path]",
	    })[entry.source.name]
	    return vim_item
	end
    },
    snippet = {
	expand = function(args)
	    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	end,
    },
    window = {
	-- completion = cmp.config.window.bordered(),
	documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
	['<C-b>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-y>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.abort(),
	['<CR>'] = cmp.mapping(function(fallback)
	    if cmp.visible() then
		if luasnip.expandable() then
		    luasnip.expand()
		elseif cmp.get_active_entry() then
		    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
		end
	    else
		fallback()
	    end
	end),

	["<Tab>"] = cmp.mapping(function(fallback)
	    if cmp.visible() then
		cmp.select_next_item()
	    elseif luasnip.locally_jumpable(1) then
		luasnip.jump(1)
	    else
		fallback()
	    end
	end, { "i", "s" }),

	["<S-Tab>"] = cmp.mapping(function(fallback)
	    if cmp.visible() then
		cmp.select_prev_item()
	    elseif luasnip.locally_jumpable(-1) then
		luasnip.jump(-1)
	    else
		fallback()
	    end
	end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	-- { name = 'vsnip' }, -- For vsnip users.
	{ name = 'luasnip' }, -- For luasnip users.
	-- { name = 'ultisnips' }, -- For ultisnips users.
	-- { name = 'snippy' }, -- For snippy users.
    }, {
	    { name = 'buffer' },
    })
})


cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
	{ name = 'git' },
    }, {
	    { name = 'buffer' },
    })
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
	{ name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
	{ name = 'nvim_lua' },
	{ name = 'path' }
    }, {
	    { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})


local cmp_autopairs = require "nvim-autopairs.completion.cmp"
require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
