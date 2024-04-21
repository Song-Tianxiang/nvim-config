local o = vim.opt
local g = vim.g

g.mapleader = ' '
g.maplocalleader = '\\'

o.termguicolors = true
vim.cmd.colorscheme('retrobox')

o.number = true
o.cursorline = true
o.cursorlineopt = 'number'

o.tabstop = 8
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = false

o.ignorecase = true
o.smartcase = true

o.incsearch = true
o.hlsearch = false

o.belloff = 'all'
o.wildoptions = { 'fuzzy', 'pum' }
o.shortmess:append({ I = true, c = true })
o.hidden = true
o.showmode = false
o.showcmd = true
o.laststatus = 3
o.signcolumn = 'yes'

o.timeout = false
o.ttimeout = true
o.ttimeoutlen = 0

o.undofile = true
o.swapfile = true
o.backup = true
o.backupdir:remove({ '.' })

vim.g["loaded_node_provider"] = 0
vim.g["loaded_python3_provider"] = 0
vim.g["loaded_perl_provider"] = 0
vim.g["loaded_ruby_provider"] = 0

vim.g['loaded_matchparen'] = 1
vim.g['loaded_gzip'] = 1
vim.g['loaded_zip'] = 1
vim.g['loaded_zipPlugin'] = 1
vim.g['loaded_tar'] = 1
vim.g['loaded_tarPlugin'] = 1
vim.g['loaded_netrw'] = 1
vim.g['loaded_netrwPlugin'] = 1
