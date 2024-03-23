return {
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        keys = {
            {"<C-n>", mode = "n"},
            {"<Leader>n", mode = "n"},
        },
        opts = function()
            return require "plugins.file-manager.nvimtree"
        end,
        config = function(_, opts)
            require("nvim-tree").setup(opts)

            vim.keymap.set("n", "<C-n>", "<CMD>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
            vim.keymap.set("n", "<Leader>n", "<CMD>NvimTreeFocus<CR>", { desc = "Nvimtree Focus window" })
        end,
    },
}
