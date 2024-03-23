return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufRead", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ':TSUpdate',
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "vim", "vimdoc", "c", "cpp", "rust", "python", "fish" },

                highlight = {
                    enable = true,
                    use_languagetree = true,
                },

                indent = { enable = true },
            })
        end,
    },
}
