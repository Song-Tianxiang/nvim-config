local autocmd = vim.api.nvim_create_autocmd
local autogrp = vim.api.nvim_create_augroup

local o = vim.o
local f = vim.fn

autocmd({'BufRead'}, {
    desc = "auto jump to last position",
    group = autogrp('restore-cursor', { clear = true }),
    buffer = 0,
    callback = function()
        local line = f.line("'\"")
        if line >= 1 and line <= f.line("$") and o.filetype ~= 'commit' and
            f.index({'xxd', 'gitrebase'}, o.filetype) == -1 then
            f.execute("normal! g`\"")
        end
    end,
    once = true,
})

autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
    group = autogrp('ui-entered-and-file-readed', { clear = true }),
    callback = function(args)
        local file = vim.api.nvim_buf_get_name(args.buf)
        local buftype = vim.api.nvim_buf_get_option(args.buf, "buftype")

        if not vim.g.ui_entered and args.event == "UIEnter" then
            vim.g.ui_entered = true
        end

        if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
            vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
            vim.api.nvim_del_augroup_by_name "ui-entered-and-file-readed"

            vim.schedule(function()
                vim.api.nvim_exec_autocmds("FileType", {})

                if vim.g.editorconfig then
                    require("editorconfig").config(args.buf)
                end
            end, 0)
        end
    end,
})
